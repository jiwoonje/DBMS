
/*
    JOIN : Database에는 많은 테이블이 존재한다. 모델링을 통해서 테이블이 분리되어 있다. (R-DBMS)
    employee 테이블과 department 테이블은 하나의 테이블인데 모델링(정규화)을 통해 테이블을 분리
    모델링을 하는 이유 : 중복 제거, 성능 향상
    
    제약 조건 : 테이블의 컬럼에 들어가는 키. 데이터의 무결성 (결함 없는 데이터, 원하는 값만)
        Primary Key
            - 테이블의 컬럼에 한 번만 넣을 수 있다.
            - 두개 컬럼을 묶어서 PK를 넣을 수 있다.
            - 테이블을 생성할 때 반드시 PK가 존재해야한다. -> Update, Delete 구문에서 PK 컬럼을 where 조건으로 사용함.
            - 특정 컬럼에 중복된 값을 넣지 못하도록 함.
            - 반드시 not null 컬럼이어야 함.
            - index가 자동으로 생성된다. 컬럼의 검색을 빠르게 함.
            - Join시 ON에서 많이 사용하는 키 컬럼.
        Unique Key : 
            - 컬럼에 중복된 값을 넣지 못하도록 함.
            - null을 넣을 수 있다. 단, 한 번만 넣을 수 있다. not null, null 가능
            - 하나의 테이블에 UK를 여러번 넣을 수 있다. 
        Foreign Key : 
            - 다른 테이블(부모 테이블)의 특정 컬럼을 참조해서 값을 넣도록 함.
            - FK가 참조하는 컬럼은 부모 테이블의 PK, UK를 참조함.
        NOT NULL
            - 컬럼에 null을 넣을 수 없도록 하는 제약 조건
        CHECK
            - 컬럼에 조건을 넣어서 내가 원하는 값만 넣을 수 있도록 함
            - 월 컬럼에 1~12까지 넣을 수 있도록
        default : 제약 조건은 아니지만 제약 조건처럼 사용됨
            - 컬럼에 값을 넣지 않으면 default로 설정된 값이 등록됨
*/

select * from employee;         -- employee 테이블의 dno 컬럼은 department 테이블의 dno 컬럼을 참조한다. (Foreign Key)
select * from department;

-- 테이블 복사 : 원본 테이블의 제약 조건은 복사되지 않는다. Alter Table을 사용해서 제약 조건을 부여

create table emp01
as
select * from employee;

create table dept01
as
select * from department;

/*
    테이블의 제약 조건을 확인하는 명령어
    user_constraints : 데이터 사전 (테이블의 각종 정보를 알려주는 테이블)
*/

select * from user_constraints;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT');

-- 테이블을 복사하면 테이블의 컬럼에 부여된 제약 조건은 복사되지 않는다
-- alter table을 사용해서 제약 조건을 부여해야함
-- alter table : 생성된 테이블을 수정
select * from user_constraints
where table_name in ('EMP01', 'DEPT01');

-- dept01 테이블의 dno 컬럼에 Primary Key 제약 조건을 추가
alter table dept01
add constraint PK_DEPT01_DNO primary key (dno);

-- emp01 테이블의 dno 컬럼에 Pramary Key 제약 조건을 추가
alter table emp01
add constraint PK_EMP01_ENO primary key (eno);

-- emp01 테이블이 dno 컬럼에 Foreign Key 부여 : 참조(references)할 테이블의 컬럼은 Dept01 테이블의 dno 컬럼을 참조
alter table emp01
add constraint FK_EMP01_DNO foreign key (dno) references dept01 (dno);

-- Primary Key 컬럼을 확인 :
desc emp01;

select * from emp01;

-- 값을 넣을 때 컬럼에 부여된 제약 조건을 잘 확인하고 값을 insert
-- eno : Primary Key가 등록. 중복된 값을 넣으면 안됨
-- dno : Foreign Key가 등록. Dept01 테이블의 dno 컬럼에 존재하는 값만 넣어야 한다.
insert into emp01 (eno, ename, job, manager, hiredate, salary, commission, dno)
values (7977, 'PJW', 'CLERK', 7782, '23/12/11', 1500, null, 40);

commit;     -- DML(insert, update, delete)에서 DB에 영구히 저장되도록 함

select * from emp01;
select * from dept01;

-- dept 테이블에 값 넣기 : dno 컬럼 : Primary key 있음
insert into dept01 (dno, dname, loc)
values (40, 'HR', 'SEOUL');

-- JOIN : 여러 테이블의 컬럼을 출력할 때 JOIN을 사용해서 하나의 테이블처럼 출력함
    -- 두 테이블의 공통 키 컬럼을 확인
    -- emp01, dept01 테이블의 공통 키 컬럼은 dno이다
    -- EQUI JOIN : 오라클에서만 작동하는 JOIN 구문
    -- ANSI JOIN : 모든 DBMS에서 공통으로 사용되는 JOIN 구문
    
