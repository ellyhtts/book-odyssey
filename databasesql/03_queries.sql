-- 1. Left Join: Liste os títulos dos livros e a descrição do seu status de conservação (Novo, Seminovo, etc.).
SELECT b.title AS "Título do Livro", bc.condition_description AS "Estado de Conservação"
FROM book b
LEFT JOIN book_condition bc ON b.id_condition = bc.id;

-- 2. Inner Join: Recupere o ID do pedido e o nome completo do cliente que realizou a compra.
SELECT bo.id AS "ID do Pedido", c.name AS "Nome do Cliente"
FROM book_order bo
INNER JOIN customer c ON bo.id_customer = c.id;

-- 3. Inner Join: Exiba o nome do livro e o nome da editora que o publicou.
SELECT b.title AS "Título do Livro", p.name AS "Editora"
FROM book b
INNER JOIN publisher p ON b.id_publisher = p.id;

-- 4. Left Join: Mostre todos os registros de logística (envios) e os IDs dos pedidos, incluindo pedidos que ainda não saíram para entrega.
SELECT bo.id AS "ID do Pedido", cs.tracking_code AS "Código de Rastreio", cs.shipping_date AS "Data de Envio"
FROM book_order bo
LEFT JOIN customer_shipping cs ON bo.id = cs.id_order;

-- 5. Inner Join: Relacione o livro com a categoria literária à qual ele foi associado.
SELECT b.title AS "Título do Livro", c.genre AS "Categoria Literária"
FROM book b
INNER JOIN category c ON b.id_category = c.id;

-- 6. Inner Join: Mostre o valor do pedido e os detalhes da forma de pagamento escolhida pelo cliente.
SELECT bo.total_value AS "Valor do Pedido", tp.description AS "Forma de Pagamento", p.date_payment AS "Data do Pagamento"
FROM book_order bo
INNER JOIN payment p ON bo.id = p.id_order
INNER JOIN type_payment tp ON p.id_type_payment = tp.id;

-- 7. Left Join: Liste todos os clientes cadastrados e seu histórico de compras, incluindo aqueles que apenas criaram conta.
SELECT c.name AS "Cliente", bo.id AS "ID do Pedido", bo.order_date AS "Data da Compra"
FROM customer c
LEFT JOIN book_order bo ON c.id = bo.id_customer;

-- 8. Inner Join: Exiba o nome do fornecedor e o título do livro que ele disponibilizou para a loja.
SELECT s.name AS "Fornecedor", b.title AS "Título do Livro"
FROM supplier s
INNER JOIN book b ON s.id = b.id_supplier;

-- 9. Inner Join: Relacione os cupons de fidelidade com o nome do fornecedor que acumulou os pontos.
SELECT s.name AS "Fornecedor", sc.donated_books_quantity AS "Livros Doados", sc.redemption_points AS "Pontos Acumulados"
FROM supplier_coupon sc
INNER JOIN supplier s ON sc.id = s.id;

-- 10. Right Join: Liste todos os estados de conservação possíveis e os livros vinculados a eles, mesmo estados que não têm exemplares no estoque.
SELECT bc.condition_description AS "Estado de Conservação", b.title AS "Título do Livro"
FROM book b
RIGHT JOIN book_condition bc ON b.id_condition = bc.id;

-- 11. Inner Join: Mostre o nome do administrador e as alterações que ele realizou no catálogo de livros.
SELECT a.name AS "Administrador", b.title AS "Livro Cadastrado/Alterado"
FROM admin_user a
INNER JOIN book b ON a.id = b.id_admin;

-- 12. Left Join: Exiba o título do livro e o custo do frete associado ao seu envio, mesmo para livros que nunca foram despachados.
SELECT b.title AS "Título do Livro", cs.shipping_value AS "Custo do Frete"
FROM book b
LEFT JOIN order_item oi ON b.id = oi.id_book
LEFT JOIN book_order bo ON oi.id_order = bo.id
LEFT JOIN customer_shipping cs ON bo.id = cs.id_order;