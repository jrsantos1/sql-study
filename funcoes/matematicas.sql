--ABS
--Uma fun��o matem�tica que retorna o valor absoluto (positivo) 
--da express�o num�rica especificada.

SELECT�Abs(-1.0),��������
       Abs(0.0),��������
	   Abs(1.0),
	   Abs(-9.0),
	   Abs(9.0),
	   abs(-5.4),
	   abs(5.4);

--RAND
--Retorna um valor�float�pseudoaleat�rio de 0 a 1, exclusivo.


SELECT�Rand(),�
       Rand(),�
	   Rand()

--exenplo

DECLARE @cont smallint;
SET @cont = 1;
WHILE @cont < 5
   BEGIN
      SELECT RAND() Random_Number
      SET @cont = @cont + 1
   END;

--ROUND
--Retorna um valor num�rico, arredondado, para o comprimento ou precis�o especificados.

SELECT�Round(123.9994,�3),�--0,1,2,3,4<����
       Round(123.9995,�3); --5,6,7,8,9 >
--exemplo 2

SELECT�Round(123.4545,�2);�
SELECT�Round(123.45,-2);
SELECT�Round(193.45,-2);

--exemplo 3
SELECT�Round(150.75,�0);
SELECT�Round(150.75,�0,�1);�

