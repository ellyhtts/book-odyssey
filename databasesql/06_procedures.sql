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


CREATE OR REPLACE PROCEDURE ResgatarPontosFidelidade(
    p_supplier_id INT,
    p_redemption_points INT
)
LANGUAGE plpgsql AS $$
DECLARE
    v_current_points INT;
BEGIN
    SELECT redemption_points INTO v_current_points
    FROM supplier_coupon
    WHERE id = p_supplier_id;
    
    IF v_current_points IS NULL THEN
        RAISE EXCEPTION 'Fornecedor ID % não possui pontos ou cupons registrados no sistema.', p_supplier_id;
    END IF;
    
    IF v_current_points < p_redemption_points THEN
        RAISE EXCEPTION 'Saldo insuficiente! O fornecedor possui % pontos, mas o resgate exige %.', v_current_points, p_redemption_points;
    END IF;
    
    UPDATE supplier_coupon
    SET redemption_points = redemption_points - p_redemption_points
    WHERE id = p_supplier_id;
    
    RAISE NOTICE 'Resgate realizado com sucesso! % pontos deduzidos do fornecedor ID %.', p_redemption_points, p_supplier_id;
END;
$$;
