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
