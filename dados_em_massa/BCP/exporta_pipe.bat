bcp CURSO.DBO.CLIENTES OUT C:\Cursos\scripts\DadosMassa\export\CLIOUT_pipe.TXT -o C:\Cursos\scripts\DadosMassa\log\CLIOUT_pipe.LOG -S INFINITY\SQLEXPRESS -T -r "\n" -t "|" -c
PAUSE