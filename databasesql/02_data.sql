INSERT INTO type_payment (id, description) VALUES
(1, 'PIX'), (2, 'Cartão de Crédito'), (3, 'Boleto'), (4, 'Cartão de Débito');

INSERT INTO category (id, genre, language) VALUES
(1, 'Romance',           'Português'), 
(2, 'Ficção Científica', 'Português'),
(3, 'Fantasia',          'Inglês'), 
(4, 'Biografia',         'Português'), 
(5, 'Terror',            'Inglês');

INSERT INTO book_condition (id, condition_description, price_depreciation) VALUES
(1, 'Novo',            0.00), 
(2, 'Seminovo',       15.00), 
(3, 'Marcas de Tempo', 30.00);

INSERT INTO publisher (id, name) VALUES
(1, 'Intrínseca'), 
(2, 'Sextante'), 
(3, 'DarkSide Books'), 
(4, 'Companhia das Letras'), 
(5, 'Rocco');

INSERT INTO author (id, name) VALUES
(1, 'Machado de Assis'), 
(2, 'J.K. Rowling'), 
(3, 'George Orwell'), 
(4, 'Stephen King'), 
(5, 'Clarice Lispector');

INSERT INTO admin_user (id, name, job_title, email, phone) VALUES
(1, 'Anna Mayná',     'Administradora',         'anna@odisseia.com',    '75988887777'),
(2, 'Diná Borges',    'Operadora de Logística', 'dina@odisseia.com',    '75988887779'),
(3, 'Lismara Santos', 'Atendimento',            'lismara@odisseia.com', '75988887780');

INSERT INTO supplier (id, name, cpf, email, phone, address) VALUES
(1, 'Fornecedor Alpha', '10000000001', 'alpha@fornece.com',  '11999999991', 'Av. Paulista, 100'),
(2, 'Fornecedor Beta',  '20000000002', 'beta@fornece.com',   '11999999992', 'Rua Augusta, 200'),
(3, 'Sebo Esperança',   '30000000003', 'esperanca@sebo.com', '11999999993', 'Praça da Sé, 10');

INSERT INTO customer (id, name, cpf, email, phone, address) VALUES
(1, 'Carlos Mendes', '12345678901', 'carlos@mail.com', '75911112222', 'Rua Um, 10'),
(2, 'Fernanda Lima', '12345678902', 'fernanda@mail.com', '75911112223', 'Rua Dois, 20'),
(3, 'Julio Cesar', '12345678903', 'julio@mail.com', '75911112224', 'Rua Tres, 30'),
(4, 'Mariana Costa', '12345678904', 'mariana@mail.com', '75911112225', 'Rua Quatro, 40'),
(5, 'Pedro Santos', '12345678905', 'pedro@mail.com', '75911112226', 'Rua Cinco, 50'),
(6, 'Lucia Alves', '12345678906', 'lucia@mail.com', '75911112227', 'Rua Seis, 60'),
(7, 'Ricardo Gomes', '12345678907', 'ricardo@mail.com', '75911112228', 'Rua Sete, 70'),
(8, 'Amanda Souza', '12345678908', 'amanda@mail.com', '75911112229', 'Rua Oito, 80'),
(9, 'Roberto Dias', '12345678909', 'roberto@mail.com', '75911112230', 'Rua Nove, 90'),
(10, 'Camila Rocha', '12345678910', 'camila@mail.com', '75911112231', 'Rua Dez, 100'),
(11, 'Thiago Silva', '12345678911', 'thiago@mail.com', '75911112232', 'Rua Onze, 110'),
(12, 'Beatriz Melo', '12345678912', 'beatriz@mail.com', '75911112233', 'Rua Doze, 120'),
(13, 'Marcelo Farias', '12345678913', 'marcelo@mail.com', '75911112234', 'Rua Treze, 130'),
(14, 'Vanessa Cruz', '12345678914', 'vanessa@mail.com', '75911112235', 'Rua Quatorze, 140'),
(15, 'Rafael Nunes', '12345678915', 'rafael@mail.com', '75911112236', 'Rua Quinze, 150'),
(16, 'Patricia Moura', '12345678916', 'patricia@mail.com', '75911112237', 'Rua Dezesseis, 160'),
(17, 'Gustavo Pires', '12345678917', 'gustavo@mail.com', '75911112238', 'Rua Dezessete, 170'),
(18, 'Aline Barros', '12345678918', 'aline@mail.com', '75911112239', 'Rua Dezoito, 180'),
(19, 'Diego Neves', '12345678919', 'diego@mail.com', '75911112240', 'Rua Dezenove, 190'),
(20, 'Luana Mendes', '12345678920', 'luana@mail.com', '75911112241', 'Rua Vinte, 200'),
(21, 'Felipe Castro', '12345678921', 'felipe@mail.com', '75911112242', 'Rua Vinte Um, 210'),
(22, 'Carolina Sales', '12345678922', 'carolina@mail.com', '75911112243', 'Rua Vinte Dois, 220'),
(23, 'Bruno Martins', '12345678923', 'bruno@mail.com', '75911112244', 'Rua Vinte Tres, 230'),
(24, 'Tatiana Reis', '12345678924', 'tatiana@mail.com', '75911112245', 'Rua Vinte Quatro, 240'),
(25, 'Leandro Lopes', '12345678925', 'leandro@mail.com', '75911112246', 'Rua Vinte Cinco, 250'),
(26, 'Renata Nogueira', '12345678926', 'renata@mail.com', '75911112247', 'Rua Vinte Seis, 260'),
(27, 'Rodrigo Porto', '12345678927', 'rodrigo@mail.com', '75911112248', 'Rua Vinte Sete, 270'),
(28, 'Sabrina Lemos', '12345678928', 'sabrina@mail.com', '75911112249', 'Rua Vinte Oito, 280'),
(29, 'Alexandre Viana', '12345678929', 'alexandre@mail.com', '75911112250', 'Rua Vinte Nove, 290'),
(30, 'Julia Carvalho', '12345678930', 'julia@mail.com', '75911112251', 'Rua Trinta, 300');

INSERT INTO author_publisher (id, id_author, id_publisher) VALUES
(1, 1, 1), (2, 1, 2), (3, 1, 3), (4, 1, 4), (5, 1, 5),
(6, 2, 1), (7, 2, 2), (8, 2, 3), (9, 2, 4), (10, 2, 5),
(11, 3, 1), (12, 3, 2), (13, 3, 3), (14, 3, 4), (15, 3, 5),
(16, 4, 1), (17, 4, 2), (18, 4, 3), (19, 4, 4), (20, 4, 5),
(21, 5, 1), (22, 5, 2), (23, 5, 3), (24, 5, 4), (25, 5, 5);

INSERT INTO book (id, title, id_category, id_publisher, id_condition, id_supplier, id_admin) VALUES
(1, 'Dom Casmurro Edição Especial', 1, 1, 1, 1, 1), (2, 'Harry Potter e a Pedra Filosofal', 3, 5, 2, 2, 2),
(3, '1984 - Nova Tradução', 2, 4, 1, 3, 3), (4, 'O Iluminado', 5, 2, 3, 1, 1),
(5, 'A Hora da Estrela', 1, 3, 1, 2, 2), (6, 'Memórias Póstumas - Capa Dura', 1, 2, 1, 3, 3),
(7, 'Câmara Secreta Ilustrado', 3, 1, 2, 1, 1), (8, 'A Revolução dos Bichos', 2, 5, 1, 2, 2),
(9, 'It: A Coisa', 5, 4, 3, 3, 3), (10, 'Laços de Família', 1, 3, 2, 1, 1),
(11, 'Quincas Borba', 1, 5, 1, 2, 2), (12, 'Prisioneiro de Azkaban', 3, 2, 3, 3, 3),
(13, 'O Conto da Aia (Referência)', 2, 1, 1, 1, 1), (14, 'Cemitério Maldito', 5, 3, 2, 2, 2),
(15, 'A Paixão Segundo G.H.', 1, 4, 1, 3, 3), (16, 'Helena', 1, 1, 3, 1, 1),
(17, 'Cálice de Fogo', 3, 4, 1, 2, 2), (18, 'Fahrenheit 451 (Estudo)', 2, 2, 2, 3, 3),
(19, 'A Dança da Morte', 5, 5, 1, 1, 1), (20, 'Felicidade Clandestina', 1, 3, 2, 2, 2),
(21, 'Esaú e Jacó', 1, 2, 1, 3, 3), (22, 'Ordem da Fênix', 3, 5, 3, 1, 1),
(23, 'Admirável Mundo Novo', 2, 1, 1, 2, 2), (24, 'Misery', 5, 4, 2, 3, 3),
(25, 'Água Viva', 1, 2, 1, 1, 1), (26, 'Memorial de Aires', 1, 3, 3, 2, 2),
(27, 'Enigma do Príncipe', 3, 1, 1, 3, 3), (28, 'O Homem do Castelo Alto', 2, 5, 2, 1, 1),
(29, 'O Iluminado (Inglês)', 5, 1, 1, 2, 2), (30, 'Perto do Coração Selvagem', 1, 4, 2, 3, 3);


