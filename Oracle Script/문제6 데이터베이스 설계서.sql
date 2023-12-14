-- tb_zipcodes20 ���̺� ����
create table tb_zipcode20 (
    zipcode varchar2(7) not null constraint PK_tb_zipcode20_zipcode primary key,
    sido varchar2(30),
    gugun varchar2(30),
    dong varchar2(30),
    bungi varchar2(30));
    
-- members20 ���̺� ����
create table members20 (
    id varchar2(20) not null constraint PK_members20_id primary key,
    pwd varchar2(20),
    name varchar2(50),
    zipcode varchar2(7),
        constraint FK_members20_zipcode foreign key (zipcode) references tb_zipcode20(zipcode),
    address varchar2(20),
    tel varchar2(13),
    indate date default sysdate);
    
-- products20 ���̺� ����
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
    
-- orders20 ���̺� ����
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
    

-- tb_zipcodes20 ���ڵ� �Է�
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a1', '����', '���α�', 'ȸ����', '1����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a2', '�λ�', '���빮��', 'ȸ�⵿', '1����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a3', '�뱸', '������', '��â��', '1����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a4', '����', '����', '����', '1����');
insert into tb_zipcode20 (zipcode, sido, gugun, dong, bungi)
    values ('a5', '�λ�', '�߱�', '������', '1����');
    
commit;

select * from tb_zipcode20;

-- members20 ���ڵ� �Է�
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd1', '1234', '����', 'a1', '���� ���α�', '010-1111-1111', '23/12/01');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd2', '1235', '����', 'a2', '�λ� ���빮��', '010-1111-2222', '23/12/02');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd3', '1236', '���', 'a3', '�뱸 ������', '010-1111-3333', '23/12/03');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd4', '1237', '���', 'a4', '���� ����', '010-1111-4444', '23/12/04');
insert into members20 (id, pwd, name, zipcode, address, tel, indate)
    values ('abcd5', '1238', '���', 'a5', '�λ� �߱�', '010-1111-5555', '23/12/05');
    
commit;

select * from members20;

-- products20 ���ڵ� �Է�
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa1', '������1', 'a', '20000', '22000', '���޴ϴ�', 'image1', '51', '11', '100', 'x', '22/12/01');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa2', '������2', 'b', '40000', '44000', '�Ϳ����ϴ�', 'image2', '52', '12', '100', 'x', '22/12/02');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa3', '������3', 'c', '60000', '66000', '�������ϴ�', 'image3', '53', '13', '100', 'x', '22/12/03');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa4', '������4', 'a', '70000', '77000', 'ưư�մϴϴ�', 'image4', '54', '14', '100', 'x', '22/12/04');
insert into products20 (product_code, product_name, product_kind, product_price1, product_price2, product_content, product_image, sizeSt, sizeEt, product_quantity, useyn, indate)
    values ('aaa5', '������5', 'b', '80000', '88000', '���մϴ�', 'image5', '55', '15', '100', 'x', '22/12/05');
    
commit;

select * from products20;

-- orders20 ���ڵ� �Է�
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

-- 4���� ���̺� join�� view �����

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