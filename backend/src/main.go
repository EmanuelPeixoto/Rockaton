package main

import (
	"database/sql"
	"log"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
	_ "github.com/mattn/go-sqlite3"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
	"rockaton/docs"
)

type Projeto struct {
	ID          int     `json:"id"`
	Coordenador string  `json:"coordenador"`
	Projeto     string  `json:"projeto"`
	Programa    *string `json:"programa"`
	Instituicao string  `json:"instituicao"`
	Tipo        string  `json:"tipo"`
}

type Instituicao struct {
	Nome string `json:"nome"`
	Link string `json:"link"`
}

type Interesse struct {
	ID        int    `json:"id"`
	Nome      string `json:"nome" binding:"required"`
	Email     string `json:"email" binding:"required,email"`
	Telefone  string `json:"telefone"`
	ProjetoID int    `json:"projeto_id"`
}

func CriarInteresse(c *gin.Context) {
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database connection not found"})
		return
	}
	sqlDB := db.(*sql.DB)

	projetoID := c.Param("id")
	var interesse Interesse
	if err := c.ShouldBindJSON(&interesse); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var existingProjetoID int
	err := sqlDB.QueryRow("SELECT id FROM projetos WHERE id = ?", projetoID).Scan(&existingProjetoID)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "Projeto not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Error checking project existence"})
		return
	}

	interesse.ProjetoID = existingProjetoID

	stmt, err := sqlDB.Prepare("INSERT INTO interesses (nome, email, telefone, projeto_id) VALUES (?, ?, ?, ?)")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao preparar comando SQL para interesse"})
		return
	}
	defer stmt.Close()

	res, err := stmt.Exec(interesse.Nome, interesse.Email, interesse.Telefone, interesse.ProjetoID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao inserir interesse"})
		return
	}

	id, err := res.LastInsertId()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao recuperar ID do interesse"})
		return
	}
	interesse.ID = int(id)

	c.JSON(http.StatusCreated, interesse)
}

func ListarInteressesInstituicao(c *gin.Context) {
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database connection not found"})
		return
	}
	sqlDB := db.(*sql.DB)

	instituicaoParam := strings.ToUpper(c.Param("instituicao"))

	rows, err := sqlDB.Query(`
		SELECT i.id, i.nome, i.email, i.telefone, i.projeto_id
		FROM interesses i
		JOIN projetos p ON i.projeto_id = p.id
		WHERE p.instituicao = ?`, instituicaoParam)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar interesses da instituição"})
		return
	}
	defer rows.Close()

	interesses := []Interesse{}
	for rows.Next() {
		var interesse Interesse
		err := rows.Scan(&interesse.ID, &interesse.Nome, &interesse.Email, &interesse.Telefone, &interesse.ProjetoID)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao escanear interesse"})
			return
		}
		interesses = append(interesses, interesse)
	}

	if len(interesses) == 0 {
		c.JSON(http.StatusNotFound, gin.H{"message": "Nenhum interesse encontrado para esta instituição"})
		return
	}

	c.JSON(http.StatusOK, interesses)
}

func DeletarInteresse(c *gin.Context) {
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database connection not found"})
		return
	}
	sqlDB := db.(*sql.DB)

	interesseID := c.Param("id")
	adminInstituicao := strings.ToUpper(c.Param("instituicao")) // Get institution from admin context

	var projetoID int
	err := sqlDB.QueryRow("SELECT projeto_id FROM interesses WHERE id = ?", interesseID).Scan(&projetoID)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "Interesse não encontrado"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar interesse"})
		return
	}

	var projetoInstituicao string
	err = sqlDB.QueryRow("SELECT instituicao FROM projetos WHERE id = ?", projetoID).Scan(&projetoInstituicao)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar instituição do projeto"})
		return
	}

	if strings.ToUpper(projetoInstituicao) != adminInstituicao {
		c.JSON(http.StatusForbidden, gin.H{"error": "Você não tem permissão para deletar este interesse"})
		return
	}

	stmt, err := sqlDB.Prepare("DELETE FROM interesses WHERE id = ?")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao preparar comando SQL para deletar interesse"})
		return
	}
	defer stmt.Close()

	res, err := stmt.Exec(interesseID)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao deletar interesse"})
		return
	}

	rowsAffected, _ := res.RowsAffected()
	if rowsAffected == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Interesse não deletado"})
		return
	}

	c.Status(http.StatusNoContent)
}

