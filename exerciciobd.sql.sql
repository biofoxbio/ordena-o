create table tb_cliente(
cd_cliente number(10),
nm_cliente varchar2(2000 char),
ie_cpf_cnpj varchar2(15 char),
id_tipocliente char(1 char)

);



create table tb_conta(
cd_conta number(10),
nm_conta varchar2(250),
cd_tipoconta number(10)

);



create table tb_tipoconta(
cd_tipoconta number(10),
nm_tipoconta varchar2(250 char),
ie_ativo number(1)

);


create table tb_clienteconta(
cd_cliente number(10),
cd_conta number(10)

);

create table tb_movimentacao(
cd_cliente number(10),
cd_conta number (10),
dt_movimentacao date,
ds_movimentacao  varchar2(300 char)

);

alter table tb_cliente 
add(
CONSTRAINT cliente_pk PRIMARY KEY(cd_cliente)



);

alter table tb_conta 
add(
CONSTRAINT conta_pk PRIMARY KEY(cd_conta)



);

alter table tb_tipoconta 
add(
CONSTRAINT tipoconta_pk PRIMARY KEY(cd_tipoconta)



);

alter table tb_clienteconta 
add(
CONSTRAINT clienteconta_pk PRIMARY KEY(cd_cliente,cd_conta)



);

alter table tb_movimentacao 
add(
CONSTRAINT movimentacao_pk PRIMARY KEY(cd_cliente,cd_conta,dt_movimentacao)



);

alter table tb_cliente
modify(
cd_cliente constraint cd_cliente   not null,
nm_cliente constraint nm_cliente   not null,
id_tipocliente constraint id_tipocliente not null


);

alter table tb_conta
modify(
cd_conta constraint cd_conta   not null,
nm_conta constraint nm_conta   not null,
cd_tipoconta constraint cd_tipoconta not null


);

alter table tb_tipoconta
modify(
cd_tipoconta constraint cd_tipoconta1   not null,
nm_tipoconta constraint nm_tipoconta2  not null,
ie_ativo constraint ie_ativo not null


);

alter table tb_clienteconta
modify(
cd_conta constraint cd_conta_naonull   not null,
cd_cliente constraint cd_cliente_naonull  not null



);

alter table tb_movimentacao
modify(
cd_conta constraint cd_conta_naonull1   not null,
cd_cliente constraint cd_cliente_naonull1  not null,
dt_movimentacao constraint dt_movinotnull not null,
ds_movimentacao constraint ds_movinotnull not null



);

ALTER TABLE TB_conta
ADD(CONSTRAINT tb_conta_tb_tipoconta_FK FOREIGN KEY(CD_tipoconta)
        REFERENCES TB_tipoconta(CD_tipoconta)
        
        );
        
        ALTER TABLE TB_clienteconta
ADD(cONSTRAINT tb_clienteconta_tb_cliente_FK FOREIGN KEY(CD_cliente)
        REFERENCES TB_cliente(CD_cliente),
        cONSTRAINT tb_clienteconta_tb_conta_FK FOREIGN KEY(CD_conta)
        REFERENCES TB_conta(CD_conta)
        
        );
        
        ALTER TABLE TB_movimentacao
ADD(CONSTRAINT tb_movimentacao_tb_clienteconta_FK FOREIGN KEY(cd_cliente, CD_conta)
        REFERENCES TB_clienteconta(cd_cliente ,CD_conta)
        
        );


ALTER TABLE TB_cliente
ADD(CONSTRAINT TB_cliente_un unique(ie_cpf_cnpj)

);

ALTER TABLE TB_conta
ADD(CONSTRAINT TB_conta_un unique(nm_conta)

);

ALTER TABLE TB_tipoconta
ADD(CONSTRAINT TB_tipoconta_un unique(nm_tipoconta)

);



ALTER TABLE TB_cliente
ADD(
 CONSTRAINT cliente_tipocliente_CK CHECK(Id_tipocliente = 'f 'or Id_tipocliente = 'j')

);

ALTER TABLE TB_tipoconta
ADD(
    CONSTRAINT tipoconta_CK CHECK(Ie_ATIVO = 0 OR Ie_ATIVO =1)
);

ALTER TABLE TB_movimentacao
modify(dt_movimentacao  DEFAULT  sysdate); 
