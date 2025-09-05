# Conexão com o banco de dados
DB="rockaton.db"

# Criação das tabelas
sqlite3 $DB <<EOF
DROP TABLE IF EXISTS projetos;
CREATE TABLE IF NOT EXISTS projetos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    coordenador TEXT,
    projeto TEXT,
    programa TEXT,
    instituicao TEXT,
    tipo TEXT -- 'INDIVIDUAL', 'INSTITUCIONAL', 'PROGRAMA'
);

CREATE TABLE IF NOT EXISTS instituicoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    link TEXT
);

CREATE TABLE IF NOT EXISTS interesses (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    telefone TEXT,
    projeto_id INTEGER NOT NULL,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id)
);
EOF

# Inserção dos dados das instituições
sqlite3 $DB <<EOF
INSERT OR REPLACE INTO instituicoes (nome, link) VALUES
('CBB', 'https://uenf.br/portal/wp-content/uploads/2024/05/CBB-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CCH', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCH-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CCT', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCT-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf'),
('CCTA', 'https://uenf.br/portal/wp-content/uploads/2024/05/CCTA-PROJETOS-APROVADOS-EDITAL-PBEX-2024.pdf');
EOF

# Limpar tabela se já existir dados
sqlite3 $DB "DELETE FROM projetos;"

# Inserção de dados do CBB
sqlite3 $DB <<EOF
-- PROJETOS INDIVIDUAIS CBB
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('ALBA LUCÍNIA PEIXOTO RANGEL', 'Divulgação científica como ferramenta para creditação da extensão e difusão e popularização de conhecimentos científicos sobre a toxoplasmose.', NULL, 'CBB', 'INDIVIDUAL'),
('ANA ELIZA ZERAIK', 'Alfabetização, letramento e despertar científico.', NULL, 'CBB', 'INDIVIDUAL'),
('ANNA L. OKOROKOVA FAÇANHA', 'Semeando ConsCiência: Mulheres e Meninas na Democratização da Ciência com Diversidade & Inclusão', NULL, 'CBB', 'INDIVIDUAL'),
('ANTÔNIO JESUS DORIGHETTO COGO', 'Do corpo à mente: avaliação de composição corporal e Aspectos psicológicos na promoção da saúde e bem-estar.', NULL, 'CBB', 'INDIVIDUAL'),
('ARNOLDO ROCHA FAÇANHA', 'Equilíbrio Corpo e Mente - KICKBOXING E CALISTENIA', NULL, 'CBB', 'INDIVIDUAL'),
('CARLOS EDUARDO VEIGA DE CARVALHO', 'Educação ambiental em colônias de pescadores e escolas municipais de Campos dos Goytacazes/RJ e adjacências quanto aos impactos ambientais causados por atividades offshore em vertebrados marinhos', NULL, 'CBB', 'INDIVIDUAL'),
('CARLOS RAMON RUIZ-MIRANDA', 'O Mico-leão-dourado como espécie bandeira para a conservação da biodiversidade no centro norte fluminense: educação ambiental, engajamento social e monitoramento de fauna.', NULL, 'CBB', 'INDIVIDUAL'),
('CARYNE APARECIDA DE CARVALHO BRAGA', 'MastocafÉ: divulgando o conhecimento e promovendo a conservação de mamíferos em redes sociais de amplo alcance', NULL, 'CBB', 'INDIVIDUAL'),
('CESAR AUGUSTO MARCELINO MENDES CORDEIRO', 'Lente Ecológica – conhecendo as espécies do Norte Fluminense com ciência cidadã', NULL, 'CBB', 'INDIVIDUAL'),
('DENISE SARAIVA DAGNINO', 'O ensino de química na região do norte fluminense e adjacências – despertando o interesse para a disciplina', NULL, 'CBB', 'INDIVIDUAL'),
('ELENA LASSOUNSKAIA', 'Paratuberculose bovina em propriedades leiteiras da região Norte e Noroeste Fluminense: programa integrado de prevenção da doença e detecção de animais infectados – segunda fase', NULL, 'CBB', 'INDIVIDUAL'),
('ILANA ROSENTAL', 'Praia com Vida: Busca por engajamento popular para conservação da biodiversidade e sustentabilidade socioambiental de praias arenosas do Norte Fluminense.', NULL, 'CBB', 'INDIVIDUAL'),
('JOÃO CARLOS DE AQUINO ALMEIDA', 'Educação, Ciência e Saúde: Bioética e Sustentabilidade.', NULL, 'CBB', 'INDIVIDUAL'),
('MARCELO TRINDADE NASCIMENTO', 'O Herbário HUENF Como Espaço Não Formal Para o Ensino da Biodiversidade da Flora do Norte e Noroeste Fluminense.', NULL, 'CBB', 'INDIVIDUAL'),
('MARCOS SARMET MOREIRA DE BARROS SALOMÃO', 'Educação ambiental cidadã: Parceria entre o Projeto Piabanha e a UENF para a conservação de peixes ameaçados de extinção do Rio Paraíba do Sul.', NULL, 'CBB', 'INDIVIDUAL'),
('MARIA CRISTINA GAGLIANONE', 'Trilhas das Abelhas', NULL, 'CBB', 'INDIVIDUAL'),
('MARINA SATIKA SUZUKI', 'Ciência pra gente VI', NULL, 'CBB', 'INDIVIDUAL'),
('MAURA DA CUNHA', 'TRILHA DO MANGUE FUNDO: EDUCAÇÃO AMBIENTAL EM RESTINGA', NULL, 'CBB', 'INDIVIDUAL'),
('OLGA LIMA TAVARES MACHADO', 'ALTERNÂNCIA - Orientações Alternativas na Prevenção de Transtorno de Ansiedade', NULL, 'CBB', 'INDIVIDUAL'),
('PAULO PEDROSA', 'O rio Paraíba do Sul é nosso: integrando monitoramento e educação ambiental.', NULL, 'CBB', 'INDIVIDUAL'),
('RENATO AUGUSTO DA MATTA', 'Letramento científico de alunos do ensino básico através de aulas práticas investigativas e a formação continuada de professores de ciências: ano V.', NULL, 'CBB', 'INDIVIDUAL'),
('TÂNIA JACINTO', 'Desenvolvimento e sedimentação da conscientização infanto-juvenil para a importância da conservação do patrimônio ambiental.', NULL, 'CBB', 'INDIVIDUAL'),
('VICTOR MARTIN QUINTANA FLORES', 'Divulgação científica: uso do Instagram para compartilhamento de projetos sustentáveis em restinga (parte 2)', NULL, 'CBB', 'INDIVIDUAL');

