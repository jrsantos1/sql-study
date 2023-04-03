--CRIANDO TABELA PARA CURSOR
--drop table contapagparc
create table contapagparc
(
 idcap  int ,
 dtvenc  date,
 parcela  int
 )  

select idcap,dtvenc from contapagparc
select *  from contapagparc


insert into contapagparc values ('1',getdate()+30,'')
insert into contapagparc values ('1',getdate()+45,'')
insert into contapagparc values ('1',getdate()+60,'')

insert into contapagparc values ('2',getdate()+15,'')
insert into contapagparc values ('2',getdate()+20,'')
insert into contapagparc values ('2',getdate()+25,'')

--select * from contapagparc

declare @idcap as int
declare @dtvenc as date
declare @cont as int =0
declare @idcap_aux as int

declare cursorparc cursor for
	select idcap,dtvenc from contapagparc
	order by idcap,dtvenc asc

		open cursorparc
			fetch next from cursorparc into @idcap,@dtvenc

			while @@FETCH_STATUS=0
--status fecth 
-- 0 Instrucao bem sucedida
-- 1 instrucao falhou 
-- 2 a linha buscado nao existe
			Begin
				if @idcap_aux<>@idcap 
				begin 
				set @cont=1;
				set @idcap_aux=@idcap;
				end
				else
				begin 
					set @cont=@cont+1
					set @idcap_aux=@idcap;
                end
				--atualizazao
				update contapagparc set parcela=@cont
				where idcap=@idcap
				and dtvenc=@dtvenc;
				
				            
		fetch next from cursorparc into @idcap,@dtvenc
		end
		
		close cursorparc
		deallocate cursorparc

--select * from contapagparc