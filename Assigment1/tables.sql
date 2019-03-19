create table customer(
	custno varchar(4) NOT NULL primary key,
	custname varchar(30) NOT NULL,
	address varchar(15) NOT NULL,
	internal char(1) NOT NULL,
	contact varchar(20) NOT NULL,
	phone INT NOT NULL,
	city varchar(10) NOT NULL,
	state char(2) NOT NULL,
	zip char(5) NOT NULL,
	constraint ck_int CHECK(internal ='Y' OR inernal ='N')
);
describe customer;

create table Employee(
	empno char(4) NOT NULL primary key,
	empname varchar(20) NOT NULL,
	department varchar(20) NOT NULL,
	email varchar(20) NOT NULL,
	constraint uc_email unique (email),
	phone varchar(6) NOT NULL
);
describe Employee;

create table Facility(
	facno char(4) NOT NULL primary key,
	facname varchar(40) NOT NULL
);
describe Facility;

create table EventRequest(
	eventno char(4) NOT NULL primary key,
	dateheld date NOT NULL,
	datereq date NOT NULL,
	facno char(4) NOT NULL,
	custno varchar(4) NOT NULL,
	dateauth date null,
	status varchar(20) NOT NULL,
	estcost numeric(6,2) NOT NULL,
	estaudience int NOT NULL,
	budno char(10) null,
	constraint ck_status CHECK (status In ('Approved', 'Pending', 'Denied')),
	constraint ck_estaudience CHECK (estaudience > 0),

	constraint fk_custno foreign key(custno)
	    references customer(custno) ON DELETE CASCADE 
	    ON UPDATE CASCADE,

	constraint fk_fac foreign key(facno)
	    references Facility(facno) ON DELETE CASCADE 
	    ON UPDATE CASCADE
);
describe EventRequest;

create table location(
	locno char(4) not null primary key,
	facno char(4) NOT NULL,
	locname varchar(30) not null,

	constraint fk_facno foreign key(facno)
	    references Facility(facno) ON DELETE CASCADE 
	    ON UPDATE CASCADE
);
describe location;

create table ResourceTbl(
	resno char(4) not null primary key,
	resname varchar(20) not null,
	rate  DECIMAL(5,2) not null,
	constraint ck_rate CHECK(rate > 0)
);
describe ResourceTbl;

create table eventplan(
	planno char(4),
	eventno char(4) NOT NULL,
	workdate date not null,
	notes varchar(30) null,
	activity varchar(15) not null,
	empno char(4) null,
constraint fok_events foreign key(eventno)
 	references EventRequest(eventno)
	 ON DELETE CASCADE ON UPDATE CASCADE,

constraint fok_femp foreign key(empno)
	 references employee(empno)
	 ON DELETE CASCAde ON UPDATE CASCADE
);
describe eventplan;

create table eventPlanLine(
	planNo char(4) not null,
	lineno int not null,
	constraint pk_id primary key(planNo , lineno),

	TimeStart datetime not null,
	TimeEnd datetime not null,
	
	constraint ck_check CHECK(TimeStart < TimeEnd),
	
	numberFLD int not null,
	locno char(4) not null,
	resno char(4) not null,

	constraint fk_locno1 foreign key(locno)
	    references location(locno) ON DELETE CASCADE 
	    ON UPDATE CASCADE,

	constraint fk_resno foreign key(resno)
	    references resourcetbl(resno) ON DELETE CASCADE 
	    ON UPDATE CASCADE
);
describe eventPlanLine;