-- 1 Group By: Conte a quantidade de livros para cada estado de conservação (Novo, Seminovo, etc.).
SELECT 
    bc.condition_description AS "Estado de Conservação",
    COUNT(b.id) AS "Quantidade de Livros"
FROM book_condition bc
LEFT JOIN book b 
    ON b.id_condition = bc.id
GROUP BY bc.condition_description
ORDER BY "Quantidade de Livros" ASC;

-- 2 Group By: Calcule o valor total de frete pago agrupado por mês de envio.
SELECT 
    p.name AS "Editora",
    COUNT(b.id) AS "Quantidade de Livros"
FROM publisher p
LEFT JOIN book b 
    ON b.id_publisher = p.id
GROUP BY p.name
ORDER BY "Quantidade de Livros" ASC;

-- 3 Group By: Liste a quantidade de livros cadastrados para cada editora.
SELECT 
    c.genre AS "Gênero Literário",
    COUNT(b.id) AS "Quantidade de Livros"
FROM category c
LEFT JOIN book b 
    ON b.id_category = c.id
GROUP BY c.genre
ORDER BY "Quantidade de Livros" ASC;

SELECT 
    TO_CHAR(shipping_date, 'MM/YYYY') AS "Mês de Envio",
    SUM(shipping_value) AS "Total Gasto com Frete"
FROM customer_shipping
GROUP BY TO_CHAR(shipping_date, 'MM/YYYY')
ORDER BY "Mês de Envio" DESC;

SELECT 
    status AS "Fase do Pedido",
    COUNT(*) AS "Quantidade de Pedidos"
FROM book_order
GROUP BY status
ORDER BY "Quantidade de Pedidos" DESC;

SELECT 
    b.title AS "Livro",
    cs.tracking_code AS "Código de Rastreio",
    bo.status AS "Status Atual"
FROM book b
INNER JOIN order_item oi ON b.id = oi.id_book
INNER JOIN book_order bo ON oi.id_order = bo.id
INNER JOIN customer_shipping cs ON bo.id = cs.id_order
ORDER  BY cs.shipping_date DESC;

-- 4 Group By: Some o total de pontos de fidelidade acumulados por cada fornecedor.
SELECT 
    s.name AS "Fornecedor",
    SUM(sc.redemption_points) AS "Total de Pontos"
FROM supplier s
LEFT JOIN supplier_coupon sc
    ON sc.id = s.id
GROUP BY s.name
ORDER BY "Total de Pontos" ASC;


-- 5 Union: Gere uma lista com todos os nomes de autores e nomes de editoras.
SELECT 
    name AS "Nome", 
    'Autor' AS "Categoria" 
FROM author
UNION
SELECT 
    name AS "Nome", 
    'Editora' AS "Categoria" 
FROM publisher
ORDER BY "Nome" ASC;


-- 9 Union: Liste os nomes de todos os compradores e os nomes de todos os fornecedores.
SELECT 
    name AS "Nome do Contato", 
    'Cliente' AS "Tipo de Relação" 
FROM customer
UNION
SELECT 
    name AS "Nome do Contato", 
    'Fornecedor' AS "Tipo de Relação" 
FROM supplier
ORDER BY "Nome do Contato" ASC;