-- PROJETO INSTITUCIONAL CBB
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('ANGELA PIERRE VITÓRIA', 'Internacionalização da UENF: prospecção de oportunidades, comunicação e conscientização.', NULL, 'CBB', 'INSTITUCIONAL');

-- PROGRAMAS CBB
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('ANGELA PIERRE VITÓRIA', 'Divulgação científica das ações de ensino e pesquisa em ecofisiologia vegetal e restauração na floresta atlântica', 'DIVULGAÇÃO DE AÇÕES DE ENSINO, PESQUISA E EXTENSÃO NA FLORESTA ATLÂNTICA DESENVOLVIDOS NA UENF', 'CBB', 'PROGRAMA'),
('MAURA DA CUNHA', 'Planejamento e divulgação de Coleções botânicas da UENF: A importância da Xiloteca no ensino, pesquisa e extensão no norte noroeste fluminense', 'DIVULGAÇÃO DE AÇÕES DE ENSINO, PESQUISA E EXTENSÃO NA FLORESTA ATLÂNTICA DESENVOLVIDOS NA UENF', 'CBB', 'PROGRAMA'),
('ALBA LUCINIA PEIXOTO RANGEL', 'Aleitamento materno e determinantes sociais na saúde: uma abordagem extensionista de práticas assistenciais e educação em saúde no serviço público municipal', 'AMIGO DO PEITO', 'CBB', 'PROGRAMA'),
('ANDREA CRISTINA VETO ARNHOLDT', 'Microbiota e você: o que o parto e AME tem a ver com a saúde do seu bebê?', 'AMIGO DO PEITO', 'CBB', 'PROGRAMA'),
('CLAUDETE SANTA CATRAINA', 'Promovendo o conhecimento e a divulgação da Biotecnologia para alunos do Ensino Médio na Região Norte Fluminense', 'BIOTECNOLOGIA NA ESCOLA', 'CBB', 'PROGRAMA'),
('VANILDO SILVEIRA', 'Trilha Biotecnológica', 'BIOTECNOLOGIA NA ESCOLA', 'CBB', 'PROGRAMA'),
('CLICIA GRATIVOL GASPAR DE MATOS', 'Equilíbrio entre corpo e mente no Tai Chi Chuan e Treinamento Funcional', 'UENF EM AÇÃO- CBB', 'CBB', 'PROGRAMA'),
('ALDO DURAND FARFAN', 'Equilíbrio entre corpo e mente no Kung Fu e Treinamento Funcional para Artes Marciais', 'UENF EM AÇÃO- CBB', 'CBB', 'PROGRAMA'),
('PAULO CESAR DE ALMEIDA MAIA', 'Equilíbrio entre corpo e mente no Boxe e Treinamento Preventivo de Lesões', 'UENF EM AÇÃO- CBB', 'CBB', 'PROGRAMA'),
('MARIA CRISTINA GAGLIANONE', 'Coleção de Abelhas da UENF e seu papel na conservação da biodiversidade', 'Coleções Biológicas para estudos da Biodiversidade e Conservação', 'CBB', 'PROGRAMA'),
('MARCELO TRINDADE NASCIMENTO', 'Coleção de Plantas do Herbário HUENF e seu papel na conservação da biodiversidade', 'Coleções Biológicas para estudos da Biodiversidade e Conservação', 'CBB', 'PROGRAMA'),
('KÁTIA VALEVSKI SALES FERNANDES', 'EDUENF: Vínculos Editoriais entre a Extensão e a Ciência', 'A EdUENF DIFUNDINDO A CIÊNCIA', 'CBB', 'PROGRAMA'),
('ALCIMAR DAS CHAGAS RIBEIRO', 'Revista de extensão Universitária: um instrumento para a integração universidade /empresa / governo', 'A EdUENF DIFUNDINDO A CIÊNCIA', 'CBB', 'PROGRAMA'),
('ÉRICA DE OLIVEIRA MELLO', 'Revista de Divulgação Científica Conhecendo a Ciência', 'A EdUENF DIFUNDINDO A CIÊNCIA', 'CBB', 'PROGRAMA'),
('MILTON MASAHIKO MANASHIRO', 'MuDança na UENF', 'SAÚDE E QUALIDADE DE VIDA NA UENF', 'CBB', 'PROGRAMA'),
('OMAR BAILEZ', 'BEACH TENNIS NA UENF', 'SAÚDE E QUALIDADE DE VIDA NA UENF', 'CBB', 'PROGRAMA');
EOF

