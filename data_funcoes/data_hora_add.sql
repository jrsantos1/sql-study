--Adicionando 90 dias
	SELECT getdate() agora,
		   Dateadd (day, 90, Getdate()) 
--Adicionando 2 meses
	SELECT getdate() agora,
	       Dateadd (month, 2, Getdate()) 
--Adicionando 3 anos
	SELECT getdate() agora,
		   Dateadd (year, 3, Getdate())

--Exemplo
USE NORTHWND
	SELECT a.OrderID,
		   a.OrderDate,
		   Dateadd (day,90,a.OrderDate) add_dia,
		   Dateadd (month,2,a.OrderDate) add_mes,
		   Dateadd (YEAR,3,a.OrderDate) add_anos
    FROM Orders A 
