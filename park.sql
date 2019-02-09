create table Themepark(
    park_code varchar(8) primary key,
    park_name varchar(20) NOT NULL,
    park_city char(4) NOT NULL,
    park_country varchar(8) NOT NULL);
create table ticket(
    Ticket_no varchar(4) primary key,
    ticket_price numeric(4) not null,
    ticket_type varchar(4) not null,
    park_code varchar(8),
    constraint fk_code foreign key(park_code)
    references Themepark(park_code));
create table employe(
    EMP_num varchar(8) primary key,
    emp_title varchar(15) not null,
    emp_lname varchar(20) not null,
    emp_fname varchar(20) not null,
    emp_dob varchar(8) not null,
    emp_hire_date numeric(8) not null,
    emp_areacode numeric(5) not null,
    emp_phone numeric(11) not null,
    park_code varchar(8),
    constraint fk_code2 foreign key(park_code) references Themepark(park_code));
create table attraction(
    attract_no numeric(10) primary key,
    park_code varchar(8),
    attract_name varchar(15) not null,
    attract_age numeric(4),
    attract_capacity varchar(15),
    constraint fk_code3 foreign key(park_code) references Themepark(park_code));

create table hours(
    emp_num numeric(10) primary key,
    attract_no numeric(10),
    constraint fk_attno foreign key(attract_no) references attraction(attract_no),
    hours_per_attract numeric(2),
    hour_rate numeric(2),
    date_worked date);
create table sales(
    transaction_no varchar(8) primary key,
    park_code varchar(8),
    constraint fk_code4 foreign key(park_code) references Themepark(park_code),
    sale_date date);
    