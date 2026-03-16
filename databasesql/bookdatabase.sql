drop table if exists payment cascade;
drop table if exists customer_shipping cascade;
drop table if exists supplier_shipping cascade;
drop table if exists supplier_coupon cascade;
drop table if exists book_order cascade;
drop table if exists author_publisher cascade;
drop table if exists book cascade;

drop table if exists admin_user cascade;
drop table if exists supplier cascade;
drop table if exists customer cascade;
drop table if exists author cascade;
drop table if exists publisher cascade;
drop table if exists book_condition cascade;
drop table if exists categorie cascade;

create table categorie (
	id int not null,
	genre varchar(100) not null,
	language varchar(50) not null,
	constraint pk_id_categorie primary key (id)
);

create table book_condition (
	id int not null,
	condition_description varchar(50) not null,
	price_depreciation decimal(10,2) not null,
	constraint pk_id_condition primary key (id)
);

create table publisher(
	id int not null,
	name varchar(100) not null,
	constraint pk_id_publisher primary key (id)
);

create table author(
	id int not null,
	name varchar(100) not null,
	constraint pk_id_author primary key (id)
);

create table customer (
    id int not null,
    name_customer varchar(100) not null, 
    cpf char(11) not null,
    Email varchar(100) not null,
    telefone varchar(15) not null,
    endereco varchar(200) not null,
    constraint pk_id_customer primary key (id)
);

create table supplier (
	id int not null,
	name_supplier varchar(100) not null,
	cpf char(11) not null,
	email varchar(100) not null,
	phone varchar(15) not null,
	address varchar(200) not null,
	constraint supplier_cpf_key UNIQUE (cpf),
	constraint supplier_pkey primary key (id)
	);

create table admin_user (
	id int not null,
	name_admin varchar(100) not null,
	job_title varchar(50) not null,
	email varchar(100) not null,
	phone varchar(15) not null,
	constraint admin_users_email_key UNIQUE (email),
	constraint admin_users_pkey primary key (id)
);

create table author_publisher(
	id_author int not null,
	id_publisher int not null,
	constraint pk_author_publisher primary key (id_author, id_publisher),
	constraint fk_ap_author foreign key (id_author) references author(id),
    constraint fk_ap_publisher foreign key (id_publisher) references publisher(id)
);

create table book (
	id int not null, 
	name_book varchar(100) not null,
	id_categorie int not null,
    id_publisher int not null, 
    id_condition int not null,
	constraint pk_id_book primary key (id),
	constraint fk_book_categorie foreign key (id_categorie) references categorie(id),
    constraint fk_book_publisher foreign key (id_publisher) references publisher(id),
    constraint fk_book_condition foreign key (id_condition) references book_condition(id)
);

create table book_order (
    id int not null,
    id_customer int not null,
    quantity_item int not null,
    date_orders date default current_date,
    current_status varchar(100) not null,
    total_value decimal(10,2) not null,
    constraint pk_id_orders primary key (id),
	constraint fk_order_customer foreign key (id_customer) references customer(id)
);

create table payment(
    id_payment int not null,
    id_orders int not null, 
    payment_method varchar (50) not null,
    date_payment date not null,
    total_value decimal (10,2),
    constraint pk_id_payment primary key (id_payment),
	constraint fk_payment_order foreign key (id_orders) references book_order(id_order)
);


create table customer_shipping (
	id int not null,
	id_orders int not null,
	tracking_code varchar (50) not null,
	shipping_date date not null,
	shipping_value decimal(10,2) not null,
	constraint pk_id_shipping primary key (id),
	constraint fk_shipping_order foreign key (id_orders) references book_order(id_order)
);

create table supplier_coupon (
	id int not null,
	donated_books_quantity int not null,
	redemption_points int not null,
	constraint pk_id_supplier_coupon primary key (id),
	constraint fk_coupon_supplier foreign key (id_supplier) references supplier(id)
);

create table supplier_shipping (
	id int not null,
	id_supplier int not null,
	tracking_code varchar(50) not null,
	shipping_date date not null,
	shipping_value numeric(10,2) NOT NULL,
	constraint supplier_shipping_pkey primary key (id),
    constraint fk_shipping_supplier foreign key (id_supplier) references supplier(id)
);

INSERT INTO categorie (id, genre, language) VALUES
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

INSERT INTO admin_user (id_admin, name_admin, job_title, email, phone) VALUES
(1, 'Anna Mayná',     'Administradora',         'anna@odisseia.com',    '75988887777'),
(2, 'Diná Borges',    'Operadora de Logística', 'dina@odisseia.com',    '75988887779'),
(3, 'Lismara Santos', 'Atendimento',            'lismara@odisseia.com', '75988887780');

INSERT INTO supplier (id, name_supplier, cpf, email, phone, address) VALUES
(1, 'Fornecedor Alpha', '10000000001', 'alpha@fornece.com',  '11999999991', 'Av. Paulista, 100'),
(2, 'Fornecedor Beta',  '20000000002', 'beta@fornece.com',   '11999999992', 'Rua Augusta, 200'),
(3, 'Sebo Esperança',   '30000000003', 'esperanca@sebo.com', '11999999993', 'Praça da Sé, 10');

