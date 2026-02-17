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
    endereco varchar(200) not null
);
