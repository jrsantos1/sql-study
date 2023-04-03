--Criando função escalar Soma
--drop function Soma
CREATE FUNCTION Soma(@num1 INT,@num2 INT) 
	returns INT   
	BEGIN       
		DECLARE @res INT       
		SET @res=@num1 + @num2       
		RETURN ( @res )   
	END
	

--Invocando função escalar Soma

SELECT '>>>' , DBO.SOMA(1,3)

--drop table #testesoma
--create table #testesoma
 (val1 int,
  val2 int
  )
  --inserindo valores
  insert into #testesoma values (10,2),(5,4),(89,3)

  --invocando funcao soma 
  select val1,
         val2,
         dbo.soma(val1,val2)
   from #testesoma
 
