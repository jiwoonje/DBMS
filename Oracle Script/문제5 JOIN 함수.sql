/*
    JOIN �ǽ�
        member10 : ȸ�������� �����ϴ� ���̺�
        zipcode10 : �����ȣ�� �����ϴ� ���̺�
        product10 : ��ǰ ������ �����ϴ� ���̺�
        order10 : �ֹ� ������ �����ϴ� ���̺�
*/

create table zipcode10 (
    zipcode number(6) not null constraint PK_ZIPCODE10_ZIPCODE Primary key,
    si_do varchar2(200) not null,
    gu_gun varchar2(200) not null,
    bungi varchar2(200) not null
);
    
create table member10 (
    m_id number(4) not null constraint PK_MEMBER10_M_ID primary key,
    pass varchar2(200) not null,
    name varchar2(200) not null,
    email varchar2(200) not null,
    zipcode number(6) not null,
    -- Foreign Key ���� ���� �߰���
        constraint FK_MEMBER10_ZIPCODE foreign key (zipcode) references zipcode10 (zipcode)
);        

create table product10 (
    pro_id number(6) not null constraint PK_PRODUCT10_PRO_ID primary key,
    pro_name varchar2(200) not null,
    pro_price number(7,2) not null,
    pro_cnt number(4) default 0 not null
);

create table order10 (
    ord_id number(6) not null constraint PK_ORDER10_ORD_ID primary key,
    m_id number(4) not null,            -- FK MEMBER10(m_id)
    pro_id number(6) not null,          -- FK PRODUCT10(pro_id)
    -- Foreign Key 2��. ȸ����ȣ, ��ǰ��ȣ
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10 (m_id),
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10 (pro_id)
);
    
-- �� ���̺� ���ڵ� 5���� �ֽ��ϴ�
-- ANSI JOIN ���� ����ؼ� �ֹ�����(Order10) ���̺��� ��������
    -- �ֹ��ڸ�, �ֹ��ڸ����ּ�, �ֹ��ڹ���(�õ�), �ֹ���ǰ��, ��ǰ�� ���� ���

    -- ZIPCODE10 ���ڵ� �Է�
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (12345, '����', '������', '1����');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)     
        values (23456, '�λ�', '������', '2����');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (34567, '����', '������', '3����');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (45678, '����', '������', '4����');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (56789, '���', '����', '5����');
        
    commit;
    
    select *
    from zipcode10;
        
    -- MEMBER10 ���ڵ� �Է�
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (1234, 'a1234', '��ö��', 'kcs@naver.com', 12345);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (1235, 'b1235', '������', 'chock@naver.com', 23456);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (2345, 'c2345', '�ڼ���', 'melon@gmail.com', 34567);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (2346, 'd2346', '�����', 'pear@naver.com', 45678);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (3579, 'e3579', '�ֺ���', 'peach@naver.com', 56789);

    commit;

    select *
    from member10;
    
    -- product10 ���ڵ� �Է�
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700001, '��Ÿ��A', 5000.25, 1357);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700002, '��Ÿ��B', 6000.5, 2468);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700003, '��Ÿ��C', 7000.75, 3579);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700004, '��Ÿ��D', 8000.25, 4680);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700005, '��Ÿ��E', 9000.5, 5791);
        
    commit;
    
    select *
    from product10;
    
    -- order10 ���ڵ� �Է�
    insert into ORDER10 (ord_id, m_id, pro_id)
        values (100001, 1234, 700001);
    insert into ORDER10 (ord_id, m_id, pro_id)
        values (100002, 1235, 700002);
    insert into ORDER10 (ord_id, m_id, pro_id)
        values (100003, 2345, 700003);        
    insert into ORDER10 (ord_id, m_id, pro_id)
        values (100004, 2346, 700004);
    insert into ORDER10 (ord_id, m_id, pro_id)
        values (100005, 3579, 700005);
        
    commit;
    
    select *
    from order10;
    
-- ANSI JOIN ���� ����ؼ� �ֹ�����(Order10) ���̺��� ��������
    -- �ֹ��ڸ�, �ֹ��ڸ����ּ�, �ֹ��ڹ���(�õ�), �ֹ���ǰ��, ��ǰ�� ���� ���   
    
    select o.m_id �ֹ��ڸ�, m.email �ֹ��ڸ���, z.bungi �ֹ��ڹ���, p.pro_name �ֹ���ǰ��, p.pro_cnt ��ǰ����
    from order10 o join member10 m
                    on o.m_id = m.m_id
                   join zipcode10 z
                    on z.zipcode = m.zipcode
                   join product10 p
                    on p.pro_id = o.pro_id;



