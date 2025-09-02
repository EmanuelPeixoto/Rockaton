# Conexão com o banco de dados
DB="rockaton.db"

# Criação da tabela
sqlite3 $DB <<OMG
CREATE TABLE IF NOT EXISTS projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    coordenador TEXT,
    projeto TEXT,
    programa TEXT,
    instituicao TEXT,
    fonte TEXT
);
OMG

# Inserção de dados do CBB
sqlite3 $DB <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('ALBA LUCÍNIA PEIXOTO RANGEL', 'Divulgação científica como ferramenta para creditação da extensão e difusão e popularização de conhecimentos científicos sobre a toxoplasmose.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANA ELIZA ZERAIK', 'Alfabetização, letramento e despertar científico.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG

# Inserção de dados do CCH
sqlite3 $DB <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('DAVID MACIEL DE MELLO NETO', 'Diagnóstico da política pública em segurança alimentar e nutricional para o Município de Campos dos Goytacazes (RJ) – décimo segundo ano', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('EDSON TERRA AZEVEDO FILHO', 'TECCOM - Divulgação de empreendedorismo e inovação na comunidade do Norte Fluminense', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG

# Inserção de dados do CCT
sqlite3 $DB <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('ALCIMAR DAS CHAGAS RIBEIRO', 'Núcleo de pesquisa econômica do Rio de Janeiro NUPERJ', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CARLOS LEONARDO RAMOS', 'Transferência de tecnologia para otimização de rotas e redução dos custos operacionais em empresas de coleta seletiva', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG

# Inserção de dados do CCTA
sqlite3 $DB <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('ALMYR JUNIOR CORDEIRO DE CARVALHO', 'Cultivares de abacaxizeiros resistentes a fusariose: Estudo da cadeia produtiva e difusão de tecnologias.', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANA BÁRBARA FREITAS RODRIGUES GODINHO', 'Implementação de uma nova metodologia didática inclusiva para o estudo e conhecimento da anatomia animal', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG
