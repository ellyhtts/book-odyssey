drop table if exists payment;
drop table if exists customer_shipping;
drop table if exists supplier_shipping;
drop table if exists supplier_coupon;
drop table if exists book_order;
drop table if exists author_publisher;
drop table if exists book;

drop table if exists admin_user;
drop table if exists supplier;
drop table if exists customer;
drop table if exists author;
drop table if exists publisher;
drop table if exists book_condition;
drop table if exists category;



create table book (
	id int not null, 
	name_book varchar(100) not null,
	constraint pk_id_book primary key (id)
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


create table author_publisher(
	id_author int not null,
	id_publisher int not null,
	constraint pk_author_publisher primary key (id_author, id_publisher)
);


create table categorie (
	id int not null,
	genre varchar(100) not null,
	language varchar(50) not null,
	constraint pk_id_category primary key (id)
);


create table book_condition (
	id int not null,
	condition_description varchar(50) not null,
	price_depreciation decimal(10,2) not null,
	constraint pk_id_condition primary key (id)
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


create table book_order (
    id_order int not null,
    id_customer int not null,
    quantity_item int not null,
    date_orders date default current_date,
    current_status varchar(100) not null,
    total_value decimal(10,2) not null,
    constraint pk_id_orders primary key (id_order)
);


create table payment(
    id_payment int not null,
    id_orders int not null, 
    payment_method varchar (50) not null,
    date_payment date not null,
    total_value decimal (10,2),
    constraint pk_id_payment primary key (id_payment)
);


create table customer_shipping (
	id_shipping int not null,
	tracking_code varchar (50) not null,
	shipping_date date not null,
	shipping_value decimal(10,2) not null,
	constraint pk_id_shipping primary key (id_shipping)
);


create table supplier_coupon (
	id int not null,
	donated_books_quantity int not null,
	redemption_points int not null,
	constraint pk_id_supplier_coupon primary key (id)
);

create table supplier_shipping (
	id int not null,
	tracking_code varchar(50) not null,
	shipping_date date not null,
	shipping_value numeric(10,2) NOT NULL,
	constraint supplier_shipping_tracking_code_key UNIQUE (tracking_code),
	constraint supplier_shipping_pkey primary key (id)
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
	id_admin serial not null,
	name_admin varchar(100) not null,
	job_title varchar(50) not null,
	email varchar(100) not null,
	phone varchar(15) not null,
	constraint admin_users_email_key UNIQUE (email),
	constraint admin_users_pkey primary key (id)
);
