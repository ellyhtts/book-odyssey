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
description varchar(50) not null,
conservation decimal(5,2) not null,
constraint pk_id_condition primary key (id_condition)
);
