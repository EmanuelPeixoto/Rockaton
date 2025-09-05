# Rockaton
### código: CBMgy
Projeto para o Hackaton da SCTI, em parceria com a Rocketseat

Dupla com @BMSales

## Como Executar

Para executar o projeto, siga os passos abaixo:

1. **Inicie o ambiente nix:**

   ```bash
   nix develop
   ```

Caso não queira usar nix, instale as dependencias de dentro do flake.nix manualmente.

2. **Instale as dependências:**

   ```bash
   cd frontend && npm i
   ```

3. **Popule o banco de dados:**

   ```bash
   cd backend/src && ./populate_db.sh
   ```

4. **Execute o servidor backend:**

   ```bash
   cd backend/src && air
   ```

5. **Execute o servidor frontend:**

   ```bash
   cd frontend && npm run dev
   ```

O servidor backend estará disponível em `http://localhost:8080`.
O servidor frontend estará disponível em `http://localhost:5173`.

O servidor frontend estará disponível no endereço fornecido pelo processo.

### Endpoints

- `http://localhost:8080/swagger`: Documentação dos endpoints
