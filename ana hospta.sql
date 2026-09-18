create database sistema_hospitalar;
use sistema_hospitalar;

create table especialidades (
id int auto_increment primary key,
nome varchar(100) not null,
descricao varchar(255) 
);

create table hospitais (
id int auto_increment primary key,
nome varchar(150) not null,
cidade varchar(100),
estado char(2),
tipo varchar(30),
capacidade_de_leitos int,
telefone varchar(20)
);

create table convenios (
id int auto_increment primary key,
nome varchar(100) not null,
tipo varchar(50),
cobertura_percentual int,
telefone varchar(20)
);

create table medicos (
id int auto_increment primary key,
nome varchar(100) not null,
crm varchar(20) not null,
especialidade_id int,
hospital_id int,
telefone varchar(20),
email varchar(100),
salario decimal(10, 2),
data_contratacao date,
sexo char(1)
);

create table pacientes (
id int auto_increment primary key,
nome varchar(150) not null,
cpf varchar(20) not null unique,
data_nascimento date,
sexo char(1),
telefone varchar(20),
email varchar(100),
endereco varchar(200),
cidade varchar(100),
estado char(2),
tipo_sanguineo char(3),
convenio_id int,
data_cadastro date
);

create table medicamentos (
id int auto_increment primary key,
nome varchar(100) not null,
principio_ativo varchar(100),
fabricante varchar(100),
tipo varchar(80),
preco decimal(8, 2),
controlado tinyint(1)
);

create table consultas (
id int auto_increment primary key,
paciente_id int not null,
medico_id int not null,
hospital_id int,
convenio_id int,
data_consulta date,
hora_consulta time,
tipo_consulta varchar(50),
status varchar(20),
valor decimal(8, 2)
);

create table exames (
id int auto_increment primary key,
paciente_id int not null,
medico_id int,
tipo_exame varchar(100),
data_exame date,
resultado_exame varchar(30),
valor decimal(8, 2),
status varchar(20)
);

create table prescricoes (
id int auto_increment primary key,
consulta_id int not null,
medicamento_id int not null,
dosagem varchar(50),
frequencia varchar(50),
duracao_dias int
);

create table internacoes (
id int auto_increment primary key,
paciente_id int not null,
medico_id int,
hospital_id int,
data_entrada date,
data_saida date,
motivo varchar(100),
quarto varchar(10),
valor_diaria decimal(10, 2),
status varchar(20)
);

show tables;

insert into especialidades (id, nome, descricao) values
(1, 'Cardiologista', 'Diagnóstico e tratamento de 
doenças do coração e sistema circulatório'),
(2, 'Pediatria', 'Cuidados médicos voltados para 
crianças e adolescentes'),
(3, 'Ortopedia', 'Tratamento de lesões e doenças do
sistema musculoesquelético'),
(4, 'Dermatologia', 'Diagnóstico e tratamento de doenças
de pele'),
(5, 'Ginecologia', 'Saúde do sistema reprodutor feminino'),
(6, 'Neurologia', 'Tratamento de doenças do sistema
nervoso'),
(7, 'Oftalmologia', 'Diagnóstico e tratamento de doenças
oculares'),
(8, 'Psiquiatria', 'Tratamento de trasnstornos mentais
e emocionais'),
(9, 'Endocrinologia', 'Tratamento de disturbios hormonais
e metabólicos'),
(10, 'Urologia', 'Tratamento do sistema urinário e 
reprodutor masculino'),
(11, 'Oncologia', 'Diagnóstico e tratamento de cânceres'),
(12, 'Otorrinolaringologia', 'Tratamento de ouvido,
nariz e garganta'),
(13, 'Gastroenterologia', 'Tratamento do sistema 
digestivo'),
(14, 'Pneumologia', 'Tratamento de doenças respiratórias'),
(15, 'Reumatologia', 'Tratamento de doenças autoimunes
e articulares'),
(16, 'Clínica Geral', 'Atendimento médico geral e 
preventivo'),
(17, 'Anestesiologia', 'Administração de anestesia em 
procedimentos cirúrgicos'),
(18, 'Cirurgia Geral', 'Procedimentos cirúrgicos diversos'),
(19, 'Nefrologia', 'Tratamento de doenças renais'),
(20, 'Infectologia', 'Tratam
nto de doenças infecciosas');

select * from especialidades;

INSERT INTO hospitais (id, nome, cidade, estado, tipo, capacidade_de_leitos, telefone) VALUES
(1, 'Hospital Santa Cruz', 'Curitiba', 'PR', 'Público', 311, '(42) 94657-3286'),
(2, 'Hospital São Lucas', 'Curitiba', 'PR', 'Público', 462, '(15) 91488-2535'),
(3, 'Hospital das Clínicas', 'Recife', 'PE', 'Privado', 547, '(88) 91434-4257'),
(4, 'Hospital Vida Nova', 'Maceió', 'AL', 'Misto', 255, '(68) 95557-1106'),
(5, 'Hospital Santa Isabel', 'Salvador', 'BA', 'Misto', 378, '(46) 93547-4527'),
(6, 'Hospital Nossa Senhora Aparecida', 'Belém', 'PA', 'Público', 124, '(59) 92584-6881'),
(7, 'Hospital São Rafael', 'Goiânia', 'GO', 'Filantrópico', 74, '(69) 99785-3045'),
(8, 'Hospital Bom Jesus', 'Florianópolis', 'SC', 'Público', 595, '(48) 96925-4150'),
(9, 'Hospital Santa Helena', 'Belo Horizonte', 'MG', 'Público', 263, '(48) 92307-4814'),
(10, 'Hospital São Camilo', 'Curitiba', 'PR', 'Misto', 314, '(69) 96977-3664'),
(11, 'Hospital Vitória', 'Goiânia', 'GO', 'Filantrópico', 244, '(96) 95374-2169'),
(12, 'Hospital Esperança', 'Cuiabá', 'MT', 'Privado', 576, '(42) 93677-8573'),
(13, 'Hospital Santa Maria', 'Florianópolis', 'SC', 'Filantrópico', 600, '(39) 96313-1916'),
(14, 'Hospital Albert Sabin', 'Fortaleza', 'CE', 'Público', 353, '(62) 95386-2084'),
(15, 'Hospital Renascer', 'Recife', 'PE', 'Filantrópico', 247, '(94) 99179-7482'),
(16, 'Hospital Santa Fé', 'Natal', 'RN', 'Privado', 301, '(28) 95040-9830'),
(17, 'Hospital São Vicente', 'Brasília', 'DF', 'Misto', 438, '(57) 94593-3266'),
(18, 'Hospital Novo Horizonte', 'João Pessoa', 'PB', 'Misto', 123, '(17) 92796-3504'),
(19, 'Hospital Central', 'Salvador', 'BA', 'Misto', 95, '(60) 97252-8668'),
(20, 'Hospital Regional do Sul', 'João Pessoa', 'PB', 'Filantrópico', 596, '(12) 92876-9797'),
(21, 'Hospital Metropolitano', 'Brasília', 'DF', 'Filantrópico', 144, '(48) 98123-3591'),
(22, 'Hospital Municipal Norte', 'Natal', 'RN', 'Público', 299, '(75) 93927-9317');





