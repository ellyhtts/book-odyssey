CREATE OR replace VIEW catalogoporestado AS SELECT 
b.title AS "titulo do livro",
c.genre AS "gênero", 
bc.condition_description AS "estado de conservação",
b.final_price AS "preço atual"
FROM book b 
INNER JOIN category c ON b.id_category = c.id
INNER JOIN book_condition bc ON b.id_condition = bc.id
ORDER BY bc.condition_description ASC;


select * from catalogoporestado;