# Inserção de dados do CCH
sqlite3 $DB <<EOF
-- PROJETOS INDIVIDUAIS CCH
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('DAVID MACIEL DE MELLO NETO', 'Diagnóstico da política pública em segurança alimentar e nutricional para o Município de Campos dos Goytacazes (RJ) – décimo segundo ano', NULL, 'CCH', 'INDIVIDUAL'),
('EDSON TERRA AZEVEDO FILHO', 'TECCOM - Divulgação de empreendedorismo e inovação na comunidade do Norte Fluminense', NULL, 'CCH', 'INDIVIDUAL'),
('ELIANA CRISPIM FRANÇA LUQUETTI', 'Conhecimentos linguísticos e pedagógicos para a consolidação formativa de futuros professores dos anos iniciais do ensino fundamental I', NULL, 'CCH', 'INDIVIDUAL'),
('GIOVANE DO NASCIMENTO', 'Expressões culturais do interior: mapeamento sonoro e performance no Jongo da Rasa e na Ciranda da Baía Formosa em Armação dos Búzios', NULL, 'CCH', 'INDIVIDUAL'),
('HUGO ALBERTO BORSANI CARDOZO', 'Arte e memória política na escola: o Brasil contemporâneo através da música', NULL, 'CCH', 'INDIVIDUAL'),
('LEANDRO GARCIA PINHO', 'Pesca artesanal na escola: conhecimento, cultura e tradição em São Francisco de Itabapoana.', NULL, 'CCH', 'INDIVIDUAL'),
('LILIAN SAGIO CEZAR', 'Projeto de Pesquisa e Extensão Universitária "Diálogos entre saberes na Unidade Experimental de Som e Imagem: comunicação popular e midiática a partir da Capoeira e do NEABI – UENF"', NULL, 'CCH', 'INDIVIDUAL'),
('LUCIANE SOARES DA SILVA', 'Maíra: uma proposta de web rádio universitária e latino-americana', NULL, 'CCH', 'INDIVIDUAL'),
('MARIA CLARETH', '10 anos do Neabi Uenf: Ações afirmativas e educação étnico-racial.', NULL, 'CCH', 'INDIVIDUAL'),
('NILO LIMA DE AZEVEDO', 'Observatório das Metrópoles e Conexões Urbanas: Articulando Academia, Sociedade e Gestão Pública no Norte Fluminense', NULL, 'CCH', 'INDIVIDUAL'),
('ROSALEE SANTOS CRESPO ISTOE', 'Bem viver na terceira idade', NULL, 'CCH', 'INDIVIDUAL'),
('SERGIO ARRUDA DE MOURA', 'Alfabetização e letramento literário através da literatura campista: por uma educação decolonial e inclusiva.', NULL, 'CCH', 'INDIVIDUAL'),
('SHIRLENA CAMPOS DE SOUZA AMARAL', 'Educação em Direitos Humanos e respeito à diversidade: em pauta racismo e homofobia na escola', NULL, 'CCH', 'INDIVIDUAL'),
('SILVIA ALICIA MARTINEZ', 'Memória e Patrimônio Escolar: divulgação do conhecimento e preservação do patrimônio histórico educativo', NULL, 'CCH', 'INDIVIDUAL'),
('TERESA DE JESUS PEIXOTO', 'Políticas públicas e espera: ações para garantia e preservação de direitos, em programas habitacionais.', NULL, 'CCH', 'INDIVIDUAL'),
('VERUSCA MOSS SIMÕES DOS REIS', 'Oficinas filosóficas em ciência, tecnologia e Sociedade (cts)', NULL, 'CCH', 'INDIVIDUAL'),
('VITOR DE MORAES PEIXOTO', 'Pré-Vest UENF: Uma Iniciativa Voluntária para a Democratização do Ensino Superior Público de Qualidade.', NULL, 'CCH', 'INDIVIDUAL'),
('WANIA AMÉLIA BELCHIOR MESQUITA', 'Do ponto de vista dos jovens: a cidadania e o modo de vida em São João da Barra-RJ', NULL, 'CCH', 'INDIVIDUAL');

-- PROJETO INSTITUCIONAL CCH
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('SIMONNE TEIXEIRA', 'Polo Regional Arte na Escola UENF', NULL, 'CCH', 'INSTITUCIONAL');

-- PROGRAMAS CCH
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('GIOVANE DO NASCIMENTO', 'GESTÃO CULTURAL UENF', 'GESTÃO INTERUNIVERSITÁRIA UENF – CIÊNCIA – CULTURA E FORMAÇÃO', 'CCH', 'PROGRAMA'),
('MARIA PRISCILA PESSANHA DE CASTRO', 'PROJETO EXTENSÃO CINE DARCY', 'GESTÃO INTERUNIVERSITÁRIA UENF – CIÊNCIA – CULTURA E FORMAÇÃO', 'CCH', 'PROGRAMA'),
('DEBORAH GUERRA BARROSO', 'ESPAÇO DA CIÊNCIA', 'GESTÃO INTERUNIVERSITÁRIA UENF – CIÊNCIA – CULTURA E FORMAÇÃO', 'CCH', 'PROGRAMA'),
('MARIA EUGENIA TOTTI', 'Educação e sexualidade na escola: diálogos em escolas públicas de Campos dos Goytacazes.', 'Programa de Prevenção às Infecções Sexualmente Transmissíveis (ISTs) e ao HIV/AIDS – UENF', 'CCH', 'PROGRAMA'),
('GABRIELA DO ROSARIO SILVA', 'Transformando Vidas: formação de multiplicadores para a prevenção de Infecções Sexualmente Transmissíveis (ISTs) e de HIV/AIDS', 'Programa de Prevenção às Infecções Sexualmente Transmissíveis (ISTs) e ao HIV/AIDS – UENF', 'CCH', 'PROGRAMA'),
('SHIRLENA DE SOUZA CAMPOS AMARAL', 'Janelas para o conhecimento: cinema, arte e debate na prevenção de DST/AIDS.', 'Programa de Prevenção às Infecções Sexualmente Transmissíveis (ISTs) e ao HIV/AIDS – UENF', 'CCH', 'PROGRAMA'),
('TERESA PEIXOTO FARIA', 'Juventude em Movimento', 'Infância e Juventude do Campo e da Cidade', 'CCH', 'PROGRAMA'),
('GERALDO MÁRCIO TIMÓTEO', 'Projeto Agrícola - Unidade Escola de Produtividade Rural', 'Infância e Juventude do Campo e da Cidade', 'CCH', 'PROGRAMA'),
('KARLA SILVA FERREIRA', 'Ambulatório de Nutrição e Psicologia da UENF', 'Ações Integradas em Saúde e Bem-estar na Universidade', 'CCH', 'PROGRAMA'),
('LEONARDO ROGERIO MIGUEL', 'Reflexões e Ações sobre Saúde Mental na Universidade', 'Ações Integradas em Saúde e Bem-estar na Universidade', 'CCH', 'PROGRAMA'),
('MARA DE MENEZES DE ASSIS GOMES', 'Yoga na UENF', 'Ações Integradas em Saúde e Bem-estar na Universidade', 'CCH', 'PROGRAMA'),
('WANIA AMÉLIA MESQUITA', 'Centro Memória UENF (CEM/ UENF)', 'Centro de Memoria, Documentação, Pesquisa e Extensão da UENF', 'CCH', 'PROGRAMA'),
('VITOR DE MORAES PEIXOTO', 'Produção audiovisual do Centro Memória UENF.', 'Centro de Memoria, Documentação, Pesquisa e Extensão da UENF', 'CCH', 'PROGRAMA'),
('CARLOS HENRIQUE MEDEIROS DE SOUZA', 'Idosos em movimentos', 'TERCEIRA IDADE EM AÇÃO', 'CCH', 'PROGRAMA'),
('ROSALEE SANTOS CRESPO ISTOE', 'Educação, cultura e qualidade de vida na terceira idade.', 'TERCEIRA IDADE EM AÇÃO', 'CCH', 'PROGRAMA'),
('ELIANA CRISPIM FRANÇA LUQUETTI', 'Múltiplos saberes na construção de uma vida ativa para idosos', 'TERCEIRA IDADE EM AÇÃO', 'CCH', 'PROGRAMA');
EOF

# Inserção de dados do CCT
sqlite3 $DB <<EOF
-- PROJETOS INDIVIDUAIS CCT
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('ALCIMAR DAS CHAGAS RIBEIRO', 'Núcleo de pesquisa econômica do Rio de Janeiro NUPERJ', NULL, 'CCT', 'INDIVIDUAL'),
('CARLOS LEONARDO RAMOS', 'Transferência de tecnologia para otimização de rotas e redução dos custos operacionais em empresas de coleta seletiva', NULL, 'CCT', 'INDIVIDUAL'),
('CARLOS MAURÍCIO FONTES VIEIRA', 'UENF EM MOVIMENTO', NULL, 'CCT', 'INDIVIDUAL'),
('CIBELE MARIA STIVANIN DE ALMEIDA', 'Saponificando: a saboaria artesanal como ferramenta para educação e promoção do desenvolvimento sustentável', NULL, 'CCT', 'INDIVIDUAL'),
('DIEGO JÚLIO PACHECO', 'Jogo Educacional em formato de audiogame para o ensino de matemática para deficientes visuais', NULL, 'CCT', 'INDIVIDUAL'),
('EDMILSON JOSÉ MARIA', 'Estudo do controle e monitoramento do Aedes aegypti, através da produção e distribuição de repelente em barra e armadilhas de monitoramento em áreas endêmicas das Regiões Norte Fluminense, Lagos e Sul Capixaba.', NULL, 'CCT', 'INDIVIDUAL'),
('ELAINE CRISTINA PEREIRA', 'Difusão de conhecimento, treinamento e capacitação tecnológica, de profissionais liberais, estudantes e pessoas que atuam ou desejam atuar no ramo de soldagem.', NULL, 'CCT', 'INDIVIDUAL'),
('ELIANE BARBOSA SANTOS', 'Processamento e Análise de Dados Ambientais com R', NULL, 'CCT', 'INDIVIDUAL'),
('FELIPE PERISSÉ DUARTE LOPES', 'Oficina de Energia Limpa de Baixo Custo (OELBC)', NULL, 'CCT', 'INDIVIDUAL'),
('FREDERICO MUYLAERT MARGEM', 'Rede de Empreendedorismo Social', NULL, 'CCT', 'INDIVIDUAL'),
('GUDELIA GUILLERMINA MORALES DE ARICA', 'Coleta seletiva: elo da cadeia de reciclagem e recuperação dos resíduos uma atividade da gestão de recursos Ano 6', NULL, 'CCT', 'INDIVIDUAL'),
('JAN SCHRIPSEMA', 'O ensino de biologia vegetal na região do Norte Fluminense e adjacências para valorização do meio ambiente', NULL, 'CCT', 'INDIVIDUAL'),
('JOSÉ RICARDO SIQUEIRA', 'Processamento e interpretação de imagens de satélite meteorológico durante a ocorrência de tempestades severas', NULL, 'CCT', 'INDIVIDUAL'),
('LUIZ HENRIQUE ZEFERINO', 'Popularização de Aplicações da Impressão 3D e Robótica para Sustentabilidade, Educação e Tecnologia.', NULL, 'CCT', 'INDIVIDUAL'),
('LUIS CESAR PASSONI', 'UENF TV', NULL, 'CCT', 'INDIVIDUAL'),
('MANUEL ANTONIO MOLINA PALMA', 'Apoio ao Programa de Incubação nos eixos de mercado e gestão', NULL, 'CCT', 'INDIVIDUAL'),
('MARIA DA GLORIA ALVES', 'Educação, Cultura e Turismo na região da Costa Doce/ Geoparque Costões e Lagunas RJ', NULL, 'CCT', 'INDIVIDUAL'),
('MARIA GERTRUDES ALVAREZ JUSTI DA SILVA', 'Tempo de aprender em clima de ensinar', NULL, 'CCT', 'INDIVIDUAL'),
('MARIA PRISCILA PESSANHA DE CASTRO', 'A fotografia e as interações entre educação ciência e artes a partir do ensino de física.', NULL, 'CCT', 'INDIVIDUAL'),
('NIANDER AGUIAR CERQUEIRA', 'Projetos de engenharia na prática: capacitação de profissionais da construção civil para leitura de projetos', NULL, 'CCT', 'INDIVIDUAL'),
('NOAN TONINI SIMONASSI', 'FUTURO CRAQUE', NULL, 'CCT', 'INDIVIDUAL'),
('RAUL ERNESTO LOPEZ PALACIO', 'Paraesporte, inclusão através do esporte.', NULL, 'CCT', 'INDIVIDUAL'),
('ROBERTO DA TRINDADE FARIA JUNIOR', 'Física interativa do cotidiano.', NULL, 'CCT', 'INDIVIDUAL'),
('SEBASTIÃO DÉCIO COIMBRA DE SOUZA', 'Dinâmica do mercado imobiliário de habitação na cidade de Campos dos Goytacazes-RJ Fase III: Criação do site do projeto', NULL, 'CCT', 'INDIVIDUAL');

-- PROJETOS INSTITUCIONAIS CCT
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('JONAS ALEXANDRE', 'CAMINHOS DE BARRO: DISSEMINAÇÃO DA ARTE CERÂMICA', NULL, 'CCT', 'INSTITUCIONAL'),
('LEONARDO MOTA', 'CORAL UENF', NULL, 'CCT', 'INSTITUCIONAL'),
('SERGIO LUIS CARDOSO', 'Núcleo de Acessibilidade Pedagógica NAP: práticas e ações para apoio à inclusão de alunos com deficiência no sistema de ensino em níveis infantil, básico, médio e superior das escolas regulares da Região Norte e Noroeste Fluminense', NULL, 'CCT', 'INSTITUCIONAL');

