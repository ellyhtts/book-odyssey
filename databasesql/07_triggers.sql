-- DROP FUNCTION public.calculapreconocadastro();

alter table book add column if not exists base_price DECIMAL(10,2);
alter table book add column if not exists final_price DECIMAL(10,2);

CREATE OR REPLACE FUNCTION calculapreconocadastro()
	RETURNS trigger as $$
	declare 
	v_depreciacao decimal (5,2);
	
	BEGIN
select price_depreciation into v_depreciacao 
from book_condition
where id = new.id_condition;

new.final_price := new.base_price - v_depreciacao;
return new;

	END;
$$ LANGUAGE plpgsql;

create trigger calcula_preco
before insert on book 
for each row
execute function calculapreconocadastro();

