create database bdHireUP;

use bdHireUP;

create table tbUsuarios(
Email varchar(120) primary key,
Nome varchar(120),
Apelido varchar(120),
Setor varchar(120),

Senha varchar(50));

insert into tbUsuarios() values();

create table tbEmpregos(
Id_Emprego int auto_increment primary key,
Titulo varchar(120),
Posicao varchar(120),
SalarioMin int ,
SalarioMax int ,
Categoria varchar (50),
Localizacao varchar(45),
Tipo varchar (45), 
Descricao varchar(500),
Requisitos varchar(500)
);

create table tbCategorias(
Nome varchar(50)
);

insert into tbCategorias
 values ("TI"),("Automovel"),("Culinaria"),("Agricultura"),("Lazer"), ("Saude"),("Gestão"),("Direito"),("Outro");
 
 create table tbEmpresas(
 Id_Empresa int primary key auto_increment,
 Nome_Empresa varchar(120),
 Contato varchar(20),
 Email varchar(100),
 Descricao varchar(500)
 );
 
 