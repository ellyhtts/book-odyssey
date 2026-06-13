CREATE OR replace VIEW catalogoporestado AS SELECT 
b.title AS "titulo do livro",
c.genre AS "gênero", 
bc.condition_description AS "estado de conservação",
b.final_price AS "preço atual"
FROM book b 
INNER JOIN category c ON b.id_category = c.id
INNER JOIN book_condition bc ON b.id_condition = bc.id
ORDER BY bc.condition_description ASC;

-----------------------------------------------------------

CREATE OR REPLACE VIEW LeaderboardFornecedores AS
SELECT 
    DENSE_RANK() OVER (ORDER BY COALESCE(sc.donated_books_quantity, 0) DESC) AS "Posição",
    s.name AS "Fornecedor",
    COALESCE(sc.donated_books_quantity, 0) AS "Total de Livros Doados",
    COALESCE(sc.redemption_points, 0) AS "Pontos Atuais"
FROM supplier s
LEFT JOIN supplier_coupon sc ON s.id = sc.id
ORDER BY "Posição" ASC;

------------------------------------------------------------

CREATE OR REPLACE VIEW public.logistic_tracking
AS SELECT bo.id AS "ID do Pedido",
    c.name AS "Cliente",
    bo.status AS "Status",
    cs.tracking_code AS "Código de Rastreio",
    cs.shipping_date AS "Data de Envio",
    to_char(cs.shipping_date::timestamp with time zone, 'MM/YYYY'::text) AS "Mês de Referência",
    cs.shipping_value AS "Valor do Frete"
   FROM book_order bo
     JOIN customer c ON bo.id_customer = c.id
     JOIN customer_shipping cs ON bo.id = cs.id_order
  ORDER BY cs.shipping_date DESC;
