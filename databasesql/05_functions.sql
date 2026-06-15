-- Function: Recebe o ID do livro e retorna o estado físico (condição) detalhado.
CREATE OR REPLACE FUNCTION ObterStatusConservacao(p_book_id INT)
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
CREATE OR REPLACE FUNCTION TotalVendasPorEditora(p_publisher_id INT)
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