INSERT INTO book_order (id, id_customer, quantity_item, order_date, status, total_value) VALUES
(1, 1, 2, '2025-10-01', 'Finalizado', 50.00), (2, 2, 1, '2025-10-02', 'Em andamento', 35.50),
(3, 3, 3, '2025-10-03', 'Finalizado', 120.00), (4, 4, 1, '2025-10-04', 'Cancelado', 40.00),
(5, 5, 4, '2025-10-05', 'Finalizado', 200.00), (6, 6, 1, '2025-10-06', 'Enviado', 60.00),
(7, 7, 2, '2025-10-07', 'Finalizado', 85.00), (8, 8, 1, '2025-10-08', 'Em andamento', 45.00),
(9, 9, 3, '2025-10-09', 'Finalizado', 150.00), (10, 10, 2, '2025-10-10', 'Enviado', 75.00),
(11, 11, 1, '2025-10-11', 'Finalizado', 30.00), (12, 12, 5, '2025-10-12', 'Aguardando Pagamento', 250.00),
(13, 13, 2, '2025-10-13', 'Finalizado', 90.00), (14, 14, 1, '2025-10-14', 'Em andamento', 55.00),
(15, 15, 3, '2025-10-15', 'Finalizado', 130.00), (16, 16, 2, '2025-10-16', 'Cancelado', 80.00),
(17, 17, 1, '2025-10-17', 'Finalizado', 25.00), (18, 18, 4, '2025-10-18', 'Enviado', 180.00),
(19, 19, 2, '2025-10-19', 'Finalizado', 70.00), (20, 20, 1, '2025-10-20', 'Em andamento', 40.00),
(21, 21, 3, '2025-10-21', 'Finalizado', 110.00), (22, 22, 2, '2025-10-22', 'Enviado', 95.00),
(23, 23, 1, '2025-10-23', 'Finalizado', 50.00), (24, 24, 5, '2025-10-24', 'Aguardando Pagamento', 220.00),
(25, 25, 2, '2025-10-25', 'Finalizado', 85.00), (26, 26, 1, '2025-10-26', 'Em andamento', 60.00),
(27, 27, 3, '2025-10-27', 'Finalizado', 145.00), (28, 28, 2, '2025-10-28', 'Cancelado', 75.00),
(29, 29, 1, '2025-10-29', 'Finalizado', 35.00), (30, 30, 4, '2025-10-30', 'Enviado', 190.00);

