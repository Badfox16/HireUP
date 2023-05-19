create database bdHireUP;

ALTER DATABASE bdHireUP CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

se bdHireUP;

create table tbUsuarios(
Email varchar(120) primary key,
Nome varchar(120),
Apelido varchar(120),
Setor varchar(120),
Localizacao varchar(120),
Formacao varchar(120),
Senha varchar(50),
Descricao varchar(500) default 'Edita o seu perfil e permita com que as empresas conheçam-te melhor.'
)default charset = utf8;

create table tbEmpregos(
Id_Emprego int auto_increment primary key,
Empresa varchar (120),
Titulo varchar(120),
Posicao varchar(120),
SalarioMin int ,
SalarioMax int ,
Setor varchar (50),
Localizacao varchar(45),
Tipo varchar (45),
Descricao varchar(500),
Requisitos varchar(500)
)default charset = utf8;

create table tbCategorias(
Nome varchar(150)
)default charset = utf8;

 create table tbEmpresas(
 Id_Empresa int primary key auto_increment,
 Nome_Empresa varchar(120) unique,
 Tipo_Empresa varchar(100),
 Setor varchar(100),
 Email varchar(100),
 Senha varchar(100),
 Descricao varchar(500),
 Localizacao varchar(100),
 Empregos varchar(100)
 )default charset = utf8;

 create table tbAdmin(
    Username VARCHAR(50) primary key,
    Senha varchar(50)
 )default charset = utf8;

 create table tbCandidatura(
    Id_Candidatura int primary key auto_increment,
    Estado VARCHAR(50) not null,
    EmpregoId int not null,
    EmpresaId int not null
 )default charset = utf8;

insert into tbCategorias
 values ("Tecnologias de Informacao"),
 ("Marketing"),
 ("Telecomunicao"),
 ("Administracao"),
 ("Construcao"),
  ("Saude"),
  ("Industrial"),
  ("Multimedia"),
  ("Seguranca"),
  ("Outro");