-- EQUI JOIN 구문으로 두 테이블 표현
    -- from 절에서 join할 테이블을 명시한다
    -- 테이블 이름은 별칭 이름으로 둠
    -- where 절에 두 테이블의 공통 키 컬럼을 명시
    -- and 절에서 조건을 처리
    -- 공통 키 컬럼을 출력할 때 반드시 테이블명.컬럼명
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from emp01 e, dept01 d
where e.dno = d.dno;

select eno, ename, job, d.dno, dname, loc
from emp01 e, dept01 d
where e.dno = d.dno
and d.dno = 10;

-- ANSI JOIN : 모든 DBMS에서 공통으로 사용되는 JOIN 구문
    -- INNER JOIN : 두 테이블에서 키 컬럼의 공통되는 부분만 출력   <== 80%
    -- OUTER JOIN : 
        -- LEFT OUTER JOIN
        -- RIGHT OUTER JOIN
        -- FULL OUTER JOIN
    -- SELF JOIN : 
    -- CROSS JOIN : 
    
    -- INNER JOIN : ANSI JOIN
        -- from 절에 JOIN 할 테이블 이름을 명시
        -- INNER 키는 생략될 수 있다.
    -- 테이블 이름을 alias(별칭) 시키지 않는 경우
    select eno, ename, salart, d.dno, dname, loc
    from emp01 INNER JOIN dept01
    on emp01.dno = dept01.dno;
    
    -- 테이블 이름을 alias(별칭) 사용한 경우
    select eno, ename, salary, d.dno, dname, loc
    from emp01 e JOIN dept01 d
    on e.dno = d.dno
    where e.dno = 20
    order by ename desc;
    
    -- INNER JOIN : ANSI JOIN : 모든 DBMS에서 공통으로 사용되는 SQL 쿼리 (Oracle, MySQL, MSSQL, DB2, ...)
    select *
    from emp01 e JOIN dept01 d
    on e.dno = d.dno
    
   -- OUTER JOIN : 
        -- LEFT OUTER JOIN : 왼쪽 테이블의 모든 내용을 출력함
        -- RIGHT OUTER JOIN : 오른쪽 테이블의 모든 내용을 출력함
        -- FULL OUTER JOIN : 왼쪽, 올은쪽 테이블의 모든 내용을 출력함
        
    select * from dept01;
    
    insert into dept01 (dno, dname, loc)
    values (60, 'MANAGE', 'PUSAN');
    
    insert into dept01 (dno, dname, loc)
    values (50, 'HR', 'SEOUL');
    
    commit;
    
        -- RIGHT OUTER JOIN : 두 테이블의 공통 부분 + 오른쪽 테이블(dept01)의 모든 내용 출력
        select *
        from emp01 e RIGHT OUTER JOIN dept01 d
        on e.dno = d.dno
    
        -- FULL OUTER JOIN : 두 테이블의 모든 내용을 출력
        select *
        from emp01 e FULL OUTER JOIN dept01 d
        on e.dno = d.dno
    
    -- SELF JOIN : 자신의 테이블을 JOIN. 자신의 테이블을 별칭이름으로 가상으로 생성해서 JOIN
        -- 조직도 출력, 직급 상사를 바로 출력할 때 사용됨
    select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관이름
    from emp01 e JOIN emp01 m
    on e.manager = m.eno;
    
    select eno, ename, manager, eno, ename
    from employee;
    
    -- 1. 사원이름 'SCOTT'의 부서명(dname), 부서위치(loc)          <== ename : 'SCOTT'은 emp01 에 있는 사원명
                                                                 -- dname, loc : dept01
    select ename, e.dno, dname, loc
    from emp01 e join dept01 d
    on e.dno = d.dno
    where ename = 'SCOTT';
    
    -- 2. 이름이 2000 이상인 사원의 이름, 부서명, 부서위치, 월급을 출력
    select ename, dname, loc, salary
    from emp01 e join dept01 d
    on e.dno = d.dno
    where salary >= 2000
    order by d.dno desc;
    
    -- 3. 직책이 'MANAGER'인 사원이름, 부서번호, 부서명, 부서위치
    select ename, e.dno, dname, loc
    from emp01 e join dept01 d
    on e.dno = d.dno
    where job = 'MANAGER'
    order by ename desc;
    
    -- SELF JOIN으로 사원 이름에 대한 직속 상관이 누구인지 출력
        -- 직속 상관이 없는 사원을 출력 : LEFT OUTER JOIN
    select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명
    from emp01 e LEFT OUTER JOIN emp01 m
    on e.manager = m.eno;
    
    -- 사원 번호는 있지만 누군가의 상관이 아닌 사원도 모두 출력 : RIGHT OUTER JOIN
    select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명
    from emp01 e RIGHT OUTER JOIN emp01 m
    on e.manager = m.eno;
    
    -- 직속 상관이 없는 것 (왼쪽), 사원번호는 가지지만 어떤 사원의 직속 상관이 아닌 사원(오른쪽) : FULL OUTER JOIN
    select e.eno 사원번호, e.ename 사원이름, e.manager 직속상관번호, m.eno 직속상관사번, m.ename 직속상관명
    from emp01 e FULL OUTER JOIN emp01 m
    on e.manager = m.eno;
    
