--Retornar texto externo atrav�s de par�metro
--drop procedure�TESTE3
Create PROCEDURE TESTE3(@meutexto varchar(100))
AS
BEGIN
SELECT @meutexto
END

--Executando Procedure
EXEC TESTE3 'Teste foi realizado com Sucesso'
