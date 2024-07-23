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

insert into lbi_board(title, content, writer) values ('테스트 제목', '테스트 내용', '작가');
insert into lbi_board(title, content, writer) values ('테스트 제목', '테스트 내용', '작가');
insert into lbi_board(title, content, writer) values ('테스트 제목', '테스트 내용', '작가');

-- 재귀 복사
insert into lbi_board(title, content, writer) (select title, content, writer from lbi_board);

-- 행 확인
select count(*) from lbi_board;

-- Rownum 방식 2
select rn, bno, title, content, writer, regdate, updatedate from(
    select /*+INDEX_DESC(lbi_board pk_board) */ rownum as rn, bno, title, content, writer, regdate, updatedate
    from lbi_board where rownum <= 20)
where rn > 10;

commit;

select * from lbi_board;
desc lbi_board;

CREATE TABLE BOOK_MEMBER(
    memberId VARCHAR2(50),
    memberPw VARCHAR2(100) NOT NULL,
    memberName VARCHAR2(30) NOT NULL,
    memberMail VARCHAR2(100) NOT NULL,
    memberAddr1 VARCHAR2(100) NOT NULL,
    memberAddr2 VARCHAR2(100) NOT NULL,
    memberAddr3 VARCHAR2(100) NOT NULL,
    adminCk NUMBER NOT NULL,
    regDate DATE NOT NULL,
    money number NOT NULL,
    point number NOT NULL,
    PRIMARY KEY(memberId)
);
commit;

select * from BOOK_MEMBER;
