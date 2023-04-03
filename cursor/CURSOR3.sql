use curso
--drop table cli_nome
create table cli_nome
(cod_cliente int not null,
 nome_completo varchar(100) not null
 )

 --select * from cli_nome

--CRIANDO CURSOR PARA INSERT
--DECLARANDO VARIAVEIS
    DECLARE @codcliente int, 
	        @primeironome VARCHAR(30), 
			@sobrenome VARCHAR(60), 
			@nomecompleto VARCHAR(90)
 
-- Cursor para percorrer os registros
DECLARE cursor1 CURSOR FOR
select EmployeeID, FirstName, LastName from NORTHWND.dbo.Employees
 
--Abrindo Cursor
OPEN cursor1
 
-- Lendo a próxima linha
FETCH NEXT FROM cursor1 INTO @codcliente, @primeironome, @sobrenome
 
-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN
 
-- Executando as rotinas desejadas manipulando o registro
--update clientes set nomecompleto = @primeironome + ' ' + @sobrenome where codcliente = @codcliente
 insert into cli_nome values (@codcliente,@primeironome + ' ' + @sobrenome)
-- Lendo a próxima linha
FETCH NEXT FROM cursor1 INTO @codcliente, @primeironome, @sobrenome
END
 
-- Fechando Cursor para leitura
CLOSE cursor1
 
-- Finalizado o cursor
DEALLOCATE cursor1

--verifindo insert 
--select * from cli_nome
