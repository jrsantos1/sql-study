--drop table estoque
use curso
CREATE TABLE estoque 
  ( 
     cod_mat VARCHAR (20) PRIMARY KEY NOT NULL, 
     saldo   DECIMAL (10, 2) NULL 
  ) 
--drop table estoque_lote
CREATE TABLE estoque_lote 
  ( 
     cod_mat VARCHAR (20), 
     lote    VARCHAR (15) NOT NULL, 
     saldo   DECIMAL (10, 2) NULL, 
     CONSTRAINT fk_estlote FOREIGN KEY (cod_mat) REFERENCES material(cod_mat), 
     CONSTRAINT pk_matlote PRIMARY KEY (cod_mat, lote) 
  ) 
--drop table mov_estoque
CREATE TABLE mov_estoque 
  ( 
     transacao  INT IDENTITY(1, 1) PRIMARY KEY NOT NULL, 
     mov        VARCHAR (1) NOT NULL, 
     cod_mat    VARCHAR (20) NOT NULL, 
     lote       VARCHAR (15) NOT NULL, 
     qtd        INT NOT NULL, 
     usuario    VARCHAR (30) NOT NULL, 
     dt_hor_mov DATETIME NOT NULL 
  ) 

ALTER TABLE mov_estoque 
  WITH CHECK ADD CONSTRAINT chk_mov CHECK (( mov ='S' OR mov ='E')) 

go 

ALTER TABLE mov_estoque 
  CHECK CONSTRAINT chk_mov 

go 

ALTER TABLE estoque 
  ADD FOREIGN KEY (cod_mat) REFERENCES material(cod_mat); 

go 

ALTER TABLE mov_estoque 
  ADD FOREIGN KEY (cod_mat) REFERENCES material(cod_mat); 