-- VIEW : 가상의 테이블. 값은 가지지 않고 코드만 가진다.
    -- 1. 실제 테이블의 특정 컬럼만 출력할 때  <== 보안
    -- 2. 복잡한 쿼리를 한번에 만들어서 실행   <== 복잡한 JOIN 쿼리를 단순화 할 수 있다.
    
    create table EMP02
    as
    select eno, ename, salary, commission, job, hiredate, dno
    from employee
    where salary > 1500;
    
    select * from EMP02;
    
    create table DEPT02
    as
    select * from DEPARTMENT;
    
    -- 기존의 원본 테이블 employee, department ===> emp02, dept02 복사 생성.
        -- 필드명, 값만 복사됨
        -- 컬럼에 부여된 제약 조건은 복사되지 않음. <== Alter tablle을 사용해서 제약 조건 추가
        select * from user_constraints where table_name in ('EMPLOYEE', 'DEPARTMENT');
        select * from user_constraints where table_name in ('EMP02', 'DEPT02');
    
        -- 1. DEPT02 테이블의 dno (Primary Key)
        -- 2. EMP02 테이블의 eno (Primary Key), dno (Foreign Key)
        alter table DEPT02 
        add constraints PK_DEPT02_DNO primary key (dno);
        
        alter table EMP02
        add constraints PK_EMP02_eno primary key (eno);
        
        alter table EMP02
        add constraints FK_EMP02_dno foreign key (dno) references DEPT02(dno);
        
    -- VIEW 생성 : 1. 실제 테이블의 중요 정보를 감추고 출력. 보안을 향상할 수 있다.
    select * from emp02;    -- 실제 테이블 : emp02
    
    -- 뷰 생성 : 실제 테이블의 값을 가지는 것이 아니라 실행 코드만 가진다.
    create view v_EMP02
    as
    select ename, job, dno
    from EMP02; 
    
    -- 뷰 생성
    create view 만들뷰이름
    as
    select 컬럼명
    from 가져올테이블(뷰)이름
    
    select * from v_emp02;
    
-- 1. 데이터 사전 : user_테이블 <== 시스템의 정보가 저장되어있는 테이블
select * from user_views;
    
-- 2. 사용의 편의성. 복잡한 구문을 view를 생성해서 저장시켜두고 실행 <== JOIN
    -- 두 테이블을 조인해서 월급이 2500 이상인 사원 정보를 출력
    create view v_join
    as
    select ename, job, salary, dname, loc
    from emp02 e
        join dept02 d
            on e.dno = d.dno
    where salary > 2500;

    select * from v_join;
    
    -- employee, department 테이블에서 부서별로 최소 월급을 받는 사원의 정보를 출력 (사원이름, 직책, 부서명, 부서위치를 출력. 최소월급 1500이상)
        -- 사원 번호를 출력, 부서번호 20번은 제외하고
        -- 뷰 안에 쿼리를 저장하고 뷰를 실행해서 출력
    create view v_join2    
    as
    select ename 사원이름, job 직책, dname 부서명, loc 부서위치, d.dno 부서번호
    from employee e
        join department d
            on e.dno = d.dno
    where salary in (
        select min(salary)
        from employee
        where dno != 20
        group by dno
        having min(salary) > 900);
        
    -- 뷰 실행
    select * from v_join2;
    
    -- view에 정렬 컬럼까지 적용됨
    create view v_join3    
    as
    select ename 사원이름, job 직책, dname 부서명, loc 부서위치, d.dno 부서번호
    from employee e
        join department d
            on e.dno = d.dno
    where salary in (
        select min(salary)
        from employee
        where dno != 20
        group by dno
        having min(salary) > 900)
    order by ename desc;
    
    select * from v_join3;
    
-- view에 as 블락에 select 문이 옴
    -- 실제 값을 가지고 있지 않음. select 코드만 들어있음.
    -- 실제 테이블의 컬럼에 잘 매칭 될 경우
    -- insert, update, delete를 view 통해서 할 수 있다. 단, 실제 테이블의 각 칼럼의 제약 조건에 맞을 때 가능
    
select * from emp02;

create view v_test01
as
select eno, ename, dno
from emp02;

-- view 생성
select * from v_test01;

-- view에 값을 넣을 수 있다 ==> 실제 테이블에 값이 들어감.
insert into v_test01 (eno, ename, dno)
values (8080, 'HONG', 30);

commit;

-- view를 사용해서 값을 수정 : update <== where 조건을 반드시 써야함. 컬럼명은 PK가 들어간 것
update v_test01
set ename = 'KIM'
where eno = 8080;

commit;

-- view를 사용해서 값을 삭제 : delete <== where 조건을 반드시 써야함
delete v_test01
where eno = 8080;

commit;

-- v_test02 : insert (안됨), update(가능), delete(가능)
create view v_test02
as
select eno, ename, salary
from emp02;

insert into v_test02 (eno, ename, salary)
values (9090, 'SIM', 3500);

alter table emp02
modify dno not null;

delete v_test02
where eno = 9090;

commit;
    
    