-- ���̺� ���� : Foreign Key�� �����ϴ� ���̺��� �������� �ʴ´� : cascade constraints
    -- 1. �����ϴ� ���̺��� ���� ���� �� �����ؾ� �Ѵ�.
    -- 2. ���̺� ������ cascade constraints �ɼ��� ����ؼ� ���� ����

    -- 1. ������ ����ؼ� ������ �����ؼ� �����ؾ���
    drop table order10;
    drop table member10;
    drop table zipcode10;
    drop table product10;
    
    -- 2. ���� ����
        -- zipcode10 ���̺��� �����ϴ� ���̺��� ������ ���� ���� �� �ش� ���̺��� ������.
    drop table zipcode10 cascade constraints;
    drop table member10 cascade constraints;
    drop table order10 cascade constraints;
    drop table zipcode10 cascade constraints;
    
    
-- member10 ���̺��� ���������� �ֹ��������� ���� ȸ�� <== LEFT OUTER JOIN �غ���
insert into member10 (m_id, pass, name, email, zipcode)
    values (4567, 'f4567', '�����', 'sberry@naver.com', 12345);
insert into member10 (m_id, pass, name, email, zipcode)
    values (4568, 'g4568', '�����', 'mango@naver.com', 23456);

commit;

select *
from member10;


-- product10 ���̺��� ���� 2�� �߰� <== RIGHT OUTER JOIN �� ��
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
    values (700006, '��Ÿ��F', 8000.25, 6802);
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
    values (700007, '��Ÿ��G', 7000.5, 7913);
    
commit;

select *
from product10;

-- �𵨸� ���� ���� �ֹ� ���̺�
create table order11 (
    o_id number(6) not null primary key,
    
    m_name varchar2(200) not null,
    m_phone varchar2(200) not null,
    m_add varchar2(200) not null,
    m_email varchar2(200) not null,
    
    p_id number(6) not null,
    p_name varchar2(200) not null,
    p_price number(7,2) not null,
    p_cnt number(6) null
);

insert into order11 (o_id, m_name, m_phone, m_add, m_email, p_id, p_name, p_price,p_cnt)
    values (10, 'ȫ�浿', '010-1111-1111', '����', 'aaa@aaa.com', 100, '���', 25000, 100);
insert into order11 (o_id, m_name, m_phone, m_add, m_email, p_id, p_name, p_price,p_cnt)
    values (20, '��浿', '010-2222-1111', '�λ�', 'bbb@aaa.com', 200, '��', 25000, 100);

commit;

select * from order11;
    
    
    
-- JOIN : ANSI JOIN
    -- INNER JOIN : on ���� ������ ���� ����Ѵ�.
    -- LEFT OUTER JOIN : ���� ���̺��� ��� ���� ���
    -- RIGHT OUTER JOIN : ������ ���̺��� ��� ���� ���
    
    -- member10, zipcode10 ���̺�
    select *
    from member10 m 
        JOIN zipcode10 z
            ON m.zipcode = z.zipcode;
    
    -- member10 ���̺� ���������� �ʾ����� zipcode10 ���̺� ������ <== RIGHT OUTER TABLE
    insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
        values (67890, '����', '���α�', '100����');
    insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
        values (78901, '����', '���α�', '100����');
    
    commit;

    select * from zipcode10;
    
    select *
    from member10 m
        RIGHT OUTER JOIN zipcode10 z
            ON m.zipcode = z.zipcode;
            
    -- order10 ���̺��� �ֹ������� <=== on m_id
    
    select * from order10;
    
    select *
    from order10 o
        JOIN member10 m
            ON o.m_id = m.m_id;
            
    -- �ֹ������� ���� ����� ��� (�ֹ����� ���� �����) : RIGHT OUTER JOIN
    select *
    from order10 o
        RIGHT OUTER JOIN member10 m
            ON o.m_id = m.m_id;
            
    select *
    from member10 m
        RIGHT OUTER JOIN order10 o
            ON o.m_id = m.m_id;       
            
    -- 3�� ���̺� ���� : order10, member10, zipcode10
    select *
    from order10 o
        JOIN member10 m
            ON o.m_id = m.m_id
        JOIN zipcode10 z
            ON z.zipcode = m.zipcode;
    
    -- 4�� ���̺� ���� : order10, member10, zipcode10, product10
    select *
    from order10 o
        JOIN member10 m
            ON o.m_id = m.m_id
        JOIN zipcode10 z
            ON z.zipcode = m.zipcode
        JOIN product10 p
            ON p.pro_id = o.pro_id;
    
    -- �ֹ����� ���� ���� ������ ���, �Ǹŵ��� ���� ��ǰ�� OUTER JOIN�� ����ؼ� ���        
    select *
    from order10 o
        RIGHT OUTER JOIN member10 m
            ON o.m_id = m.m_id
        JOIN zipcode10 z
            ON z.zipcode = m.zipcode
        RIGHT OUTER JOIN product10 p
            ON p.pro_id = o.pro_id;
            
    select *
    from member10 m
        LEFT OUTER JOIN order10 o
            ON o.m_id = m.m_id
        JOIN zipcode10 z
            ON z.zipcode = m.zipcode
        RIGHT OUTER JOIN product10 p
            ON p.pro_id = o.pro_id;