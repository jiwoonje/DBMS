/*
    JOIN 실습
        member10 : 회원정보를 저장하는 테이블
        zipcode10 : 우편번호를 저장하는 테이블
        product10 : 제품 정보를 저장하는 테이블
        order10 : 주문 정보를 저장하는 테이블
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
    -- Foreign Key 제약 조건 추가함
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
    -- Foreign Key 2개. 회원번호, 제품번호
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10 (m_id),
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10 (pro_id)
);
    
-- 각 테이블에 레코드 5개씩 넣습니다
-- ANSI JOIN 문을 사용해서 주문정보(Order10) 테이블을 기준으로
    -- 주문자명, 주문자메일주소, 주문자번지(시도), 주문제품명, 제품의 가격 출력

    -- ZIPCODE10 레코드 입력
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (12345, '서울', '강동구', '1번지');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)     
        values (23456, '부산', '강서구', '2번지');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (34567, '서울', '강남구', '3번지');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (45678, '대전', '유성구', '4번지');
    insert into ZIPCODE10 (zipcode, si_do, gu_gun, bungi)
        values (56789, '울산', '남구', '5번지');
        
    commit;
    
    select *
    from zipcode10;
        
    -- MEMBER10 레코드 입력
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (1234, 'a1234', '김철수', 'kcs@naver.com', 12345);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (1235, 'b1235', '김초코', 'chock@naver.com', 23456);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (2345, 'c2345', '박수박', 'melon@gmail.com', 34567);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (2346, 'd2346', '배수박', 'pear@naver.com', 45678);
    insert into MEMBER10 (m_id, pass, name, email, zipcode)
        values (3579, 'e3579', '최복숭', 'peach@naver.com', 56789);

    commit;

    select *
    from member10;
    
    -- product10 레코드 입력
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700001, '비타민A', 5000.25, 1357);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700002, '비타민B', 6000.5, 2468);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700003, '비타민C', 7000.75, 3579);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700004, '비타민D', 8000.25, 4680);
    insert into PRODUCT10 (pro_id, pro_name, pro_price, pro_cnt)
        values (700005, '비타민E', 9000.5, 5791);
        
    commit;
    
    select *
    from product10;
    
    -- order10 레코드 입력
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
    
-- ANSI JOIN 문을 사용해서 주문정보(Order10) 테이블을 기준으로
    -- 주문자명, 주문자메일주소, 주문자번지(시도), 주문제품명, 제품의 가격 출력   
    
    select o.m_id 주문자명, m.email 주문자메일, z.bungi 주문자번지, p.pro_name 주문제품명, p.pro_cnt 제품가격
    from order10 o join member10 m
                    on o.m_id = m.m_id
                   join zipcode10 z
                    on z.zipcode = m.zipcode
                   join product10 p
                    on p.pro_id = o.pro_id;



-- 테이블 삭제 : Foreign Key가 참조하는 테이블은 삭제되지 않는다 : cascade constraints
    -- 1. 참조하는 테이블을 먼저 삭제 후 삭제해야 한다.
    -- 2. 테이블 삭제시 cascade constraints 옵션을 사용해서 강제 삭제

    -- 1. 참조를 고려해서 순서를 생각해서 삭제해야함
    drop table order10;
    drop table member10;
    drop table zipcode10;
    drop table product10;
    
    -- 2. 강제 삭제
        -- zipcode10 테이블을 참조하는 테이블을 강제로 먼저 삭제 후 해당 테이블을 삭제함.
    drop table zipcode10 cascade constraints;
    drop table member10 cascade constraints;
    drop table order10 cascade constraints;
    drop table zipcode10 cascade constraints;
    
    
-- member10 테이블에는 존재하지만 주문정보에는 없는 회원 <== LEFT OUTER JOIN 해볼것
insert into member10 (m_id, pass, name, email, zipcode)
    values (4567, 'f4567', '김딸기', 'sberry@naver.com', 12345);
insert into member10 (m_id, pass, name, email, zipcode)
    values (4568, 'g4568', '김망고', 'mango@naver.com', 23456);

commit;

select *
from member10;


-- product10 테이블에도 정보 2개 추가 <== RIGHT OUTER JOIN 할 것
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
    values (700006, '비타민F', 8000.25, 6802);
insert into product10 (pro_id, pro_name, pro_price, pro_cnt)
    values (700007, '비타민G', 7000.5, 7913);
    
commit;

select *
from product10;

-- 모델링 되지 않은 주문 테이블
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
    values (10, '홍길동', '010-1111-1111', '서울', 'aaa@aaa.com', 100, '사과', 25000, 100);
insert into order11 (o_id, m_name, m_phone, m_add, m_email, p_id, p_name, p_price,p_cnt)
    values (20, '김길동', '010-2222-1111', '부산', 'bbb@aaa.com', 200, '배', 25000, 100);

commit;

select * from order11;
    
    
    
-- JOIN : ANSI JOIN
    -- INNER JOIN : on 절의 공통의 값만 출력한다.
    -- LEFT OUTER JOIN : 왼쪽 테이블의 모든 내용 출력
    -- RIGHT OUTER JOIN : 오른쪽 테이블의 모든 내용 출력
    
    -- member10, zipcode10 테이블
    select *
    from member10 m 
        JOIN zipcode10 z
            ON m.zipcode = z.zipcode;
    
    -- member10 테이블에 참조되지는 않았지만 zipcode10 테이블에 존재함 <== RIGHT OUTER TABLE
    insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
        values (67890, '강릉', '종로구', '100번지');
    insert into zipcode10 (zipcode, si_do, gu_gun, bungi)
        values (78901, '서울', '종로구', '100번지');
    
    commit;

    select * from zipcode10;
    
    select *
    from member10 m
        RIGHT OUTER JOIN zipcode10 z
            ON m.zipcode = z.zipcode;
            
    -- order10 테이블의 주문자정보 <=== on m_id
    
    select * from order10;
    
    select *
    from order10 o
        JOIN member10 m
            ON o.m_id = m.m_id;
            
    -- 주문정보에 없는 사용자 출력 (주문하지 않은 사용자) : RIGHT OUTER JOIN
    select *
    from order10 o
        RIGHT OUTER JOIN member10 m
            ON o.m_id = m.m_id;
            
    select *
    from member10 m
        RIGHT OUTER JOIN order10 o
            ON o.m_id = m.m_id;       
            
    -- 3개 테이블 조인 : order10, member10, zipcode10
    select *
    from order10 o
        JOIN member10 m
            ON o.m_id = m.m_id
        JOIN zipcode10 z
            ON z.zipcode = m.zipcode;
    
    -- 4개 테이블 조인 : order10, member10, zipcode10, product10
    select *
    from order10 o
        JOIN member10 m
            ON o.m_id = m.m_id
        JOIN zipcode10 z
            ON z.zipcode = m.zipcode
        JOIN product10 p
            ON p.pro_id = o.pro_id;
    
    -- 주문하지 않은 사용사 정보도 출력, 판매되지 않은 제품도 OUTER JOIN을 사용해서 출력        
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