drop table if exists payment cascade;
drop table if exists type_payment cascade;
drop table if exists customer_shipping cascade;
drop table if exists supplier_shipping cascade;
drop table if exists supplier_coupon cascade;
drop table if exists order_item cascade;
drop table if exists book_order cascade;
drop table if exists author_publisher cascade;
drop table if exists book cascade;

drop table if exists admin_user cascade;
drop table if exists supplier cascade;
drop table if exists customer cascade;
drop table if exists author cascade;
drop table if exists publisher cascade;
drop table if exists book_condition cascade;
drop table if exists category cascade;

create table category (
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

create table type_payment (
    id int not null,
    description varchar(50) not null,
    constraint pk_id_type_payment primary key (id)
);

create table customer (
    id int not null,
    name varchar(100) not null, 
    cpf char(11) not null,
    email varchar(100) not null,
    phone varchar(15) not null,
    address varchar(200) not null,
    constraint pk_id_customer primary key (id)
);

create table supplier (
    id int not null,
    name varchar(100) not null,
    cpf char(11) not null,
    email varchar(100) not null,
    phone varchar(15) not null,
    address varchar(200) not null,
    constraint supplier_cpf_key UNIQUE (cpf),
    constraint supplier_pkey primary key (id)
);

create table admin_user (
    id int not null,
    name varchar(100) not null,
    job_title varchar(50) not null,
    email varchar(100) not null,
    phone varchar(15) not null,
    constraint admin_users_email_key UNIQUE (email),
    constraint admin_users_pkey primary key (id)
);

create table author_publisher(
	id int not null,
    id_author int not null,
    id_publisher int not null,
    constraint pk_author_publisher primary key (id),
    constraint fk_ap_author foreign key (id_author) references author(id),
    constraint fk_ap_publisher foreign key (id_publisher) references publisher(id)
);

create table book (
    id int not null, 
    title varchar(100) not null,
    id_category int not null,
    id_publisher int not null, 
    id_condition int not null,
    id_supplier int not null, 
    id_admin int not null,    
    constraint pk_id_book primary key (id),
    constraint fk_book_category foreign key (id_category) references category(id),
    constraint fk_book_publisher foreign key (id_publisher) references publisher(id),
    constraint fk_book_condition foreign key (id_condition) references book_condition(id),
    constraint fk_book_supplier foreign key (id_supplier) references supplier(id),
    constraint fk_book_admin foreign key (id_admin) references admin_user(id)
);

create table book_order (
    id int not null,
    id_customer int not null,
    quantity_item int not null,
    order_date date default current_date,
    status varchar(100) not null,
    total_value decimal(10,2) not null,
    constraint pk_id_orders primary key (id),
    constraint fk_order_customer foreign key (id_customer) references customer(id)
);

create table order_item (
	id int not null,
    id_order int not null,
    id_book int not null,
    qty int not null,
    sell_price decimal(10,2) not null,
    total_value decimal(10,2) not null,
    constraint pk_order_item primary key (id),
    constraint fk_item_order foreign key (id_order) references book_order(id),
    constraint fk_item_book foreign key (id_book) references book(id)
);

create table payment(
    id int not null,
    id_order int not null,
    id_type_payment int not null,
    date_payment date not null,
    total_value decimal (10,2),
    constraint pk_id_payment primary key (id),
	constraint fk_payment_order foreign key (id_order) references book_order(id),
	constraint fk_payment_type foreign key (id_type_payment) references type_payment(id)
);


create table customer_shipping (
    id int not null,
    id_order int not null,
    tracking_code varchar (50) not null,
    shipping_date date not null,
    shipping_value decimal(10,2) not null,
    constraint pk_id_shipping primary key (id),
    constraint fk_shipping_order foreign key (id_order) references book_order(id)
);

create table supplier_coupon (
    id int not null,
    donated_books_quantity int not null,
    redemption_points int not null,
    constraint pk_id_supplier_coupon primary key (id),
    constraint fk_coupon_supplier foreign key (id) references supplier(id)
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