func GetProjetos(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	rows, err := sqlDB.Query("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar projetos"})
		return
	}
	defer rows.Close()

	projetos := []Projeto{}
	for rows.Next() {
		var p Projeto
		err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao escanear projeto"})
			return
		}
		projetos = append(projetos, p)
	}

	c.JSON(http.StatusOK, projetos)
}

func GetProjetoByID(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	id := c.Param("id")

	var p Projeto
	err := sqlDB.QueryRow("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos WHERE id = ?", id).Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"message": "Projeto not found"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar projeto por ID"})
		return
	}

	c.JSON(http.StatusOK, p)
}

func GetInstituicoes(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	rows, err := sqlDB.Query("SELECT nome, link FROM instituicoes")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar instituições"})
		return
	}
	defer rows.Close()

	instituicoes := []Instituicao{}
	for rows.Next() {
		var i Instituicao
		err := rows.Scan(&i.Nome, &i.Link)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao escanear instituição"})
			return
		}
		instituicoes = append(instituicoes, i)
	}

	c.JSON(http.StatusOK, instituicoes)
}

func GetProjetosByInstituicao(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	instituicao := strings.ToUpper(c.Param("instituicao"))

	rows, err := sqlDB.Query("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos WHERE instituicao = ?", instituicao)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar projetos por instituição"})
		return
	}
	defer rows.Close()

	projetos := []Projeto{}
	for rows.Next() {
		var p Projeto
		err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao escanear projeto por instituição"})
			return
		}
		projetos = append(projetos, p)
	}

	c.JSON(http.StatusOK, projetos)
}

func GetProjetosByInstituicaoAndTipo(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	instituicao := strings.ToUpper(c.Param("instituicao"))
	tipo := strings.ToUpper(c.Param("tipo"))

	rows, err := sqlDB.Query("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos WHERE instituicao = ? AND tipo = ?", instituicao, tipo)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar projetos por instituição e tipo"})
		return
	}
	defer rows.Close()

	projetos := []Projeto{}
	for rows.Next() {
		var p Projeto
		err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao escanear projeto por instituição e tipo"})
			return
		}
		projetos = append(projetos, p)
	}

	c.JSON(http.StatusOK, projetos)
}

func AdminCreateProjeto(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	inst := strings.ToUpper(c.Param("instituicao"))
	var p Projeto
	if err := c.ShouldBindJSON(&p); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// força instituição da rota
	p.Instituicao = inst

	stmt, err := sqlDB.Prepare("INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES (?, ?, ?, ?, ?)")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao preparar comando SQL para criar projeto"})
		return
	}
	defer stmt.Close()

	res, err := stmt.Exec(p.Coordenador, p.Projeto, p.Programa, p.Instituicao, p.Tipo)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao inserir projeto"})
		return
	}

	id, err := res.LastInsertId()
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao recuperar ID do projeto"})
		return
	}
	p.ID = int(id)

	c.JSON(http.StatusCreated, p)
}

