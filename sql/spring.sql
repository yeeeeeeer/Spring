create table board(
    seq number(5) primary key,
    title varchar2(200),
    writer varchar2(20),
    content varchar2(2000),
    regdate date default sysdate,
    cnt number(5) default 0
    );


create table users(
    id varchar2(8) primary key,
    password varchar2(8),
    name varchar2(20),
    role varchar2(5)
    );
    
insert into users values('test', 'test1234', 'test', 'admin');

commit;

desc board;
desc users;

create table lbi_board(
    bno number generated always as IDENTITY,
    title varchar2(150) not null,
    content varchar2(2000) not null,
    writer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    constraint pk_board PRIMARY key(bno)
);
