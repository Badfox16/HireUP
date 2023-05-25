create database bdHireUP CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use bdHireUP;

create table tbUsuarios(
Id_Usuario int auto_increment primary key,
Email varchar(120) unique,
Nome varchar(120),
Apelido varchar(120),
Setor varchar(120),
Localizacao varchar(120),
Formacao varchar(120),
Senha varchar(50),
Descricao varchar(500),
Contato varchar(16)
);

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
);


 create table tbEmpresas(
 Id_Empresa int primary key auto_increment,
 Nome_Empresa varchar(120) unique,
 Tipo_Empresa varchar(100),
 Setor varchar(100),
 Email varchar(100),
 Senha varchar(100),
 Descricao varchar(500),
 Localizacao varchar(100),
 Empregos varchar(100) default '0',
 Candidaturas varchar(100) default '0'
 );



 create table tbCandidaturas(
    Id_Candidatura int primary key auto_increment,
    Estado VARCHAR(50) default 'Pendente',
	Fale_Sobre varchar(500),
    Pq_Voce varchar(500),
    EmpresaFK int,
    UsuarioFK int,
    EmpregoFK int,
    foreign key(EmpresaFK) references tbEmpresas(Id_Empresa),
    foreign key(UsuarioFK) references tbUsuarios(Id_Usuario),
    foreign key(EmpregoFK) references tbEmpregos(Id_Emprego)
 );
 
  create table tbAdmin(
    Username VARCHAR(50) primary key,
    Senha varchar(50)
 );

create table tbCategorias(
Nome varchar(150)
);


 create table tbComentarios(
 Id_Comentario int primary key auto_increment,
 Id_UsuarioFK int,
 Id_EmpresaFK int,
 Comentario varchar(1000),
 Data varchar(8),
 foreign key(Id_UsuarioFK) references tbUsuarios(Id_Usuario),
 foreign key(Id_EmpresaFK) references tbEmpresas(Id_Empresa)
 );

insert into tbCategorias
 values ("Tecnologias de Informação"),
 ("Marketing"),
 ("Telecomunição"),
 ("Administração"),
 ("Construção"),
  ("Saude"),
  ("Industrial"),
  ("Multimedia"),
  ("Segurança"),
  ("Outro");

drop table tbCandidatura;
-- select * from tbComentarios as Coments join tbUsuarios as Users on Coments.Id_UsuarioFK = Users.Id_Usuario order by  Id_Comentario;
-- select * from tbCandidaturas join tbUsuarios on tbCandidaturas.UsuarioFK = tbUsuarios.Id_Usuario join tbEmpresas on tbCandidaturas.EmpresaFK = tbEmpresas.Id_Empresa;