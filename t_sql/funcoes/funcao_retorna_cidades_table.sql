--Criando Function  – Table Value
--drop function F_Cidades
--use curso
Create Function F_Cidades (@UF VarChar(2))
Returns Table
As
 Return(
  Select * from cidades a
  Where a.uf = @UF)
 
--Invocando funções 
Select * from dbo.F_Cidades('YY')