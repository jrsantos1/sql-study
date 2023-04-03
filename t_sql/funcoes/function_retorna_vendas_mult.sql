use AdventureWorks2014
--drop function func_venda_prod 
CREATE FUNCTION func_venda_prod (@storeid INT) 
returns TABLE 
AS     
RETURN       
(SELECT P.productid,               
		P.NAME,              
       Sum(SD.linetotal) AS 'Total'        
FROM   production.product AS P               
	   JOIN sales.salesorderdetail AS SD                 
	   ON SD.productid = P.productid               
	   JOIN sales.salesorderheader AS SH                 
	   ON SH.salesorderid = SD.salesorderid               
	   JOIN sales.customer AS C                 
	   ON SH.customerid = C.customerid        
	   WHERE  C.storeid = @storeid        
	   GROUP  BY P.productid, P.NAME);


--Invocando funcao 

SELECT * FROM   dbo.func_venda_prod (600);

--entendendo de baixa para cima
select * from sales.customer
where storeid in ('602')
--id cliente 430 e 29618
select * from Sales.SalesOrderHeader
where customerid in ('430','29618')
--subselect em cascata

select sum(LineTotal) from sales.salesorderdetail
where salesorderid in (select  salesorderid
from sales.salesorderheader 
where customerid in (select customerid from sales.customer 
where  storeid in ('602')))

