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

