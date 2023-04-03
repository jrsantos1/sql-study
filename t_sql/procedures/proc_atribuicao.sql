--Procedure para atribuir preco de tabelas e total de produtos na tabelas pedido
--drop table material
create table material
(
 cod_mat varchar(20) not null primary key,
 descricao varchar(50) not null
 )
-- drop table lista_preco
create table lista_preco
( cod_mat varchar(20)not null primary key,
  preco decimal(10,2) not null
  constraint fk_mat foreign key (cod_mat) references material(cod_mat)
  )

--drop table pedido
  create table pedido
  (
   pedido int primary key,
   total decimal(10,2) 
   )
--drop table pedido_detalhe
  create table pedido_detalhe
  (
   pedido int not null,
   cod_mat varchar(20)not null,
   qtd int not null,
   val_unit decimal(10,2),
   total decimal(10,2),
   constraint fk_mat3 foreign key (cod_mat) references   material(cod_mat)
   )


  --carregando produto
  insert into material
  select ProductID,ProductName from NORTHWND.dbo.Products
 --verificando carga
  select * from material
  
  --carregando Lista de preco
  insert into lista_preco
  select ProductID,UnitPrice from NORTHWND.dbo.Products
  --verificando carga
  select * from lista_preco


--carregando pedido detalhe
insert into pedido_detalhe (pedido,cod_mat,qtd)
select OrderID,ProductID,Quantity from NORTHWND.dbo.[Order Details]
--verificando carga
select * from pedido_detalhe

--carregando pedido
insert into pedido (pedido)
select distinct pedido  from pedido_detalhe
--verificando carga
select * from pedido


--criacao da procudure atribuir valor precos
--drop procedure AtribuirPreco
create Procedure AtribuirPreco as
Begin
Declare @Codigo int, @Preco Decimal(10,2), @pedido int,@total Decimal(10,2)
--Passo 1
	Declare Atribuir Cursor for
		Select cod_mat, preco from lista_preco
	Open Atribuir
	Fetch Next from Atribuir into @Codigo, @Preco
    	while @@FETCH_STATUS = 0
	Begin
		update pedido_detalhe set val_unit = @Preco,total = qtd*@Preco
		where cod_mat = @Codigo
		Fetch Next from Atribuir into @Codigo, @Preco
	end

-- Fechando Cursor para leitura
CLOSE Atribuir 
-- Finalizado o cursor
DEALLOCATE Atribuir
--FIM PASSO 1
--INICIO PASSO 2
Declare AtribuirTotal Cursor for
		Select pedido, sum(total) from pedido_detalhe group by pedido
	Open AtribuirTotal
	Fetch Next from AtribuirTotal into @pedido, @total
    	while @@FETCH_STATUS = 0
	Begin
		update pedido set total=@total
		where pedido = @pedido
		Fetch Next from AtribuirTotal into @pedido, @total
	end
end
-- Fechando Cursor para leitura
CLOSE AtribuirTotal
-- Finalizado o cursor
DEALLOCATE AtribuirTotal

--FIM PROCEDURE

--executando a procedure
exec AtribuirPreco

--verificando registros
SELECT TOP 3 * FROM pedido_detalhe
SELECT TOP 3 * FROM pedido
--verificando registros
select TOP 3 pedido,Sum(total) from pedido_detalhe
group by pedido
order by 1 asc
select TOP 3pedido,total from pedido
order by 1 asc