-- PROGRAMAS CCT
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('GUSTAVO XAVIER', 'Rede de economia solidária do Norte Fluminense: por um modelo econômico sustentável e humano . Ano 10', 'INCUBADORA TECNOLÓGICA DE EMPREENDIMENTOS POPULARES (ITEP)', 'CCT', 'PROGRAMA'),
('GERALDO GRAVINA', 'Circuito universitário de economia solidária: outra economia acontece Ano 10', 'INCUBADORA TECNOLÓGICA DE EMPREENDIMENTOS POPULARES (ITEP)', 'CCT', 'PROGRAMA'),
('DYLMAR PENTEADO DIAS', 'Design solidário e curadoria de produtos como estratégia de fortalecimento da rede de economia solidária Norte Fluminense/RJ ano 10.', 'INCUBADORA TECNOLÓGICA DE EMPREENDIMENTOS POPULARES (ITEP)', 'CCT', 'PROGRAMA'),
('FERNANDO JOSÉ LUNA DE OLIVEIRA', 'REDE UENF SOCIAL', 'UENF PORTAS ABERTAS', 'CCT', 'PROGRAMA'),
('LUIS CESAR PASSONI', 'RADIO WEB UENF', 'UENF PORTAS ABERTAS', 'CCT', 'PROGRAMA'),
('RAUL ERNESTO LOPEZ PALACIO', 'CONHECENDO A UENF', 'UENF PORTAS ABERTAS', 'CCT', 'PROGRAMA'),
('PAULA MOUSINHO MARTINS', 'Arte & Fibras Naturais – sustentabilidade, empreendedorismo e autogestão, este é o caminho. Ano II', 'Agregando Valor ao Bagaço de Cana de Açúcar de Campos dos Goytacazes – ANO III', 'CCT', 'PROGRAMA'),
('MÁRCIA GIARDINIERI DE AZEVEDO', 'Novos Horizontes para o Bagaço da Cana de Açúcar de Campos dos Goytacazes, RJ – Industrianato – Ano V', 'Agregando Valor ao Bagaço de Cana de Açúcar de Campos dos Goytacazes – ANO III', 'CCT', 'PROGRAMA'),
('EDSON TERRA', 'Existe um empreendedor em você: o sucesso em suas mãos', 'PROGRAMA DE DIFUSÃO DA CULTURA EMPREENDEDORA. PDCE', 'CCT', 'PROGRAMA'),
('MANUEL ANTONIO MOLINA PALMA', 'Apoio ao Programa de Incubação nos eixos: empreendedor, tecnologia e capital.', 'PROGRAMA DE DIFUSÃO DA CULTURA EMPREENDEDORA. PDCE', 'CCT', 'PROGRAMA'),
('PAULO CESAR DE ALMEIDA MAIA', 'Equilíbrio entre corpo e mente no Judô e Taekwondo', 'ARTES MARCIAIS PARA A COMUNIDADE ESTUDANTIL DE CAMPOS-RJ', 'CCT', 'PROGRAMA'),
('ALDO DURAND FARFAN', 'Equilíbrio entre corpo e mente no Karatê e Jiu-Jitsu', 'ARTES MARCIAIS PARA A COMUNIDADE ESTUDANTIL DE CAMPOS-RJ', 'CCT', 'PROGRAMA'),
('MARINA SATIKA SUZUKI', 'Equilíbrio entre corpo e mente na Defesa Pessoal e Pilates', 'ARTES MARCIAIS PARA A COMUNIDADE ESTUDANTIL DE CAMPOS-RJ', 'CCT', 'PROGRAMA'),
('AFONSO RANGEL GARCEZ AZEVEDO', 'Sustentabilidade Ambiental na Construção Civil: Qualificação e disseminação de práticas sustentáveis em resíduos sólidos', 'DESENVOLVIMENTO SUSTENTÁVEL DA CONSTRUÇÃO CIVIL DE CAMPOS DOS GOYTACAZES - RJ: GESTÃO, QUALIFICAÇÃO E EMPREGO DE NOVOS MATERIAIS', 'CCT', 'PROGRAMA'),
('JONAS ALEXANDRE', 'Da argila ao metacaulim – A inserção da produção de metacaulim com argilas da baixada campista nas cerâmicas de Campos dos Goytacazes', 'DESENVOLVIMENTO SUSTENTÁVEL DA CONSTRUÇÃO CIVIL DE CAMPOS DOS GOYTACAZES - RJ: GESTÃO, QUALIFICAÇÃO E EMPREGO DE NOVOS MATERIAIS', 'CCT', 'PROGRAMA'),
('NIANDER CERQUEIRA', 'Os Resíduos da Construção Civil e Seus Impactos para a População de Campos dos Goytacazes -RJ: Gestão e Conscientização', 'DESENVOLVIMENTO SUSTENTÁVEL DA CONSTRUÇÃO CIVIL DE CAMPOS DOS GOYTACAZES - RJ: GESTÃO, QUALIFICAÇÃO E EMPREGO DE NOVOS MATERIAIS', 'CCT', 'PROGRAMA'),
('MARIA CRISTINA CANELA', 'Do plástico ao microplástico: Diagnóstico e reciclagem de resíduos plásticos em lagoas e praias do município de São João da Barra', 'EDUCAÇÃO AMBIENTAL E GESTÃO DE RESÍDUOS SÓLIDOS: CONSERVANDO O AMBIENTE', 'CCT', 'PROGRAMA'),
('NICKSON PERINI', 'Da Reciclagem de baterias e pilhas exauridas à Produção de Hidrogênio Verde: Experiências para o ensino de Ciências', 'EDUCAÇÃO AMBIENTAL E GESTÃO DE RESÍDUOS SÓLIDOS: CONSERVANDO O AMBIENTE', 'CCT', 'PROGRAMA'),
('VICTOR GOMES LIMA FERRAZ', 'Ciência na Escola: Estreitando laços entre a universidade e a Educação Básica a partir da divulgação científica', 'EDUCAÇÃO AMBIENTAL E GESTÃO DE RESÍDUOS SÓLIDOS: CONSERVANDO O AMBIENTE', 'CCT', 'PROGRAMA'),
('DJALMA SOUZA', 'Empreendedorismo do Zero', 'Futuro Capacitado - Programa de Formação Profissional e Empreendedorismo Aplicado', 'CCT', 'PROGRAMA'),
('ELAINE CRISTINA PEREIRA', 'Capacitação em Cursos Profissionalizantes de Estética e Confeitaria', 'Futuro Capacitado - Programa de Formação Profissional e Empreendedorismo Aplicado', 'CCT', 'PROGRAMA'),
('OSCAR ALFREDO PAZ LA TORRE', 'BaseMat', 'MATEMÁTICA AO ALCANCE DE TODOS', 'CCT', 'PROGRAMA'),
('ANNABELL DEL REAL TAMARIZ', 'BaseMat+.', 'MATEMÁTICA AO ALCANCE DE TODOS', 'CCT', 'PROGRAMA'),
('MARIA GERTRUDES ALVAREZ JUSTI DA SILVA', 'Observadores do Tempo e do Clima', 'PROGRAMA DE EXTENSÃO EM CLIMA E ENERGIA', 'CCT', 'PROGRAMA'),
('ELIANE BARBOSA SANTOS', 'Ciência, Clima e Ambiente: Compartilhando Saberes.', 'PROGRAMA DE EXTENSÃO EM CLIMA E ENERGIA', 'CCT', 'PROGRAMA');
EOF

