--Criando fun��o escalar TRIM
--drop function Trim
CREATE�FUNCTION�Trim(@ST�VARCHAR(1000))�
 returns�VARCHAR(1000)���
  BEGIN�������
	RETURN(Ltrim(Rtrim(@ST)))���
  END




--Invocando fun��o escalar TRIM
SELECT�'>'�+�('      Silva Telles       ')+'<'
union
SELECT�'>'�+�DBO.TRIM('      Silva Telles       ')+'<'