INSERT INTO payment (id, id_order, id_type_payment, date_payment, total_value) VALUES
(3, 3, 3, '2025-10-04', 120.00), 
(4, 4, 1, '2025-10-04', 40.00),
(5, 5, 4, '2025-10-05', 200.00), 
(6, 6, 1, '2025-10-06', 60.00),
(7, 7, 2, '2025-10-07', 85.00), 
(8, 8, 3, '2025-10-09', 45.00),
(9, 9, 1, '2025-10-09', 150.00), 
(10, 10, 4, '2025-10-10', 75.00),
(11, 11, 1, '2025-10-11', 30.00), 
(12, 12, 2, '2025-10-13', 250.00),
(13, 13, 3, '2025-10-14', 90.00), 
(14, 14, 1, '2025-10-14', 55.00),
(15, 15, 4, '2025-10-15', 130.00), 
(16, 16, 1, '2025-10-16', 80.00),
(17, 17, 2, '2025-10-17', 25.00), 
(18, 18, 3, '2025-10-19', 180.00),
(19, 19, 1, '2025-10-19', 70.00), 
(20, 20, 4, '2025-10-20', 40.00),
(21, 21, 1, '2025-10-21', 110.00), 
(22, 22, 2, '2025-10-22', 95.00),
(23, 23, 3, '2025-10-24', 50.00), 
(24, 24, 1, '2025-10-24', 220.00),
(25, 25, 4, '2025-10-25', 85.00), 
(26, 26, 1, '2025-10-26', 60.00),
(27, 27, 2, '2025-10-27', 145.00), 
(28, 28, 3, '2025-10-29', 75.00),
(29, 29, 1, '2025-10-29', 35.00), 
(30, 30, 4, '2025-10-30', 190.00);

INSERT INTO order_item (id, id_order, id_book, qty, sell_price, total_value) VALUES
(1, 1, 1, 1, 50.00, 50.00), (2, 2, 2, 1, 35.50, 35.50), (3, 3, 3, 1, 120.00, 120.00), (4, 4, 4, 1, 40.00, 40.00), (5, 5, 5, 1, 200.00, 200.00), (6, 6, 6, 1, 60.00, 60.00),
(7, 7, 7, 1, 85.00, 85.00), (8, 8, 8, 1, 45.00, 45.00), (9, 9, 9, 1, 150.00, 150.00), (10, 10, 10, 1, 75.00, 75.00), (11, 11, 11, 1, 30.00, 30.00), (12, 12, 12, 1, 250.00, 250.00),
(13, 13, 13, 1, 90.00, 90.00), (14, 14, 14, 1, 55.00, 55.00), (15, 15, 15, 1, 130.00, 130.00), (16, 16, 16, 1, 80.00, 80.00), (17, 17, 17, 1, 25.00, 25.00), (18, 18, 18, 1, 180.00, 180.00),
(19, 19, 19, 1, 70.00, 70.00), (20, 20, 20, 1, 40.00, 40.00), (21, 21, 21, 1, 110.00, 110.00), (22, 22, 22, 1, 95.00, 95.00), (23, 23, 23, 1, 50.00, 50.00), (24, 24, 24, 1, 220.00, 220.00),
(25, 25, 25, 1, 85.00, 85.00), (26, 26, 26, 1, 60.00, 60.00), (27, 27, 27, 1, 145.00, 145.00), (28, 28, 28, 1, 75.00, 75.00), (29, 29, 29, 1, 35.00, 35.00), (30, 30, 30, 1, 190.00, 190.00);

