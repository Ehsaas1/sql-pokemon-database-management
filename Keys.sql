
/*
SQL Constraints/Keys :

1. Primary Key
2. Unique Key
3. Foreign Key
4. null/not null

1. Primary Key : is a feild in a table that uniquely identifies  
each record in the table.
=> It does not accept null values.
=> 1 table can have only 1 Primary key

2. Unique Key :is a feild in a table that uniquely identifies  
each record in the table.
=> It accepts null values.
=> 1 table can have multiple Unique key

Tab1                             Tab2
sid(pk) sname address            sid(uk) sname address
 1      abc    blore              1      abc    blore
 2      xyz    mum                2      xyz    mum
 3      pqr    blore              3      pqr    blore
 1      zxc    chn   ==> no       1      zxc    chn    ==> no
 4      abc    pune  ==> yes      4      abc    pune   ==>yes
 null   qwe    mum   ==> no       null   qwe    mum    ==>yes
*/
use itvedant;
-- Primary Key
create table stud1(sid int primary key, sname varchar(100), address varchar(100));
desc stud1;
-- Unique Key
create table stud2(sid int unique key, sname varchar(100), address varchar(100));
desc stud2;

desc College_Info;
alter table College_Info modify cid int primary key;

create table products(pid int primary key,pname varchar(50),qty int);
desc products;

create table orders(oid int primary key,oname varchar(100),qty int,pid int,foreign key(pid) references products(pid));
desc orders;