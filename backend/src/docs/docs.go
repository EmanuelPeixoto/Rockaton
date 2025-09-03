package docs

import "github.com/swaggo/swag"

const docTemplate = `{
    "swagger": "2.0",
    "info": {
        "description": "{{.Description}}",
        "title": "{{.Title}}",
        "contact": {},
        "version": "{{.Version}}"
    },
    "host": "{{.Host}}",
    "basePath": "{{.BasePath}}",
    "paths": {
        "/projetos": {
            "get": {
                "description": "Retorna uma lista com todos os projetos cadastrados no banco de dados.",
                "produces": ["application/json"],
                "summary": "Retorna todos os projetos",
                "responses": {
                    "200": {
                        "description": "Uma lista de projetos.",
                        "schema": { "type": "array", "items": { "$ref": "#/definitions/main.ProjetoResp" } }
                    }
                }
            }
        },
        "/projeto/{id}": {
            "get": {
                "description": "Retorna um único projeto correspondente ao ID fornecido.",
                "produces": ["application/json"],
                "summary": "Retorna um projeto pelo ID",
                "parameters": [
                    { "type": "integer", "description": "ID do Projeto", "name": "id", "in": "path", "required": true }
                ],
                "responses": {
                    "200": { "description": "O projeto correspondente ao ID.", "schema": { "$ref": "#/definitions/main.ProjetoResp" } },
                    "404": { "description": "Projeto não encontrado.", "schema": { "$ref": "#/definitions/main.ErrorResp" } }
                }
            }
        },
        "/instituicoes": {
            "get": {
                "description": "Retorna uma lista com todas as instituições cadastradas no banco de dados.",
                "produces": ["application/json"],
                "summary": "Retorna todas as instituições",
                "responses": {
                    "200": { "description": "Uma lista de instituições.", "schema": { "type": "array", "items": { "$ref": "#/definitions/main.Instituicao" } } }
                }
            }
        },
        "/projetos/{instituicao}": {
            "get": {
                "description": "Retorna uma lista de projetos para uma determinada instituição.",
                "produces": ["application/json"],
                "summary": "Retorna projetos por instituição",
                "parameters": [
                    { "type": "string", "description": "Sigla da Instituição", "name": "instituicao", "in": "path", "required": true }
                ],
                "responses": {
                    "200": { "description": "Uma lista de projetos da instituição especificada.", "schema": { "type": "array", "items": { "$ref": "#/definitions/main.ProjetoResp" } } },
                }
            }
        },
        "/projetos/{instituicao}/{tipo}": {
            "get": {
                "description": "Retorna uma lista de projetos para uma determinada instituição e tipo.",
                "produces": ["application/json"],
                "summary": "Retorna projetos por instituição e tipo",
                "parameters": [
                    { "type": "string", "description": "Sigla da Instituição", "name": "instituicao", "in": "path", "required": true },
                    { "type": "string", "description": "Tipo do projeto", "name": "tipo", "in": "path", "required": true }
                ],
                "responses": {
                    "200": { "description": "Uma lista de projetos da instituição e tipo especificados.", "schema": { "type": "array", "items": { "$ref": "#/definitions/main.ProjetoResp" } } },
                }
            }
        },
        "/admin/{instituicao}/projetos": {
            "post": {
                "description": "Cria um novo projeto para a instituição especificada.",
                "consumes": ["application/json"],
                "produces": ["application/json"],
                "summary": "Cria um projeto para a instituição",
                "parameters": [
                    { "type": "string", "description": "Sigla da Instituição", "name": "instituicao", "in": "path", "required": true },
                    { "description": "Objeto do Projeto", "name": "projeto", "in": "body", "required": true, "schema": { "$ref": "#/definitions/main.ProjetoPed" } }
                ],
                "responses": {
                    "201": { "description": "Projeto criado.", "schema": { "$ref": "#/definitions/main.ProjetoResp" } }
                }
            }
        },
        "/admin/{instituicao}/projetos/{id}": {
            "put": {
                "description": "Atualiza um projeto existente para a instituição especificada.",
                "consumes": ["application/json"],
                "produces": ["application/json"],
                "summary": "Atualiza projeto da instituição",
                "parameters": [
                    { "type": "string", "description": "Sigla da Instituição", "name": "instituicao", "in": "path", "required": true },
                    { "type": "integer", "description": "ID do Projeto", "name": "id", "in": "path", "required": true },
                    { "description": "Objeto do Projeto", "name": "projeto", "in": "body", "required": true, "schema": { "$ref": "#/definitions/main.ProjetoPed" } }
                ],
                "responses": {
                    "200": { "description": "Projeto atualizado com sucesso.", "schema": { "$ref": "#/definitions/main.ProjetoResp" } },
                    "403": { "description": "A instituição da rota não corresponde à do projeto.", "schema": { "$ref": "#/definitions/main.ErrorResp" } },
                    "404": { "description": "Projeto não encontrado.", "schema": { "$ref": "#/definitions/main.ErrorResp" } }
                }
            },
            "delete": {
                "description": "Deleta um projeto da instituição especificada. A operação é irreversível.",
                "produces": ["application/json"],
                "summary": "Deleta projeto da instituição",
                "parameters": [
                    { "type": "string", "description": "Sigla da Instituição", "name": "instituicao", "in": "path", "required": true },
                    { "type": "integer", "description": "ID do Projeto", "name": "id", "in": "path", "required": true }
                ],
                "responses": {
                    "200": { "description": "Projeto deletado com sucesso.", "schema": { "$ref": "#/definitions/main.ProjetoResp" } },
                    "403": { "description": "A instituição da rota não corresponde à do projeto.", "schema": { "$ref": "#/definitions/main.ErrorResp" } },
                    "404": { "description": "Projeto não encontrado.", "schema": { "$ref": "#/definitions/main.ErrorResp" } }
                }
            }
        }
    },
    "definitions": {
        "main.ErrorResp": {
            "type": "object",
            "properties": {
                "error": { "type": "string" }
            }
        },
        "main.Instituicao": {
            "type": "object",
            "properties": {
                "nome": { "type": "string" },
                "link": { "type": "string" }
            }
        },
        "main.ProjetoPed": {
            "type": "object",
            "properties": {
                "coordenador": { "type": "string" },
                "projeto": { "type": "string" },
                "programa": { "type": "string" },
                "tipo": { "type": "string" }
            }
        },
        "main.ProjetoResp": {
            "type": "object",
            "properties": {
                "id": { "type": "integer" },
                "coordenador": { "type": "string" },
                "projeto": { "type": "string" },
                "programa": { "type": "string" },
                "instituicao": { "type": "string" },
                "tipo": { "type": "string" }
            }
        }
    }
}`

// SwaggerInfo holds exported Swagger Info so clients can modify it
var SwaggerInfo = &swag.Spec{
    Version:          "",
    Host:             "",
    BasePath:         "",
    Schemes:          []string{},
    Title:            "",
    Description:      "",
    InfoInstanceName: "swagger",
    SwaggerTemplate:  docTemplate,
}

func init() {
    swag.Register(SwaggerInfo.InstanceName(), SwaggerInfo)
}
