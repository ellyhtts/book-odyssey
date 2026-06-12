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