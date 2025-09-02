# Rockaton
Projeto para o Hackaton da SCTI, em parceria com a Rocketseat

Dupla com @BMSales

## Como Executar

Para executar o projeto, siga os passos abaixo:

1. **Instale as dependências:**

   ```bash
   go mod tidy
   ```

2. **Popule o banco de dados:**

   ```bash
   ./populate_db.sh
   ```

3. **Execute o servidor:**

   ```bash
   air
   ```

O servidor estará disponível em `http://localhost:8080`.

### Endpoints

- `GET /projetos`: Retorna todos os projetos.
- `GET /projetos/:id`: Retorna um projeto específico.
