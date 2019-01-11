--spring-security 의 지정된 테이블을 생성하는 sql
create table users(
    username varchar2(50) not null primary key,
    password varchar2(50) not null,
    enabled char(1) default '1'
);
DROP TABLE users;
create table authorities(
    username varchar2(50) not null,
    authority varchar2(50) not null,
    constraint fk_authorites_users foreign key(username) references users(username)
);

create unique index ix_auth_username on authorities (username,authority);


insert into users(username,password) values ('user00','pw00');
insert into users(username,password) values ('member00','pw00');
insert into users(username,password) values ('admin00','pw00');

insert into authorities (username,authority) values('user00','ROLE_USER');
insert into authorities (username,authority) values('member00','ROLE_MANAGER');
insert into authorities (username,authority) values('admin00','ROLE_MANAGER');
insert into authorities (username,authority) values('admin00','ROLE_ADMIN');
commit;

select * from users;


--인증 / 권한을 위한 테이블설계 기존의 DB를 사용하는 케이스 
create table tbl_member(
	userid varchar2(50) not null primary key,
	userpw varchar2(100) not null,
	username varchar2(100) not null,
	regdate date default sysdate,
	updatedate date default sysdate,
	enabled char(1) default '1');

create table tbl_member_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null ,
	constraint fk_member_auth foreign key(userid) references
	tbl_member(userid) 
);