--Atenção antes de criar a procedure excute este arquivo proc_base_estoque.sql
--drop procedure Atualiza_estoque

Create PROCEDURE Atualiza_estoque (@tipo_mov VARCHAR(1), 
                                  @cod_mat  VARCHAR(50), 
                                  @lote     VARCHAR(15), 
                                  @qtd_mov  DECIMAL(10, 2)) 
AS 
  BEGIN 
      SET nocount On

      DECLARE @ErrorState INT; 

      BEGIN TRANSACTION 

      IF (SELECT Count(*) 
          FROM   material where cod_mat=@cod_mat) = 0 
        BEGIN
            SET @ErrorState=2 
        END 
      ELSE 
        BEGIN 
            IF ( @tipo_mov = 'S' ) 
              BEGIN 
                  IF ( (SELECT TOP 1 saldo 
                        FROM   estoque 
                        WHERE  @cod_mat = cod_mat) < @qtd_mov 
                        OR (SELECT TOP 1 saldo 
                            FROM   estoque_lote 
                            WHERE  @cod_mat = cod_mat 
                                   AND lote = @lote) < @qtd_mov 
                        OR (SELECT Count(*) 
                            FROM   estoque 
                            WHERE  @cod_mat = cod_mat) = 0 
                        OR (SELECT Count(*) 
                            FROM   estoque_lote 
                            WHERE  @cod_mat = cod_mat 
                                   AND lote = @lote) = 0 ) 
                    BEGIN 
                        SET @ErrorState=1 
                    END 
                  ELSE 
                    BEGIN 
                        UPDATE estoque 
                        SET    saldo = saldo - @qtd_mov 
                        WHERE  cod_mat = @cod_mat 

                        UPDATE estoque_lote 
                        SET    saldo = saldo - @qtd_mov 
                        WHERE  cod_mat = @cod_mat 
                               AND lote = @lote 

                        INSERT mov_estoque 
                        VALUES (@tipo_mov, 
                                @cod_mat, 
                                @lote, 
                                @qtd_mov, 
                                SYSTEM_USER, 
                                Getdate()) 
                        PRINT 'insert Mov_estoque' 
                        PRINT 'Baixa Realizada' 
                    END 
              END 

            IF ( @tipo_mov = 'E' ) 
              BEGIN 
                  IF (SELECT Count(*) 
                      FROM   estoque 
                      WHERE  cod_mat = @cod_mat) > 0 
                    BEGIN 
                        UPDATE estoque 
                        SET    saldo = saldo + @qtd_mov 
                        WHERE  cod_mat = @cod_mat 

                        PRINT 'tem estoque faz update' 
                    END 
                  ELSE 
                    BEGIN 
                        INSERT INTO estoque 
                        VALUES      (@cod_mat, 
                                     @qtd_mov) 

                        PRINT 'insert estoque' 
                    END 

                  IF (SELECT Count(*) 
                      FROM   estoque_lote 
                      WHERE  cod_mat = @cod_mat 
                             AND lote = @lote) > 0 
                    BEGIN 
                        UPDATE estoque_lote 
                        SET    saldo = saldo + @qtd_mov 
                        WHERE  cod_mat = @cod_mat 
                               AND lote = @lote 

                        PRINT 'tem estoque_lote faz update' 
                    END 
                  ELSE 
                    BEGIN 
                        INSERT INTO estoque_lote 
                        VALUES      (@cod_mat, 
                                     @lote, 
                                     @qtd_mov) 

                        PRINT 'insert estoque_lote' 
                    END 

                  INSERT mov_estoque 
                  VALUES (@tipo_mov, 
                          @cod_mat, 
                          @lote, 
                          @qtd_mov, 
                          SYSTEM_USER, 
                          Getdate()) 

                  PRINT 'insert Mov_estoque' 
              END 
        END 

      IF @@ERROR <> 0 
        BEGIN 
            ROLLBACK 
            PRINT @@error 
        END 
      ELSE IF @ErrorState = 1 
        BEGIN 
            ROLLBACK 
            RAISERROR ('Estoque Negativo',-- Message text.   
                       10,-- Severity.   
                       1 -- State.   
            ); 

            PRINT 'Operacao Cancelada Rollback' 
        END 
      ELSE IF @ErrorState = 2 
        BEGIN 
            ROLLBACK 
            RAISERROR ('Material nao existe',-- Message text.   
                       10,-- Severity.   
                       1 -- State.   
            ); 

            PRINT 'Operacao Cancelada Rollback' 
        END 
      ELSE 
        BEGIN 
            COMMIT 
            PRINT 'Operacao Concluida com Sucesso' 
        END 
  END 


--param 1 mov
--param 2 cod_mat
--param 3 lote
--param 4 quantidade

--EXEC Atualiza_estoque S,2,QAZ,3
/*
select * from estoque
select * from estoque_lote
select * from mov_estoque
*/
--ANALISANDO CONSISTENCIA
/*
select * from estoque
SELECT COD_MAT,
SUM(CASE WHEN MOV='S' THEN QTD*-1
     WHEN MOV='E' THEN QTD END) SALDO
FROM mov_estoque
GROUP BY COD_MAT
--ANALISANDO CONSISTENCIA
select * from estoque_lote
SELECT COD_MAT,LOTE,
SUM(CASE WHEN MOV='S' THEN QTD*-1
     WHEN MOV='E' THEN QTD END) SALDO
FROM mov_estoque
GROUP BY COD_MAT,LOTE

*/