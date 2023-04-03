--Procedure para calcular Quadrado
CREATE PROCEDURE calc_quadradro @PAR1 INT
AS
BEGIN
	SELECT @PAR1*@PAR1 AS QUADRADO
END


--Executando Procedure
EXEC calc_quadradro 4 