INSERT INTO customer_shipping (id, id_order, tracking_code, shipping_date, shipping_value) VALUES
(1, 1, 'BR000000001BR', '2025-10-02', 15.00), (2, 2, 'BR000000002BR', '2025-10-03', 12.50),
(3, 3, 'BR000000003BR', '2025-10-05', 20.00), (4, 4, 'BR000000004BR', '2025-10-05', 10.00),
(5, 5, 'BR000000005BR', '2025-10-06', 25.00), (6, 6, 'BR000000006BR', '2025-10-07', 18.00),
(7, 7, 'BR000000007BR', '2025-10-08', 15.00), (8, 8, 'BR000000008BR', '2025-10-10', 14.50),
(9, 9, 'BR000000009BR', '2025-10-10', 22.00), (10, 10, 'BR000000010BR', '2025-10-11', 16.00),
(11, 11, 'BR000000011BR', '2025-10-12', 15.00), (12, 12, 'BR000000012BR', '2025-10-14', 30.00),
(13, 13, 'BR000000013BR', '2025-10-15', 18.00), (14, 14, 'BR000000014BR', '2025-10-15', 12.00),
(15, 15, 'BR000000015BR', '2025-10-16', 20.00), (16, 16, 'BR000000016BR', '2025-10-17', 15.00),
(17, 17, 'BR000000017BR', '2025-10-18', 10.00), (18, 18, 'BR000000018BR', '2025-10-20', 28.00),
(19, 19, 'BR000000019BR', '2025-10-20', 15.00), (20, 20, 'BR000000020BR', '2025-10-21', 14.00),
(21, 21, 'BR000000021BR', '2025-10-22', 20.00), (22, 22, 'BR000000022BR', '2025-10-23', 18.00),
(23, 23, 'BR000000023BR', '2025-10-25', 12.00), (24, 24, 'BR000000024BR', '2025-10-25', 25.00),
(25, 25, 'BR000000025BR', '2025-10-26', 15.00), (26, 26, 'BR000000026BR', '2025-10-27', 16.00),
(27, 27, 'BR000000027BR', '2025-10-28', 22.00), (28, 28, 'BR000000028BR', '2025-10-30', 18.00),
(29, 29, 'BR000000029BR', '2025-10-30', 10.00), (30, 30, 'BR000000030BR', '2025-10-31', 26.00);

INSERT INTO supplier_coupon (id, donated_books_quantity, redemption_points) VALUES
(1, 10, 50), (2, 20, 100), (3, 5, 25);

INSERT INTO supplier_shipping (id, id_supplier, tracking_code, shipping_date, shipping_value) VALUES
(1, 1, 'SUP000000001BR', '2025-09-01', 35.00), (2, 2, 'SUP000000002BR', '2025-09-02', 40.00),
(3, 3, 'SUP000000003BR', '2025-09-03', 25.00), (4, 1, 'SUP000000004BR', '2025-09-04', 30.00),
(5, 2, 'SUP000000005BR', '2025-09-05', 55.00), (6, 3, 'SUP000000006BR', '2025-09-06', 45.00),
(7, 1, 'SUP000000007BR', '2025-09-07', 35.00), (8, 2, 'SUP000000008BR', '2025-09-08', 50.00),
(9, 3, 'SUP000000009BR', '2025-09-09', 60.00), (10, 1, 'SUP000000010BR', '2025-09-10', 48.00),
(11, 2, 'SUP000000011BR', '2025-09-11', 32.00), (12, 3, 'SUP000000012BR', '2025-09-12', 42.00),
(13, 1, 'SUP000000013BR', '2025-09-13', 28.00), (14, 2, 'SUP000000014BR', '2025-09-14', 38.00),
(15, 3, 'SUP000000015BR', '2025-09-15', 52.00), (16, 1, 'SUP000000016BR', '2025-09-16', 46.00),
(17, 2, 'SUP000000017BR', '2025-09-17', 36.00), (18, 3, 'SUP000000018BR', '2025-09-18', 54.00),
(19, 1, 'SUP000000019BR', '2025-09-19', 62.00), (20, 2, 'SUP000000020BR', '2025-09-20', 44.00),
(21, 3, 'SUP000000021BR', '2025-09-21', 34.00), (22, 1, 'SUP000000022BR', '2025-09-22', 41.00),
(23, 2, 'SUP000000023BR', '2025-09-23', 26.00), (24, 3, 'SUP000000024BR', '2025-09-24', 31.00),
(25, 1, 'SUP000000025BR', '2025-09-25', 58.00), (26, 2, 'SUP000000026BR', '2025-09-26', 47.00),
(27, 3, 'SUP000000027BR', '2025-09-27', 37.00), (28, 1, 'SUP000000028BR', '2025-09-28', 51.00),
(29, 2, 'SUP000000029BR', '2025-09-29', 65.00), (30, 3, 'SUP000000030BR', '2025-09-30', 49.00);