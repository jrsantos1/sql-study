bcp "select * from CURSO.DBO.CLIENTES" QUERYOUT C:\Cursos\scripts\DadosMassa\export\CLIOUT_q.TXT -o C:\Cursos\scripts\DadosMassa\log\CLIOUT_q.LOG -S INFINITY\SQLEXPRESS -T -r "\n" -t "|" -c
PAUSE