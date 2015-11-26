show databases;
create table member(
id varchar(50) not null primary key,
password varchar(16) not null,
name varchar(10) not null,
reg_date datetime not null);

show databases;
create table test(
num_id int not null primary key,
title varchar(50) not null,
content text not null);

desc member
desc test

alter table member
	add (address varchar(100) not null,
		tel varchar(20) not null);
		
		
drop table test;
show tables;

insert into member(id, password, name, reg_date, address, tel)
	values('kingdora@dragon.com','1234','김개동',now(),'서울시','010-111-1111');
insert into member(id, password, name, reg_date, address, tel)
	values('hongkd@aa.aa','1111','홍길동',now(),'경기도','010-222-2222');
	
select *from member

