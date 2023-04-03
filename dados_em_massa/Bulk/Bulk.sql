use curso
/*
drop table produto
create table produto
   (cod nvarchar(5),
    nome nvarchar(20)
)
*/

--Exemplo de Bulk Insert
BULK INSERT produto 
FROM 'C:\Cursos\scripts\DadosMassa\carga\produto.txt'
WITH        (
	codepage='ACP',
    DATAFILETYPE = 'widechar',              
	fieldterminator='|',               
	rowterminator='\n',               
	maxerrors = 0,               
	fire_triggers,               
    firstrow = 1,               
	lastrow = 5
	     ) 

	select nome  from produto
	delete from produto