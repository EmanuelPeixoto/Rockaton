package main

import (
	"database/sql"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	_ "github.com/mattn/go-sqlite3"
)

type Projeto struct {
	ID          int    `json:"id"`
	Coordenador string `json:"coordenador"`
	Projeto     string `json:"projeto"`
	Programa    string `json:"programa"`
	Instituicao string `json:"instituicao"`
	Fonte       string `json:"fonte"`
}

func main() {
	db, err := sql.Open("sqlite3", "./rockaton.db")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	router := gin.Default()

	router.GET("/projetos", func(c *gin.Context) {
		rows, err := db.Query("SELECT id, coordenador, projeto, programa, instituicao, fonte FROM projetos")
		if err != nil {
			log.Fatal(err)
		}
		defer rows.Close()

		projetos := []Projeto{}
		for rows.Next() {
			var p Projeto
			err := rows.Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Fonte)
			if err != nil {
				log.Fatal(err)
			}
			projetos = append(projetos, p)
		}

		c.JSON(http.StatusOK, projetos)
	})

	router.GET("/projetos/:id", func(c *gin.Context) {
		id := c.Param("id")

		var p Projeto
		err := db.QueryRow("SELECT id, coordenador, projeto, programa, instituicao, fonte FROM projetos WHERE id = ?", id).Scan(&p.ID, &p.Coordenador, &p.Projeto, &p.Programa, &p.Instituicao, &p.Fonte)
		if err != nil {
			if err == sql.ErrNoRows {
				c.JSON(http.StatusNotFound, gin.H{"message": "Projeto not found"})
				return
			}
			log.Fatal(err)
		}

		c.JSON(http.StatusOK, p)
	})

	router.Run(":8080")
}