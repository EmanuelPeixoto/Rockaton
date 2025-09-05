# Rockaton
Projeto para o Hackaton da SCTI, em parceria com a Rocketseat

Dupla com @BMSales

## Como Executar

Para executar o projeto, siga os passos abaixo:

1. **Instale as dependências:**

   ```bash
   go mod tidy
   npm install @mui/material @emotion/react @emotion/styled
   ```

2. **Popule o banco de dados:**

   ```bash
   ./populate_db.sh
   ```

3. **Execute o servidor backend:**

   ```bash
   air
   ```

4. **Execute o servidor frontend:**

   ```bash
   npm run dev
   ```

O servidor backend estará disponível em `http://localhost:8080`.

O servidor frontend estará disponível no endereço fornecido pelo processo.

### Endpoints

- `GET /projetos`: Retorna todos os projetos.
- `GET /projetos/:id`: Retorna um projeto específico.
