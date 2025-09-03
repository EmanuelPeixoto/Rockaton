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

func main() {
	db, err := sql.Open("sqlite3", "./rockaton.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	router := gin.Default()

	docs.SwaggerInfo.Title = "Rockaton API"
	docs.SwaggerInfo.Description = "This is the API for the Rockaton project."
	docs.SwaggerInfo.Version = "1.0"
	docs.SwaggerInfo.Host = "localhost:8080"
	docs.SwaggerInfo.BasePath = "/"
	docs.SwaggerInfo.Schemes = []string{"http"}

	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))

	router.GET("/projetos", func(c *gin.Context) {
		rows, err := db.Query("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos")
		if err != nil {
			log.Fatal(err)
		}
		defer rows.Close()

		projetos := []Projeto{}
		for rows.Next() {
			var p Projeto
			err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
			if err != nil {
				log.Fatal(err)
			}
			projetos = append(projetos, p)
		}

		c.JSON(http.StatusOK, projetos)
	})

	router.GET("/projeto/:id", func(c *gin.Context) {
		id := c.Param("id")

		var p Projeto
		err := db.QueryRow("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos WHERE id = ?", id).Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
		if err != nil {
			if err == sql.ErrNoRows {
				c.JSON(http.StatusNotFound, gin.H{"message": "Projeto not found"})
				return
			}
			log.Fatal(err)
		}

		c.JSON(http.StatusOK, p)
	})

	router.GET("/instituicoes", func(c *gin.Context) {
		rows, err := db.Query("SELECT nome, link FROM instituicoes")
		if err != nil {
			log.Fatal(err)
		}
		defer rows.Close()

		instituicoes := []Instituicao{}
		for rows.Next() {
			var i Instituicao
			err := rows.Scan(&i.Nome, &i.Link)
			if err != nil {
				log.Fatal(err)
			}
			instituicoes = append(instituicoes, i)
		}

		c.JSON(http.StatusOK, instituicoes)
	})

	router.GET("/projetos/:instituicao", func(c *gin.Context) {
		instituicao := strings.ToUpper(c.Param("instituicao"))

		rows, err := db.Query("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos WHERE instituicao = ?", instituicao)
		if err != nil {
			log.Fatal(err)
		}
		defer rows.Close()

		projetos := []Projeto{}
		for rows.Next() {
			var p Projeto
			err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
			if err != nil {
				log.Fatal(err)
			}
			projetos = append(projetos, p)
		}

		c.JSON(http.StatusOK, projetos)
	})

	router.GET("/projetos/:instituicao/:tipo", func(c *gin.Context) {
		instituicao := strings.ToUpper(c.Param("instituicao"))
		tipo := strings.ToUpper(c.Param("tipo"))

		rows, err := db.Query("SELECT id, coordenador, projeto, programa, instituicao, tipo FROM projetos WHERE instituicao = ? AND tipo = ?", instituicao, tipo)
		if err != nil {
			log.Fatal(err)
		}
		defer rows.Close()

		projetos := []Projeto{}
		for rows.Next() {
			var p Projeto
			err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Tipo)
			if err != nil {
				log.Fatal(err)
			}
			projetos = append(projetos, p)
		}

		c.JSON(http.StatusOK, projetos)
	})

	admin := router.Group("/admin")
	{
		admin.POST("/projetos", func(c *gin.Context) {
			var p Projeto
			if err := c.ShouldBindJSON(&p); err != nil {
				c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
				return
			}

			stmt, err := db.Prepare("INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES (?, ?, ?, ?, ?)")
			if err != nil {
				log.Fatal(err)
			}
			defer stmt.Close()

			res, err := stmt.Exec(p.Coordenador, p.Projeto, p.Programa, p.Instituicao, p.Tipo)
			if err != nil {
				log.Fatal(err)
			}

			id, err := res.LastInsertId()
			if err != nil {
				log.Fatal(err)
			}

			p.ID = int(id)

			c.JSON(http.StatusCreated, p)
		})

		admin.PUT("/projetos/:id", func(c *gin.Context) {
			id := c.Param("id")

			var p Projeto
			if err := c.ShouldBindJSON(&p); err != nil {
				c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
				return
			}

			stmt, err := db.Prepare("UPDATE projetos SET coordenador = ?, projeto = ?, programa = ?, instituicao = ?, tipo = ? WHERE id = ?")
			if err != nil {
				log.Fatal(err)
			}
			defer stmt.Close()

			_, err = stmt.Exec(p.Coordenador, p.Projeto, p.Programa, p.Instituicao, p.Tipo, id)
			if err != nil {
				log.Fatal(err)
			}

			c.JSON(http.StatusOK, p)
		})

		admin.DELETE("/projetos/:id", func(c *gin.Context) {
			id := c.Param("id")

			stmt, err := db.Prepare("DELETE FROM projetos WHERE id = ?")
			if err != nil {
				log.Fatal(err)
			}
			defer stmt.Close()

			_, err = stmt.Exec(id)
			if err != nil {
				log.Fatal(err)
			}

			c.JSON(http.StatusOK, gin.H{"message": "Projeto deletado com sucesso"})
		})
	}

	router.Run(":8080")
}