# Inserção de dados do CCTA
sqlite3 $DB <<EOF
-- PROJETOS INDIVIDUAIS CCTA
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('ALMYR JUNIOR CORDEIRO DE CARVALHO', 'Cultivares de abacaxizeiros resistentes a fusariose: Estudo da cadeia produtiva e difusão de tecnologias.', NULL, 'CCTA', 'INDIVIDUAL'),
('ANA BÁRBARA FREITAS RODRIGUES GODINHO', 'Implementação de uma nova metodologia didática inclusiva para o estudo e conhecimento da anatomia animal', NULL, 'CCTA', 'INDIVIDUAL'),
('ANDRÉ LACERDA DE ABREU OLIVEIRA', 'Treinamento e capacitação de graduandos, Residentes e médicos veterinários em cirurgias utilizando Técnicas minimamente invasivas (videolaparoscopia, notes, Single port e microcirurgia) em animais de companhia do Norte fluminense.', NULL, 'CCTA', 'INDIVIDUAL'),
('ANTÔNIO GESUALDI JUNIOR', 'Introdução de ferramentas de controle de produção em sistemas pecuários na região Norte Fluminense e recomendações de ajustes. Ano IV', NULL, 'CCTA', 'INDIVIDUAL'),
('CLAUDIA SALES MARINHO', 'Fruticultura arbórea: a muda em foco', NULL, 'CCTA', 'INDIVIDUAL'),
('DANIELA BARROS DE OLIVEIRA', 'Capacitação e treinamento de alunos do curso de licenciatura em ciências biológicas – EaD/UENF sobre a elaboração de iogurte e ênfase sob seus benefícios a saúde: Replicadores de ações proativas em comunidades – ANO IV', NULL, 'CCTA', 'INDIVIDUAL'),
('DEBORAH GUERRA BARROSO', 'Árvores da UENF: produtos e serviços', NULL, 'CCTA', 'INDIVIDUAL'),
('EMANUELA FORESTIERI DA GAMA RODRIGUES', 'Ciência do solo na escola: pensando no futuro', NULL, 'CCTA', 'INDIVIDUAL'),
('EULÓGIO CARLOS QUEIRÓZ DE CARVALHO', 'Versão Digital com Aperfeiçoamento, Expansão e Consolidação do Núcleo Avançado (Museu) de Ensino, Pesquisa e Extensão na Área de Morfologia Normal e Patológica da Universidade Estadual do Norte Fluminense Darcy Ribeiro (Fluxo Contínuo).', NULL, 'CCTA', 'INDIVIDUAL'),
('FÁBIO CUNHA COELHO', 'Agroecologia: sensibilizando estudantes de ensino fundamental e médio e a terceira idade sobre a produção e consumo de alimentos mais saudáveis', NULL, 'CCTA', 'INDIVIDUAL'),
('FÁBIO DA COSTA HENRY', 'Avaliação das carnes comercializadas no Município de Campos dos Goytacazes - RJ', NULL, 'CCTA', 'INDIVIDUAL'),
('FERNANDA ANTUNES', 'Treinamento e capacitação de graduandos, residentes e médicos veterinários para anestesia e controle da dor em cirurgias, incluindo castrações, utilizando videocirurgia, notes e microcirurgia em animais de companhia do Norte Fluminense.', NULL, 'CCTA', 'INDIVIDUAL'),
('FRANCIMAR FERNANDES GOMES', 'Capacitação em boas práticas para a produção, comercialização e consumo do leite com segurança alimentar no município de Campos dos Goytacazes, RJ.', NULL, 'CCTA', 'INDIVIDUAL'),
('GERALDO DE AMARAL GRAVINA', 'Rede de Agroecologia: Formação, Introdução de Microprocessos de Beneficiamentos para Comercialização e Consumidor Parceiro em Campos dos Goytacazes (ANO 7).', NULL, 'CCTA', 'INDIVIDUAL'),
('HELAINE CRISTINE CANELA RAMOS', 'O ensino da genética: viagem ao mundo invisível', NULL, 'CCTA', 'INDIVIDUAL'),
('HELENA KIYOMI HOKAMURA', 'Educação Ambiental em espaços não formais: extensão universitária no Parque Estadual do Desengano', NULL, 'CCTA', 'INDIVIDUAL'),
('JANIE MENDES JASMIN', 'Arborização urbana: planejamento, implantação, monitoramento e prevenção de risco', NULL, 'CCTA', 'INDIVIDUAL'),
('JURANDI GONÇALVES DE OLIVEIRA', 'Brulosofia goytacá: alquimia cervejeira na planície', NULL, 'CCTA', 'INDIVIDUAL'),
('KAROLL ANDREA ALFONSO TORRES CORDIDO', 'Capacitação técnica para o desenvolvimento das cadeias produtivas avícolas no norte fluminense', NULL, 'CCTA', 'INDIVIDUAL'),
('LEONARDO SERAFIM DA SILVEIRA', 'Coleção Herpetológica do Norte Fluminense como ferramenta para o Ensino, Pesquisa e Extensão.', NULL, 'CCTA', 'INDIVIDUAL'),
('LUANA PEREIRA DE MORAIS', 'O que a uenf faz de bom em minha vida!!!: integrando a instituição à sociedade.', NULL, 'CCTA', 'INDIVIDUAL'),
('LUCIANA APARECIDA RODRIGUES', 'A-cea: ambiental-compostagem e espécies arbóreas', NULL, 'CCTA', 'INDIVIDUAL'),
('LUCIANO P CANELLAS', 'Biofertilizantes para transição da cafeicultura familiar no norte fluminense', NULL, 'CCTA', 'INDIVIDUAL'),
('LUIS FONSECA MATOS', 'Difusão e treinamento em manejo reprodutivo de ovinos para técnicos e criadores da região norte e noroeste fluminense', NULL, 'CCTA', 'INDIVIDUAL'),
('MANUEL VASQUEZ VIDAL JUNIOR', 'Tecnologia patrocínio de produção de peixes ornamentais e de peixes de corte: Capacitação de empreendedores e avaliação de viabilidade econômica da atividade', NULL, 'CCTA', 'INDIVIDUAL'),
('MARCIO MANHÃES FOLLY', 'Monitoramento do estado sanitário de bovinos e caprinos e a qualidade do leite proveniente de vacas e cabras de produtores familiares e assentados das mesoregiões centro, noroeste e norte do estado do Rio de Janeiro', NULL, 'CCTA', 'INDIVIDUAL'),
('MARIA ANGELICA', 'O veneno nosso de cada dia: multiplicação de saberes nas escolas', NULL, 'CCTA', 'INDIVIDUAL'),
('MARINETE PINHEIRO CARRERA', 'Neurociência aplicada à educação: capacitação de professores da rede de ensino básico de Campos dos Goytacazes-RJ', NULL, 'CCTA', 'INDIVIDUAL'),
('NIRALDO JOSÉ PONCIANO', 'Capacitação de Pequenos Produtores Rurais em São Francisco de Itabapoana - RJ: Promovendo Integração Universidade-Sociedade para Cultivo Sustentável e Participação Comunitária', NULL, 'CCTA', 'INDIVIDUAL'),
('OLNEY VIEIRA DA MOTTA', 'Saúde Única: as anfixenoses e suas implicações na qualidade de vida de Assentados Rurais e escolares no Norte e Noroeste Fluminense', NULL, 'CCTA', 'INDIVIDUAL'),
('PAULA ALESSANDRA DI FILIPPO', 'Lar da flor: uma segunda chance', NULL, 'CCTA', 'INDIVIDUAL'),
('RICARDO FERREIRA GARCIA', 'Operação e manutenção de máquinas agrícolas', NULL, 'CCTA', 'INDIVIDUAL'),
('RICHARD IAN SAMUELS', 'Monitoramento e controle biológico de mosquitos Aedes aegypti em residências de voluntários de Campos dos Goytacazes – RJ', NULL, 'CCTA', 'INDIVIDUAL'),
('ROGÉGIO FIGUEIREDO DAHER', 'Potencial de uso de genótipos de capim elefante para a alimentação animal na região norte fluminense', NULL, 'CCTA', 'INDIVIDUAL'),
('ROSANA RODRIGUES', 'Feijões do rio de janeiro: uma rede de valorização e salvaguarda da agrobiodiversidade fluminense', NULL, 'CCTA', 'INDIVIDUAL'),
('ROSEMARY BASTOS', 'Bem-estar animal: UENF na escola, compartilhando conhecimento visando à saúde pública', NULL, 'CCTA', 'INDIVIDUAL'),
('SILVERIO DE PAIVA FREITAS', 'Espaço de Plantas Medicinais, Condimentares e Aromáticas', NULL, 'CCTA', 'INDIVIDUAL'),
('SILVIO DE JESUS FREITAS', 'Fatores socioeconômicos, tecnológicos e comerciais da cadeia produtiva da mandioca no município de campos dos goytacazes pós-pandemia de covid-19', NULL, 'CCTA', 'INDIVIDUAL'),
('SOLANGE SILVA SAMARÃO', 'Importância do conhecimento das plantas tóxicas para Uma abordagem educativa em saúde única (ano ii)', NULL, 'CCTA', 'INDIVIDUAL'),
('TADEU SILVA DE OLIVEIRA', 'Programa de capacitação em bovinocultura leiteira para produtores familiares da região norte fluminense – ano iii', NULL, 'CCTA', 'INDIVIDUAL'),
('VIRGINIA SILVA CARVALHO', 'Entendendo as plantas da família Orchidaceae: conhecer para preservar e produzir com sustentabilidade – Ano XV.', NULL, 'CCTA', 'INDIVIDUAL');

