-- DROP PROCEDURE public.aplicardepreciacao();

-- DROP PROCEDURE public.aplicardepreciacao();

CREATE OR REPLACE PROCEDURE aplicardepreciacao(p_condition_id int, p_nova_depreciacao decimal(10,2))
	LANGUAGE plpgsql
AS $procedure$
	BEGIN
update book_condition 
set price_depreciation = p_nova_depreciacao 
where id = p_condition_id;

update book 
set final_price = base_price - p_nova_depreciacao
where id_condition = p_condition_id;

raise notice 'regra de depreciação atualizada para a condição % ', p_condition_id;
	END;
$procedure$
;
