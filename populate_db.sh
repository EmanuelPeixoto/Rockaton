# Conexão com o banco de dados
PSQL="psql -U postgres -d rockaton"

# Criação da tabela
$PSQL <<OMG
CREATE TABLE IF NOT EXISTS projetos (
    id SERIAL PRIMARY KEY,
    coordenador VARCHAR(255),
    projeto TEXT,
    programa VARCHAR(255),
    instituicao VARCHAR(255),
    fonte VARCHAR(255)
);
OMG

# Inserção de dados do CBB
$PSQL <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('ALBA LUCÍNIA PEIXOTO RANGEL', 'Divulgação científica como ferramenta para creditação da extensão e difusão e popularização de conhecimentos científicos sobre a toxoplasmose.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANA ELIZA ZERAIK', 'Alfabetização, letramento e despertar científico.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANNA L. OKOROKOVA FAÇANHA', 'Semeando ConsCiência: Mulheres e Meninas na Democratização da Ciência com Diversidade & Inclusão', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANTÔNIO JESUS DORIGHETTO COGO', 'Do corpo à mente: avaliação de composição corporal e Aspectos psicológicos na promoção da saúde e bem-estar.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ARNOLDO ROCHA FAÇANHA', '“Equilíbrio Corpo e Mente - KICKBOXING E CALISTENIA"', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CARLOS EDUARDO VEIGA DE CARVALHO', 'Educação ambiental em colônias de pescadores e escolas municipais de Campos dos Goytacazes/RJ e adjacências quanto aos impactos ambientais causados por atividades offshore em vertebrados marinhos', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CARLOS RAMON RUIZ-MIRANDA', 'O Mico-leão-dourado como espécie bandeira para a conservação da biodiversidade no centro norte fluminense: educação ambiental, engajamento social e monitoramento de fauna.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CARYNE APARECIDA DE CARVALHO BRAGA', 'Mastocafé: divulgando o conhecimento e promovendo a conservação de mamíferos em redes sociais de amplo alcance', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CESAR AUGUSTO MARCELINO MENDES CORDEIRO', 'Lente Ecológica – conhecendo as espécies do Norte Fluminense com ciência cidadã', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('DENISE SARAIVA DAGNINO', 'O ensino de química na região do norte-fluminense e adjacências – despertando o interesse para a disciplina', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('Elena Lassounskaia', 'Paratuberculose bovina em propriedades leiteiras da região Norte e Noroeste Fluminense: programa integrado de prevenção da doença e detecção de animais infectados – segunda fase', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ILANA ROSENTAL', 'Praia com Vida": Busca por engajamento popular para conservação da biodiversidade e sustentabilidade socioambiental de praias arenosas do Norte Fluminense.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('JOÃO CARLOS DE AQUINO ALMEIDA', 'Educação, Ciência e Saúde: Bioética e Sustentabilidade.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARCELO TRINDADE NASCIMENTO', 'O Herbário HUENF Como Espaço Não Formal Para o Ensino da Biodiversidade da Flora do Norte e Noroeste Fluminense.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARCOS SARMET MOREIRA DE BARROS SALOMÃO', 'Educação ambiental cidadã: Parceria entre o Projeto Piabanha e a UENF para a conservação de peixes ameaçados de extinção do Rio Paraíba do Sul.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARIA CRISTINA GAGLIANONE', 'Trilhas das Abelhas', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARINA SATIKA SUZUKI', 'Ciência pra gente VI', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MAURA DA CUNHA', 'TRILHA DO MANGUE FUNDO: EDUCAÇÃO AMBIENTAL EM RESTINGA', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('OLGA LIMA TAVARES MACHADO', '“ALTERNÂNCIA” - Orientações Alternativas na Prevenção de Transtorno de Ansiedade', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('PAULO PEDROSA', 'O rio Paraíba do Sul é nosso: integrando monitoramento e educação ambiental.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('RENATO AUGUSTO DA MΑΤΤΑ', 'Letramento científico de alunos do ensino básico através de aulas práticas investigativas e a formação continuada de professores de ciências: ano V.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('TÂNIA JACINTO', 'Desenvolvimento e sedimentação da conscientização infanto-juvenil para a importância da conservação do patrimônio ambiental.', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('VICTOR MARTIN QUINTANA FLORES', 'Divulgação científica: uso do Instagram para compartilhamento de projetos sustentáveis em restinga (parte 2)', 'CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG

# Inserção de dados do CCH
$PSQL <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('DAVID MACIEL DE MELLO NETO', 'Diagnóstico da política pública em segurança alimentar e nutricional para o Município de Campos dos Goytacazes (RJ) – décimo segundo ano', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('EDSON TERRA AZEVEDO FILHO', 'TECCOM - Divulgação de empreendedorismo e inovação na comunidade do Norte Fluminense', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ELIANA CRISPIM FRANÇA LUQUETTI', 'Conhecimentos linguísticos e pedagógicos para a consolidação formativa de futuros professores dos anos iniciais do ensino fundamental I', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('GIOVANE DO NASCIMENTO', 'Expressões culturais do interior: mapeamento sonoro e performance no Jongo da Rasa e na Ciranda da Baía Formosa em Armação dos Búzios', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('HUGO ALBERTO BORSANI CARDOZO', 'Arte e memória política na escola: o Brasil contemporâneo através da música', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('LEANDRO GARCIA PINHO', 'Pesca artesanal na escola: conhecimento, cultura e tradição em São Francisco de Itabapoana.', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('LILIAN SAGIO CEZAR', 'Projeto de Pesquisa e Extensão Universitária “Diálogos entre saberes na Unidade Experimental de Som e Imagem: comunicação popular e midiática a partir da Capoeira e do NEABI – UENF”', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('LUCIANE SOARES DA SILVA', 'Maíra: uma proposta de web rádio universitária e latino-americana', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARIA CLARETH', '10 anos do Neabi Uenf: Ações afirmativas e educação étnico-racial.', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('NILO LIMA DE AZEVEDO', 'Observatório das Metrópoles e Conexões Urbanas: Articulando Academia, Sociedade e Gestão Pública no Norte Fluminense', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ROSALEE SANTOS CRESPO ISTOE', 'Bem viver na terceira idade', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('SERGIO ARRUDA DE MOURA', 'Alfabetização e letramento literário através da literatura campista: por uma educação decolonial e inclusiva.', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('SHIRLENA CAMPOS DE SOUZA AMARAL', 'Educação em Direitos Humanos e respeito à diversidade: em pauta racismo e homofobia na escola', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('SILVIA ALICIA MARTINEZ', 'Memória e Patrimônio Escolar: divulgação do conhecimento e preservação do patrimônio histórico educativo', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('TERESA DE JESUS PEIXOTO', 'Políticas públicas e espera: ações para garantia e preservação de direitos, em programas habitacionais.', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('VERUSCA MOSS SIMÕES DOS REIS', 'Oficinas filosóficas em ciência, tecnologia e Sociedade (cts)”', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('VITOR DE MORAES PEIXOTO', 'Pré-Vest UENF: Uma Iniciativa Voluntária para a Democratização do Ensino Superior Público de Qualidade.', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('WANIA AMÉLIA BELCHIOR MESQUITA', 'Do ponto de vista dos jovens: a cidadania e o modo de vida em São João da Barra-RJ', 'CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG

# Inserção de dados do CCT
$PSQL <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('ALCIMAR DAS CHAGAS RIBEIRO', 'Núcleo de pesquisa econômica do Rio de Janeiro NUPERJ', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CARLOS LEONARDO RAMOS', 'Transferência de tecnologia para otimização de rotas e redução dos custos operacionais em empresas de coleta seletiva', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CARLOS MAURÍCIO FONTES VIEIRA', 'UENF EM MOVIMENTO', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CIBELE MARIA STIVANIN DE ALMEIDA', 'Saponificando: a saboaria artesanal como ferramenta para educação e promoção do desenvolvimento sustentável', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('DIEGO JÚLIO PACHECO', 'Jogo Educacional em formato de audiogame para o ensino de matemática para deficientes visuais', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('EDMILSON JOSÉ MARIA', 'Estudo do controle e monitoramento do Aedes aegypti, através da produção e distribuição de repelente em barra e armadilhas de monitoramento em áreas endêmicas das Regiões Norte Fluminense, Lagos e Sul Capixaba.', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ELAINE CRISTINA PEREIRA', 'Difusão de conhecimento, treinamento e capacitação tecnológica, de profissionais liberais, estudantes e pessoas que atuam ou desejam atuar no ramo de soldagem.', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ELIANE BARBOSA SANTOS', 'Processamento e Análise de Dados Ambientais com R', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('FELIPE PERISSÉ DUARTE LOPES', 'Oficina de Energia Limpa de Baixo Custo (OELBC)', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('FREDERICO MUYLAERT MARGEM', 'Rede de Empreendedorismo Social', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('GUDELIA GUILLERMINA MORALES DE ARICA', 'Coleta seletiva: elo da cadeia de reciclagem e recuperação dos resíduos uma atividade da gestão de recursos Ano 6', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('JAN SCHRIPSEMA', 'O ensino de biologia vegetal na região do Norte Fluminense e adjacências para valorização do meio ambiente', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('JOSÉ RICARDO SIQUEIRA', 'Processamento e interpretação de imagens de satélite meteorológico durante a ocorrência de tempestades severas', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('LUIZ HENRIQUE ZEFERINO', 'Popularização de Aplicações da Impressão 3D e Robótica para Sustentabilidade, Educação e Tecnologia.', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('LUIS CESAR PASSONI', 'UENF TV', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MANUEL ANTONIO MOLINA PALMA', 'Apoio ao Programa de Incubação nos eixos de mercado e gestão', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARIA DA GLORIA ALVES', 'Educação, Cultura e Turismo na região da Costa Doce/ Geoparque Costões e Lagunas RJ', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARIA GERTRUDES ALVAREZ JUSTI DA SILVA', 'Tempo de aprender em clima de ensinar', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('MARIA PRISCILA PESSANHA DE CASTRO', 'A fotografia e as interações entre educação ciência e artes a partir do ensino de física.', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('NIANDER AGUIAR CERQUEIRA', 'Projetos de engenharia na prática: capacitação de profissionais da construção civil para leitura de projetos', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('NOAN TONINI SIMONASSI', 'FUTURO CRAQUE', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('RAUL ERNESTO LOPEZ PALACIO', 'Paraesporte, inclusão através do esporte.', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ROBERTO DA TRINDADE FARIA JUNIOR', 'Física interativa do cotidiano.', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('SEBASTIÃO DÉCIO COIMBRA DE SOUZA', 'Dinâmica do mercado imobiliário de habitação na cidade de Campos dos Goytacazes-RJ Fase III: Criação do site do projeto', 'CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG

# Inserção de dados do CCTA
$PSQL <<OMG
INSERT INTO projetos (coordenador, projeto, instituicao, fonte) VALUES
('ALMYR JUNIOR CORDEIRO DE CARVALHO', 'Cultivares de abacaxizeiros resistentes a fusariose: Estudo da cadeia produtiva e difusão de tecnologias.', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANA BÁRBARA FREITAS RODRIGUES GODINHO', 'Implementação de uma nova metodologia didática inclusiva para o estudo e conhecimento da anatomia animal', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANDRÉ LACERDA DE ABREU OLIVEIRA', 'Treinamento e capacitação de graduandos, Residentes e médicos veterinários em cirurgias utilizando Técnicas minimamente invasivas (videolaparoscopia, notes, Single port e microcirurgia) em animais de companhia do Norte fluminense..', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('ANTÔNIO GESUALDI JUNIOR', 'Introdução de ferramentas de controle de produção em sistemas pecuários na região Norte Fluminense e recomendações de ajustes. Ano IV', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CLAUDIA SALES MARINHO', 'Fruticultura arbórea: a muda em foco', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('DANIELA BARROS DE OLIVEIRA', 'Capacitação e treinamento de alunos do curso de licenciatura em ciências biológicas – EaD/UENF sobre a elaboração de iogurte e ênfase sob seus benefícios a saúde: Replicadores de ações proativas em comunidades – ANO IV', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('DEBORAH GUERRA BARROSO', 'Árvores da UENF: produtos e serviços', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('EMANUELA FORESTIERI DA GAMA RODRIGUES', 'Ciência do solo na escola: pensando no futuro', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('EULÓGIO CARLOS QUEIRÓZ DE CARVALHO', '"Versão Digital com Aperfeiçoamento, Expansão e Consolidação do Núcleo Avançado (Museu) de Ensino, Pesquisa e Extensão na Área de Morfologia Normal e Patológica da Universidade Estadual do Norte Fluminense Darcy Ribeiro” (Fluxo Contínuo).', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('FÁBIO CUNHA COELHO', 'Agroecologia: sensibilizando estudantes de ensino fundamental e médio e a terceira idade sobre a produção e consumo de alimentos mais saudáveis', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('FÁBIO DA COSTA HENRY', 'Avaliação das carnes comercializadas no Município de Campos dos Goytacazes - RJ', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('FERNANDA ANTUNES', 'Treinamento e capacitação de graduandos, residentes e médicos veterinários para anestesia e controle da dor em cirurgias, incluindo castrações, utilizando videocirurgia, notes e microcirurgia em animais de companhia do Norte Fluminense.', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('FRANCIMAR FERNANDES GOMES', 'Capacitação em boas práticas para a produção, comercialização e consumo do leite com segurança alimentar no município de Campos dos Goytacazes, RJ.', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('GERALDO DE AMARAL GRAVINA', 'Rede de Agroecologia: Formação, Introdução de Microprocessos de Beneficiamentos para Comercialização e Consumidor Parceiro em Campos dos Goytacazes (ANO 7).', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('HELAINE CRISTINE CANELA', 'O ensino da genética: viagem ao mundo invisível', 'CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
OMG
