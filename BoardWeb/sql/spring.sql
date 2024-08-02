drop table board;
drop table users;
drop table lbi_board;
drop table book_member;
drop table vam_nation;
drop table vam_author;
drop table vam_book;
drop table vam_bcate;
drop table vam_author;
 
CREATE TABLE BOOK_MEMBER(
    memberId VARCHAR2(50) PRIMARY KEY,
    memberPw VARCHAR2(100) NOT NULL,
    memberName VARCHAR2(30) NOT NULL,
    memberMail VARCHAR2(100) NOT NULL,
    memberAddr1 VARCHAR2(100) NOT NULL,
    memberAddr2 VARCHAR2(100) NOT NULL,
    memberAddr3 VARCHAR2(100) NOT NULL,
    adminCk NUMBER NOT NULL,
    regDate DATE NOT NULL,
    money NUMBER NOT NULL,
    point NUMBER NOT NULL
);

CREATE TABLE vam_nation(
    nationId VARCHAR2(2) PRIMARY KEY,
    nationName VARCHAR2(50)
);

INSERT INTO vam_nation VALUES ('01', '국내');
INSERT INTO vam_nation VALUES ('02', '국외');

CREATE TABLE vam_author(
    authorId NUMBER GENERATED AS IDENTITY (START WITH 1) PRIMARY KEY,
    authorName VARCHAR2(50),
    nationId VARCHAR2(2),
    authorIntro LONG,
    FOREIGN KEY (nationId) REFERENCES vam_nation(nationId)
);

INSERT INTO vam_author(authorName, nationId, authorIntro) VALUES ('유홍준', '01', '작가 소개입니다');
INSERT INTO vam_author(authorName, nationId, authorIntro) VALUES ('김난도', '01', '작가 소개입니다');
INSERT INTO vam_author(authorName, nationId, authorIntro) VALUES ('폴크루그먼', '02', '작가 소개입니다');

COMMIT;

INSERT INTO book_member VALUES('admin23', 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 1, SYSDATE, 100000, 1000000);

UPDATE book_member SET adminCk = 1 WHERE memberId = 'lbi5320';

alter table vam_author add regDate date default sysdate;

alter table vam_author add updateDate date default sysdate;

delete from vam_author;

ALTER TABLE vam_author MODIFY(authorId GENERATED AS IDENTITY (START WITH 1));

insert into vam_author(authorName, nationId, authorIntro) values('유홍준', '01', ' 작가 소개입니다');
insert into vam_author(authorName, nationId, authorIntro) values('김난도', '01', ' 작가 소개입니다');
insert into vam_author(authorName, nationId, authorIntro) values('폴크루그먼', '02', ' 작가 소개입니다');

insert into vam_author(authorName, nationId, authorIntro) values('작가이름', '01', '작가소개');

insert into vam_author(authorname, nationid)(select authorname, nationid from vam_author);

UPDATE book_member SET adminCk = 1 WHERE memberId = 'user1';
COMMIT;
SELECT * FROM book_member WHERE memberId = 'user1';


create table vam_book(
    bookId number generated as identity (start with 1) primary key,
    bookName varchar2(50) not null,
    authorId number,
    publeYear Date not null,
    publisher varchar2(70) not null,
    cateCode varchar2(30),
    bookPrice number not null,
    bookStock number not null,
    bookDiscount number(2,2),
    bookIntro clob,
    bookContents clob,
    regDate date default sysdate,
    updateDate date default sysdate

);

