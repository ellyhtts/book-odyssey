-- Function: Recebe o ID do livro e retorna o estado físico (condição) detalhado.
CREATE OR REPLACE FUNCTION get_book_condition(p_book_id INT)
RETURNS VARCHAR AS $$
DECLARE
    v_estado_fisico VARCHAR;
BEGIN
    SELECT bc.condition_description INTO v_estado_fisico
    FROM book b
    INNER JOIN book_condition bc ON b.id_condition = bc.id
    WHERE b.id = p_book_id;

    RETURN COALESCE(v_estado_fisico, 'Status não cadastrado para este livro');
END;
$$ LANGUAGE plpgsql;

-- Function: Recebe o ID da editora e retorna o valor financeiro total arrecadado.
CREATE OR REPLACE FUNCTION get_total_sales_by_publisher (p_publisher_id INT)
RETURNS NUMERIC AS $$
DECLARE
    v_total_arrecadado NUMERIC;
BEGIN
    SELECT COALESCE(SUM(oi.sell_price), 0.00) INTO v_total_arrecadado
    FROM publisher p
    INNER JOIN book b ON p.id = b.id_publisher
    INNER JOIN order_item oi ON b.id = oi.id_book
    WHERE p.id = p_publisher_id;

    RETURN v_total_arrecadado;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION public.calculate_estimated_freight(p_estado character varying)
 RETURNS numeric
 LANGUAGE plpgsql
AS $function$
DECLARE
    v_frete DECIMAL(10,2);
BEGIN
    CASE UPPER(p_estado)
        WHEN 'SP' THEN v_frete := 15.00;
        WHEN 'RJ', 'MG', 'ES' THEN v_frete := 20.00;
        WHEN 'BA', 'PE', 'CE', 'SE', 'AL', 'PB', 'RN', 'MA', 'PI' THEN v_frete := 35.00;
        WHEN 'DF', 'GO', 'MT', 'MS' THEN v_frete := 25.00;
        WHEN 'RS', 'PR', 'SC' THEN v_frete := 22.00;
        ELSE v_frete := 40.00; 
    END CASE;

    RETURN v_frete;
END;
$function$
;
