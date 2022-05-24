create database medicos;

use medicos;

create table medicos(
	cod_medicos serial not null,
    nome_medico varchar(50) not null,
    especialidade_medico varchar (50) not null,
    crm_medico varchar (20) primary key 
	
);

select * from medicos;

