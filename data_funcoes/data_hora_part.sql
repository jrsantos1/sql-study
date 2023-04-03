	--FUNCAO DE DATA E HORA PARTES
	--RETORNA O DIA/Mes/Ano

	SELECT Getdate()data_hora,
	       Datename (day, Getdate()) DIA_N,
		   Datename (month, Getdate()) MES_N,
		   Datename (year, Getdate()) ANO_N
	--RETORNA O DIA/Mes/Ano
	
	SELECT Datepart (day, Getdate()) DIA_P,
		   Datepart (month, Getdate())MES_P,
		   Datepart (year, Getdate()) ANO_P
	
	--RETORNA O DIA/Mes/Ano
	SELECT Day(Getdate()) DIA,
	       Month (Getdate()) MES,
		   YEAR (Getdate()) ANO
	
	--RETONAR DATA HORA COM 7 ARGUMENTOS
	SELECT DATETIMEFROMPARTS (2017,11,30,3,45,59,1) HORA

--
use NORTHWND

--exemplo 1
select a.OrderID,
       a.OrderDate,
       month(OrderDate)mes,
	   year(OrderDate)ano  
	   from Orders a

--exemplo 2
select year(a.OrderDate)ano ,
       month(a.OrderDate)mes,
	   count(*) qtd
	   from Orders a
group by year(a.OrderDate),month(a.OrderDate)
order by year(a.OrderDate),month(a.OrderDate)
	    

--exemplo 3
select year(a.OrderDate)ano ,
	   count(*) qtd
	   from Orders a
group by year(a.OrderDate)
order by year(a.OrderDate)