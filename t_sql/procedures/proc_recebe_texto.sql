--Retornar texto externo através de parâmetro
--drop procedure TESTE3
Create PROCEDURE TESTE3(@meutexto varchar(100))
AS
BEGIN
SELECT @meutexto
END

--Executando Procedure
EXEC TESTE3 'Teste foi realizado com Sucesso'
