create database book_odyssey;

create table books (
id_books int not null, 
name_books varchar(100) not null,
name_authors varchar(80) not null,
constraint pk_id_books primary key (id_books)
);


create table publishers(
id_publishers int not null,
name_publishers varchar(100) not null,
name_writers varchar (80) not null,
number_works int not null,
constraint pk_id_publishers primary key (id_publishers)
);


create table categories (
id_category int not null auto_increment,
gender varchar(100) not null,
language varchar(50) not null,
constraint pk_id_category primary key (id_category)
);


create table book_condition (
id_condition int not null auto_increment,
condition_description varchar(50) not null,
price_depreciation decimal(5,2) not null,
constraint pk_id_condition primary key (id_condition)
);


create table customers (
    id_customers int not null,
    name_customers varchar(100) not null, 
    cpf char(11) not null,
    Email varchar(100) not null,
    telefone varchar(15) not null,
    endereco varchar(200) not null,
    constraint pk_id_customers primary key (id_customers)
);


create table orders (
    id_orders int not null,
    id_customers int not null,
    quantity_items int not null,
    date_orders date not null,
    current_status varchar(100) not null,
    total_value decimal(10,2) not null,
    constraint pk_id_orders primary key (id_orders)
);


create table payment(
    id_payment int not null,
    id_orders int not null, 
    payment_method varchar (50) not null,
    date_payment date not null,
    total_value decimal (10,20),
    constraint pk_id_payment primary key (id_payment)
);


create table customer_shipping (
id_shipping serial not null,
tracking_code varchar (50) not null,
shipping_date date not null,
shipping_value decimal(10, 2) not null,
constraint pk_id_shipping primary key (id_shipping)
);


create table supplier_coupons (
id_supplier int not null,
donated_books_quantity int not null,
redemption_points int not null,
constraint pk_id_supplier_coupon primary key (id_supplier)
);

