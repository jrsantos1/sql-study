	USE CURSO
	DECLARE @MinhaVariavel VARCHAR(100) 
	DECLARE meu_cursor 
	CURSOR local FOR SELECT NOME FROM ALUNOS 
	open meu_cursor
	FETCH next FROM meu_cursor INTO @MinhaVariavel 
	WHILE(@@FETCH_STATUS = 0) 
		begin 
		print @MinhaVariavel+' FETCH_STATUS-> '+cast(@@FETCH_STATUS as varchar(10))

		FETCH next FROM meu_cursor INTO @MinhaVariavel 
	end
	print 'FETCH_STATUS-> '+cast(@@FETCH_STATUS as varchar(10))
	close meu_cursor
	deallocate meu_cursor



