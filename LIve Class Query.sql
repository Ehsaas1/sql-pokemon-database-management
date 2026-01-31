/*
ItVedant classes 16-09-25


*/
-- today 17-09-25
Show databases;
create database itvedant;

use itvedant;

create table College_Info(cid int,cname varchar(50),branch varchar(20),doa date,status enum("yes","no"));

desc College_Info;

create table employee(empid int,empname varchar(50),empsalary int);

-- ADD 
alter table College_Info add fees float;
alter table College_Info add feesgst float;
alter table College_Info add abc float;

-- MODIFY
alter table College_Info modify cname varchar(100);

-- DROP
alter table College_Info drop abc;

-- RENAME TO
alter table employee rename to employee_info;

-- Change

/* 
KEYS -- 18-9-25
*/