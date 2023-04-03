--FORMATANDO DATAS
	Select convert(varchar(10),getdate(),103)

	Select convert(varchar(5),getdate(),103)

	Select convert(varchar(10),getdate(),108)

	Select convert(varchar(5),getdate(),108)

	SELECT CONVERT(VARCHAR(20),GETDATE(), 100)

	SELECT CONVERT(VARCHAR(8),GETDATE(), 1) 

--Extensão
SELECT CAST(DAY(GETDATE()) AS VARCHAR(2)) + ' ' +
       DATENAME(MM, GETDATE()) AS [Dia e Mes]

--EXEMPLO EM TABELA
USE NORTHWND
	SELECT a.OrderDate,
		   CONVERT(varchar(10),a.OrderDate,120)padrao120,
	       CONVERT(varchar(10),a.OrderDate,103)padrao103,
		   CONVERT(VARCHAR(20),a.OrderDate,100)padrao100,
		   CONVERT(VARCHAR(11),a.OrderDate,100)padrao100,
		   CONVERT(VARCHAR(8),a.OrderDate,1)  padrao1
		   FROM Orders a

