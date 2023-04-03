--funcao para receber duas data e retornar intervalo de acordo com parametro.
Create FUNCTION dbo.func_dias(@dia INT,@dti DATETIME,@dtf DATETIME) 
	returns @tbl TABLE(dt DATETIME) 
	AS   
	BEGIN       
		WHILE @dti <= @dtf         
			BEGIN             
				INSERT INTO @tbl  (dt) VALUES (@dti)             
				SET @dti = Dateadd(day, @dia, @dti)         
			End
			Return
	end

--invocando funcao dias
	SELECT * FROM   dbo.func_dias(3,getdate(),getdate()+12) 