func AdminUpdateProjeto(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	inst := strings.ToUpper(c.Param("instituicao"))
	id := c.Param("id")
	var p Projeto
	if err := c.ShouldBindJSON(&p); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	// Verifica se o projeto existe
	var existingInstituicao string
	err := sqlDB.QueryRow("SELECT instituicao FROM projetos WHERE id = ?", id).Scan(&existingInstituicao)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "Projeto não encontrado"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar projeto"})
		return
	}

	// Verifica se a instituição bate
	if existingInstituicao != inst {
		c.JSON(http.StatusForbidden, gin.H{"error": "Você não pode atualizar projeto de outra instituição"})
		return
	}

	p.Instituicao = inst

	stmt, err := sqlDB.Prepare("UPDATE projetos SET coordenador = ?, projeto = ?, programa = ?, instituicao = ?, tipo = ? WHERE id = ?")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao preparar comando SQL para atualizar projeto"})
		return
	}
	defer stmt.Close()

	res, err := stmt.Exec(p.Coordenador, p.Projeto, p.Programa, p.Instituicao, p.Tipo, id)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao atualizar projeto"})
		return
	}

	rowsAffected, _ := res.RowsAffected()
	if rowsAffected == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Projeto não atualizado"})
		return
	}

	c.JSON(http.StatusOK, p)
}

func AdminDeleteProjeto(c *gin.Context) {
	// Obtém a conexão com o banco de dados do contexto
	db, exists := c.Get("db")
	if !exists {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Conexão com o banco de dados não encontrada"})
		return
	}
	sqlDB := db.(*sql.DB)

	inst := strings.ToUpper(c.Param("instituicao"))
	id := c.Param("id")

	// Verifica se o projeto existe
	var existingInstituicao string
	err := sqlDB.QueryRow("SELECT instituicao FROM projetos WHERE id = ?", id).Scan(&existingInstituicao)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"error": "Projeto não encontrado"})
			return
		}
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao consultar projeto"})
		return
	}

	// Verifica se a instituição bate
	if existingInstituicao != inst {
		c.JSON(http.StatusForbidden, gin.H{"error": "Você não pode deletar projeto de outra instituição"})
		return
	}

	stmt, err := sqlDB.Prepare("DELETE FROM projetos WHERE id = ? AND instituicao = ?")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao preparar comando SQL para deletar projeto"})
		return
	}
	defer stmt.Close()

	res, err := stmt.Exec(id, inst)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Erro ao deletar projeto"})
		return
	}

	rowsAffected, _ := res.RowsAffected()
	if rowsAffected == 0 {
		c.JSON(http.StatusNotFound, gin.H{"error": "Projeto não deletado"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Projeto deletado com sucesso"})
}

func main() {
	db, err := sql.Open("sqlite3", "./rockaton.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	router := gin.Default()

	// Middleware para injetar o DB no contexto
	router.Use(func(c *gin.Context) {
		c.Set("db", db)
		c.Next()
	})

	docs.SwaggerInfo.Title = "Rockaton API"
	docs.SwaggerInfo.Description = "This is the API for the Rockaton project."
	docs.SwaggerInfo.Version = "1.0"
	docs.SwaggerInfo.Host = "localhost:8080"
	docs.SwaggerInfo.BasePath = "/"
	docs.SwaggerInfo.Schemes = []string{"http"}

	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	// Rotas públicas para projetos e instituições
	router.GET("/projetos", GetProjetos)
	router.GET("/projeto/:id", GetProjetoByID)
	router.GET("/instituicoes", GetInstituicoes)
	router.GET("/projetos/:instituicao", GetProjetosByInstituicao)
	router.GET("/projetos/:instituicao/:tipo", GetProjetosByInstituicaoAndTipo)

	// Rota para expressar interesse em um projeto
	router.POST("/api/projetos/:id/interesses", CriarInteresse)

	// Rotas administrativas (requerem autenticação/autorização, implícita pelo grupo /admin)
	admin := router.Group("/admin")
	{
		admin.POST("/:instituicao/projetos", AdminCreateProjeto)
		admin.PUT("/:instituicao/projetos/:id", AdminUpdateProjeto)
		admin.DELETE("/:instituicao/projetos/:id", AdminDeleteProjeto)

		// Rotas para gerenciar interesses
		admin.GET("/:instituicao/interesses", ListarInteressesInstituicao)
		admin.DELETE("/:instituicao/interesses/:id", DeletarInteresse)
	}

	router.Run(":8080")
}
