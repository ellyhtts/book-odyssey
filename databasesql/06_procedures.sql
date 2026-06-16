
-- DROP PROCEDURE public.aplicardepreciacao();

CREATE OR REPLACE PROCEDURE apply_depreciation(p_condition_id int, p_nova_depreciacao decimal(10,2))
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

---------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE redeem_fidelity_points(
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

-----------------------------------------------------------

DROP PROCEDURE IF EXISTS process_shipping(INT, VARCHAR, VARCHAR);

CREATE OR REPLACE PROCEDURE process_shipping(
    p_id_order INT,
    p_tracking_code VARCHAR(50),
    p_state_code VARCHAR(2) 
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_new_shipping_id INT;
    v_freight_value DECIMAL(10,2);
BEGIN
    UPDATE book_order
    SET status = 'Shipped' 
    WHERE id = p_id_order;

    v_freight_value := calculate_estimated_freight(p_state_code);

    SELECT COALESCE(MAX(id), 0) + 1 INTO v_new_shipping_id FROM customer_shipping;

    INSERT INTO customer_shipping (id, id_order, tracking_code, shipping_date, shipping_value)
    VALUES (v_new_shipping_id, p_id_order, p_tracking_code, CURRENT_DATE, v_freight_value);

    RAISE NOTICE 'Order % updated to Shipped. Tracking Code: %. Freight: $ %', 
                 p_id_order, p_tracking_code, v_freight_value;
END;
$$;
