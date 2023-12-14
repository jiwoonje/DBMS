-- tb_zipcodes20 테이블 생성
create table tb_zipcode20 (
    zipcode varchar2(7) not null constraint PK_tb_zipcode20_zipcode primary key,
    sido varchar2(30),
    gugun varchar2(30),
    dong varchar2(30),
    bungi varchar2(30));
    
-- members20 테이블 생성
create table members20 (
    id varchar2(20) not null constraint PK_members20_id primary key,
    pwd varchar2(20),
    name varchar2(50),
    zipcode varchar2(7),
        constraint FK_members20_zipcode foreign key (zipcode) references tb_zipcode20(zipcode),
    address varchar2(20),
    tel varchar2(13),
    indate date default sysdate);
    
-- products20 테이블 생성
create table products20 (
    product_code varchar2(20) not null constraint PK_products20_product_code primary key,
    product_name varchar2(100),
    product_kind char(1),
    product_price1 varchar2(10),
    product_price2 varchar2(10),
    product_content varchar2(1000),
    product_image varchar2(50),
    sizeSt varchar2(5),
    sizeEt varchar2(5),
    product_quantity varchar2(5),
    useyn char(1),
    indate date);
    
-- orders20 테이블 생성
create table orders20 (
    o_seq number(10) not null constraint PK_orders20_o_seq primary key,
    product_code varchar2(20),
        constraint FK_orders20_product_code_products20 foreign key (product_code) references products20(product_code),
    id varchar2(50),
        constraint FK_orders20_id_members20 foreign key (id) references members20(id),
    product_size varchar2(5),
    quantity varchar2(5),
    result char(1),
    indate date);
    

-- tb_zipcodes20 레코드 입력
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a1', '서울', '종로구', '회현동', '1번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a2', '부산', '동대문구', '회기동', '1번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a3', '대구', '강서구', '염창동', '1번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a4', '대전', '서구', '서동', '1번지');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a5', '부산', '중구', '남포동', '1번지');
    
commit;

select * from tb_zipcode20;

-- members20 레코드 입력
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd1', '1234', '김일', 'a1', '서울 종로구', '010-1111-1111', '23/12/01');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd2', '1235', '김이', 'a2', '부산 동대문구', '010-1111-2222', '23/12/02');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd3', '1236', '김삼', 'a3', '대구 강서구', '010-1111-3333', '23/12/03');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd4', '1237', '김사', 'a4', '대전 서구', '010-1111-4444', '23/12/04');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd5', '1238', '김오', 'a5', '부산 중구', '010-1111-5555', '23/12/05');
    
commit;

select * from members20;

-- products20 레코드 입력
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa1', '가가가1', 'a', '20000', '22000', '예쁩니다', 'image1', '51', '11', '100', 'x', '22/12/01');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa2', '가가가2', 'b', '40000', '44000', '귀엽습니다', 'image2', '52', '12', '100', 'x', '22/12/02');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa3', '가가가3', 'c', '60000', '66000', '가볍습니다', 'image3', '53', '13', '100', 'x', '22/12/03');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa4', '가가가4', 'a', '70000', '77000', '튼튼합니니다', 'image4', '54', '14', '100', 'x', '22/12/04');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa5', '가가가5', 'b', '80000', '88000', '편합니다', 'image5', '55', '15', '100', 'x', '22/12/05');
    
commit;

select * from products20;

-- orders20 레코드 입력
insert into orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
    values (1, 'aaa1', 'abcd1', '1', '2', 'o', '23/12/06');
insert into orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
    values (2, 'aaa2', 'abcd2', '2', '2', 'o', '23/12/07');
insert into orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
    values (3, 'aaa3', 'abcd3', '1', '2', 'o', '23/12/08');
insert into orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
    values (4, 'aaa4', 'abcd4', '2', '2', 'o', '23/12/09');
insert into orders20 (o_seq, product_code, id, product_size, quantity, result, indate)
    values (5, 'aaa5', 'abcd5', '1', '2', 'o', '23/12/10');
    
commit;

select * from orders20;

-- 4개의 테이블 join한 view 만들기

create view v_alljoin
as
select *
from orders20 o
    JOIN members20 m
        on o.id = m.id
    JOIN tb_zipcode20 z
        on z.zipcode = m.zipcode
    JOIN products20 p
        on p.product_code = o.product_code;