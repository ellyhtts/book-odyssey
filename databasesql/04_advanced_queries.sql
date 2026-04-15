-- 1.Group By: Conte a quantidade de livros para cada estado de conservação (Novo, Seminovo, etc.). OK
SELECT 
    bc.condition_description AS "Estado de Conservação",
    COUNT(b.id) AS "Quantidade de Livros"
FROM book_condition bc
LEFT JOIN book b 
    ON b.id_condition = bc.id
GROUP BY bc.condition_description
ORDER BY "Quantidade de Livros" ASC;

-- 2.Group By: Calcula o valor total de frete pago agrupado por mês de envio.
SELECT 
    TO_CHAR(shipping_date, 'MM/YYYY') AS "Mês de Envio",
    SUM(shipping_value) AS "Total Gasto com Frete"
FROM customer_shipping
GROUP BY TO_CHAR(shipping_date, 'MM/YYYY')
ORDER BY "Mês de Envio" DESC;

-- 3.Group By: Liste a quantidade de livros cadastrados para cada editora.
SELECT 
    p.name AS "Editora",
    COUNT(b.id) AS "Quantidade de Livros"
FROM publisher p
LEFT JOIN book b 
    ON b.id_publisher = p.id
GROUP BY p.name
ORDER BY "Quantidade de Livros" ASC;

-- 4.Group By: Some o total de pontos de fidelidade acumulados por cada fornecedor. 
SELECT 
    s.name AS "Fornecedor",
    SUM(sc.redemption_points) AS "Total de Pontos"
FROM supplier s
LEFT JOIN supplier_coupon sc
    ON sc.id = s.id
GROUP BY s.name
ORDER BY "Total de Pontos" ASC;

-- 5.Union: Gere uma lista com todos os nomes de autores e nomes de editoras. 
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

-- 6 Union All: Combine os títulos de todos os livros vendidos com os títulos de livros recebidos por doação.
SELECT b.title AS "Título do Livro", 'Vendido' AS "Origem" FROM book b
JOIN order_item oi ON b.id = oi.id_book
UNION ALL
SELECT b.title AS "Título do Livro", 'Doado/Fornecedor' AS "Origem" FROM book b
WHERE b.id_supplier IS NOT NULL;

-- 7 Intersect: Identifique clientes que compraram tanto livros de "Romance" quanto de "Ficção".
SELECT c.name AS "Cliente" FROM customer c
JOIN book_order bo ON c.id = bo.id_customer
JOIN order_item oi ON bo.id = oi.id_order
JOIN book b ON oi.id_book = b.id
WHERE b.id_category = 1 -- Romance
INTERSECT
SELECT c.name AS "Cliente" FROM customer c
JOIN book_order bo ON c.id = bo.id_customer
JOIN order_item oi ON bo.id = oi.id_order
JOIN book b ON oi.id_book = b.id
WHERE b.id_category = 2; -- Ficção

-- 8 Group By: Calcule o valor médio de venda dos livros agrupados por categoria literária.
SELECT 
    c.genre AS "Categoria Literária", 
    ROUND(AVG(oi.sell_price), 2) AS "Valor Médio de Venda"
FROM category c
JOIN book b ON c.id = b.id_category
JOIN order_item oi ON b.id = oi.id_book
GROUP BY c.genre;

-- 9.Union: Liste os nomes de todos os compradores e os nomes de todos os fornecedores. 
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

-- 10.Group By: Conte o total de pedidos agrupados por status (Pendente, Pago, Enviado). OK
SELECT status, COUNT(id) AS total_pedidos
FROM book_order
GROUP BY status; 

-- 11.Intersect: Encontre livros que estão no catálogo e que possuem um código de rastreio de logística associado. OK
SELECT 
	b.title FROM book b
INTERSECT
SELECT 
	b.title FROM book b
JOIN order_item oi ON b.id = oi.id_book
JOIN customer_shipping cs ON oi.id_order = cs.id_order;

-- 12.Group By: Liste o total de exemplares disponíveis agrupado por categoria. 
SELECT 
	c.genre, COUNT(b.id) as exemplares_disponiveis
FROM book b
JOIN category c ON b.id_category = c.id
GROUP BY c.genre;