create table vam_bcate(
    tier number(1) not null,
    cateName varchar2(30) not null,
    cateCode varchar2(30) not null,
    cateParent varchar2(30),
    primary key(cateCode),
    foreign key(cateParent) references vam_bcate(cateCode)
);
-- 국내 카테고리 데이터 삽입
INSERT INTO vam_bcate (tier, cateName, cateCode) VALUES (1, '국내', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '소설', '101000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '한국소설', '101001', '101000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '영미소설', '101002', '101000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '일본소설', '101003', '101000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '시/에세이', '102000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '한국시', '102001', '102000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '해외시', '102002', '102000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '경제/경영', '103000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '경영일반', '103001', '103000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '경영이론', '103002', '103000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '경제일반', '103003', '103000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '경제이론', '103004', '103000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '자기계발', '104000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '성공/처세', '104001', '104000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '자기능력개발', '104002', '104000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '인간관계', '104003', '104000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '인문', '105000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '심리학', '105001', '105000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '교육학', '105002', '105000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '철학', '105003', '105000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '역사/문학', '106000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '역사일반', '106001', '106000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '세계사', '106002', '106000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '한국사', '106003', '106000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '과학', '107000', '100000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '과학이론', '107001', '107000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '수학', '107002', '107000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '물리학', '107003', '107000');

-- 국외 카테고리 데이터 삽입
INSERT INTO vam_bcate (tier, cateName, cateCode) VALUES (1, '국외', '200000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '문학', '201000', '200000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '소설', '201001', '201000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '시', '201002', '201000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '희곡', '201003', '201000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '인문/사회', '202000', '200000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '교양', '202001', '202000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '철학', '202002', '202000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '경제/경영', '203000', '200000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '경제학', '203001', '203000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '경영학', '203002', '203000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '투자', '203003', '203000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (2, '과학/기술', '204000', '200000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '교양과학', '204001', '204000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '물리학', '204002', '204000');
INSERT INTO vam_bcate (tier, cateName, cateCode, cateParent) VALUES (3, '수학', '204003', '204000');


SELECT * FROM vam_bcate WHERE cateParent = '201000';


-- 자식 테이블의 레코드 삭제
DELETE FROM vam_book WHERE cateCode = '200000';
DELETE FROM vam_book WHERE cateCode = '201000';



DELETE FROM vam_bcate WHERE cateCode = '201000';
DELETE FROM vam_bcate WHERE cateCode = '201000';


-- 자식 테이블에서 참조하는 데이터 삭제 (필요한 경우)
DELETE FROM vam_book WHERE cateCode IN (
    '100000', '101000', '101001', '101002', '101003', 
    '102000', '102001', '102002', '103000', '103001', 
    '103002', '103003', '103004', '104000', '104001', 
    '104002', '104003', '105000', '105001', '105002', 
    '105003', '106000', '106001', '106002', '106003', 
    '107000', '107001', '107002', '107003', '200000', 
    '201000', '201001', '201002', '201003', '202000', 
    '202001', '202002', '203000', '203001', '203002', 
    '203003', '204000', '204001', '204002', '204003'
);

-- 부모 테이블 데이터 삭제
DELETE FROM vam_bcate WHERE cateCode IN (
    '100000', '101000', '101001', '101002', '101003', 
    '102000', '102001', '102002', '103000', '103001', 
    '103002', '103003', '103004', '104000', '104001', 
    '104002', '104003', '105000', '105001', '105002', 
    '105003', '106000', '106001', '106002', '106003', 
    '107000', '107001', '107002', '107003', '200000', 
    '201000', '201001', '201002', '201003', '202000', 
    '202001', '202002', '203000', '203001', '203002', 
    '203003', '204000', '204001', '204002', '204003'
);


ALTER TABLE VAM_BOOK MODIFY BOOKNAME VARCHAR2(100);

delete from vam_book;
delete from vam_author;

alter table vam_book add foreign key (authorId) references vam_author(authorId);
alter table vam_book add foreign key (cateCode) references vam_bcate(cateCode);

insert into vam_book(bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock,
                                bookDisount, bookIntro, bookContents)
(select bookName, authorId, publeYear, publisher, cateCode, bookPrice, bookStock, bookDiscount, bookIntro, bookContents
from vam_book);

ALTER TABLE vam_book ADD ratingAvg NUMBER(3, 2);

CREATE TABLE vam_image (
    uploadPath VARCHAR2(255) NOT NULL,
    uuid VARCHAR2(36) NOT NULL,
    fileName VARCHAR2(255) NOT NULL,
    bookId NUMBER NOT NULL,
    CONSTRAINT fk_book FOREIGN KEY (bookId) REFERENCES vam_book(bookId)
);



COMMIT;
SELECT * FROM vam_book;
SELECT * FROM vam_bcate;
SELECT * FROM book_member;

SELECT * FROM vam_author;

SELECT * FROM vam_nation;