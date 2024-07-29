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


-- 회원가입 쿼리
insert into book_member
values('admin23', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 1, sysdate, 1000000, 1000000);

update book_member set adminck = 1 where memberid = 'test1021';

drop table vam_nation;
drop table vam_author;
-- 국가 테이블 생성
create table vam_nation(
    nationId VARCHAR2(2) primary key,
    nationName VARCHAR2(50)
);

-- 국가 테이블 데이터 삽입
insert into vam_nation values ('01', '국내');
insert into vam_nation values ('02', '국외');

-- 작가 테이블 생성
create table vam_author(
    authorId number generated as identity (start with 1) primary key,
    authorName varchar2(50),
    nationId varchar2(2),
    authorIntro long,
    foreign key (nationId) references vam_nation(nationId)
);

insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', '작가 소개합니다');
insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', '작가 소개합니다');
insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', '작가 소개합니다');

alter table vam_author add regDate date default sysdate;
alter table vam_author add updateDate date default sysdate;

delete from vam_author;

ALTER TABLE vam_author MODIFY(authorId GENERATED AS IDENTITY (START WITH 1));

insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', '작가 소개합니다');
insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', '작가 소개합니다');
insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', '작가 소개합니다');

insert into vam_author (authorName, nationId, authorIntro) values('작가이름', '01', '작가소개');

select * from BOOK_MEMBER;
select * from vam_author;

-- orcle 경우
commit;