-- PROGRAMA INSTITUCIONAL CCTA
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('DANIEL GONÇALVES', 'Democratização do acesso ao ensino superior e Aperfeiçoamento no âmbito da formação de professores: a Contribuição do pré vestibular social teorema como política Pública de ampliação da igualdade de oportunidades.', 'PRE VESTIBULAR SOCIAL TEOREMA', 'CCTA', 'PROGRAMA'),
('JANIE MENDES JASMIM', 'Recursos e ferramentas da ead na otimização do ensino no pré vestibular social teorema', 'PRE VESTIBULAR SOCIAL TEOREMA', 'CCTA', 'PROGRAMA'),
('SERGIO ARRUDA', 'Capacitação de professores do teorema: aprimoramento de técnicas para aprovação no enem', 'PRE VESTIBULAR SOCIAL TEOREMA', 'CCTA', 'PROGRAMA');

-- PROGRAMAS CCTA
INSERT INTO projetos (coordenador, projeto, programa, instituicao, tipo) VALUES
('ISABEL CANDIA NUNES DA CUNHA', 'Ações sociais de integração da relação Homem-Animal no HV-UENF - ano 06', 'Ações Integrativas Multidisciplinares envolvendo a relação Homem-Animal (AMIHA) no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy- ano 06', 'CCTA', 'PROGRAMA'),
('FERNANDA ANTUNES', 'Inclusão de ações do serviço social nos projetos de castração de cães e gatos realizados no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy Ribeiro – ano 05', 'Ações Integrativas Multidisciplinares envolvendo a relação Homem-Animal (AMIHA) no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy- ano 06', 'CCTA', 'PROGRAMA'),
('ANTONIO PEIXOTO ALBERNAZ', 'Otimização do atendimento aos animais de companhia realizado no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy Ribeiro – ano 02', 'Ações Integrativas Multidisciplinares envolvendo a relação Homem-Animal (AMIHA) no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy- ano 06', 'CCTA', 'PROGRAMA'),
('PAULA ALESSANDRA DE FILIPPO', 'Projeto Carroceiro: bem estar de equídeos e preocupação social', 'Assistência Animal para Comunidades Carentes', 'CCTA', 'PROGRAMA'),
('ANDRÉ LACERDA', 'Controle populacional de cães e gatos de população em situação de vulnerabilidade social e de animais resgatados', 'Assistência Animal para Comunidades Carentes', 'CCTA', 'PROGRAMA'),
('FÁBIO CUNHA COELHO', 'Segurança alimentar e apoio à comercialização para agricultores familiares da reforma agrária da Região Norte Fluminense - Fase 2', 'CIÊNCIAS DOS CAMPOS E AGROECOLOGIA – DIÁLOGOS E FORTALECIMENTO DE SABERES E SABORES LOCAIS', 'CCTA', 'PROGRAMA'),
('KAROLL ANDREA', 'Divulgação da agricultura de base ecológica – apoio à EdUENF na criação de corpo editorial em agroecologia – Fase 2', 'CIÊNCIAS DOS CAMPOS E AGROECOLOGIA – DIÁLOGOS E FORTALECIMENTO DE SABERES E SABORES LOCAIS', 'CCTA', 'PROGRAMA'),
('ALEXANDRE PIO VIANA', 'Fortalecimento do diálogo entre os conhecimentos acadêmicos e tradicionais do campo – apoio à COOEX-CCTA', 'CIÊNCIAS DOS CAMPOS E AGROECOLOGIA – DIÁLOGOS E FORTALECIMENTO DE SABERES E SABORES LOCAIS', 'CCTA', 'PROGRAMA'),
('JURANDIR G. OLIVEIRA', 'Conservação de alimentos: aprimoramento de dispositivo para controlar o amadurecimento de frutos e hortaliças e evitar o desperdício de alimentos com menor impacto no meio ambiente', 'Conservação de alimentos e meio ambiente: introdução de novas tecnologias na conservação de alimentos de origem vegetal para preservação de qualidade e aumento do tempo de armazenamento e comercialização evitando o desperdício de alimentos com menor impacto no meio ambiente', 'CCTA', 'PROGRAMA'),
('EDER RESENDE', 'Introdução de novas tecnologias na cadeia produtiva do morango para preservação de qualidade e aumento do tempo de armazenamento e comercialização dos frutos', 'Conservação de alimentos e meio ambiente: introdução de novas tecnologias na conservação de alimentos de origem vegetal para preservação de qualidade e aumento do tempo de armazenamento e comercialização evitando o desperdício de alimentos com menor impacto no meio ambiente', 'CCTA', 'PROGRAMA'),
('GERSON ADRIANO SILVA', 'Entomologia nas escolas: uso de coleções entomológicas, de forma inclusiva, para a difusão de conhecimentos sobre os insetos.', 'Entomologia itinerante: uso de insetos para realizar a difusão de conhecimento, divulgação científica, educação ambiental e de promoção da arte', 'CCTA', 'PROGRAMA'),
('ANA MARIA BAILEZ', 'Safari de formigas', 'Entomologia itinerante: uso de insetos para realizar a difusão de conhecimento, divulgação científica, educação ambiental e de promoção da arte', 'CCTA', 'PROGRAMA'),
('BRUNO CLARKSON MATTOS', 'Museu itinerante de Entomologia e Arte', 'Entomologia itinerante: uso de insetos para realizar a difusão de conhecimento, divulgação científica, educação ambiental e de promoção da arte', 'CCTA', 'PROGRAMA'),
('OLNEY VIEIRA DA MOTTA', 'Animais silvestres e as implicações sobre a consciência de escolares e demais comunidades sobre a Saúde Única', 'Saúde Única como ferramenta para preservação ambiental', 'CCTA', 'PROGRAMA'),
('LEONARDO SERAFIM DA SILVEIRA', 'Núcleo de Estudos e Pesquisas em Animais Selvagens – NEPAS', 'Saúde Única como ferramenta para preservação ambiental', 'CCTA', 'PROGRAMA'),
('ANA BÁRBARA FREITAS RODRIGUES', 'Educando para preservar', 'Popularização científica como ferramenta da conservação ambiental', 'CCTA', 'PROGRAMA'),
('HELENA KIYOMI HOKAMURA', 'Controle populacional de cães e gatos errantes no Entorno do parque estadual da lagoa do Açú – pelag', 'Popularização científica como ferramenta da conservação ambiental', 'CCTA', 'PROGRAMA'),
('ISABEL CANDIA NUNES DA CUNHA', 'NUARC: Atendimento das fêmeas acometidas por tumor venéreo transmissível canino e por neoplasias mamárias, acompanhamento da saúde reprodutiva das que recebem contraceptivo injetável por livre arbítrio de tutores e conscientização para guarda responsável.', 'VULNERAVEIS - Ações multidisciplinares de prevenção da vulnerabilidade animal no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy Ribeiro (HV-UENF)- ANO 02', 'CCTA', 'PROGRAMA'),
('ADRIANA JARDIM DE ALMEIDA', 'Esporotricose em campos dos goytacazes: diagnóstico, controle e prevenção', 'VULNERAVEIS - Ações multidisciplinares de prevenção da vulnerabilidade animal no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy Ribeiro (HV-UENF)- ANO 02', 'CCTA', 'PROGRAMA'),
('ROSEMARY BASTOS', 'Educação humanitária e bem-estar animal: educar para proteger', 'VULNERAVEIS - Ações multidisciplinares de prevenção da vulnerabilidade animal no Hospital Veterinário da Universidade Estadual do Norte Fluminense Darcy Ribeiro (HV-UENF)- ANO 02', 'CCTA', 'PROGRAMA');
EOF

echo "Banco de dados populado com sucesso!"
echo "Total de registros inseridos:"
sqlite3 $DB "SELECT COUNT(*) FROM projetos;"
echo ""
echo "Registros por centro:"
sqlite3 $DB "SELECT instituicao, COUNT(*) FROM projetos GROUP BY instituicao;"
echo ""
echo "Registros por tipo:"
sqlite3 $DB "SELECT tipo, COUNT(*) FROM projetos GROUP BY tipo;"

# Inserção de dados de interesse para testes
sqlite3 $DB <<EOF
INSERT INTO interesses (nome, email, telefone, projeto_id) VALUES
('João Silva', 'joao.silva@example.com', '11987654321', 1),
('Maria Souza', 'maria.souza@example.com', '21998765432', 2),
('Pedro Santos', 'pedro.santos@example.com', '31976543210', 1);
EOF
