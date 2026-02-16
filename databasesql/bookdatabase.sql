create database book_odyssey

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
