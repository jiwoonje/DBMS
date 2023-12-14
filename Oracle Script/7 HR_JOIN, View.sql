
/*
    JOIN : Database���� ���� ���̺��� �����Ѵ�. �𵨸��� ���ؼ� ���̺��� �и��Ǿ� �ִ�. (R-DBMS)
    employee ���̺�� department ���̺��� �ϳ��� ���̺��ε� �𵨸�(����ȭ)�� ���� ���̺��� �и�
    �𵨸��� �ϴ� ���� : �ߺ� ����, ���� ���
    
    ���� ���� : ���̺��� �÷��� ���� Ű. �������� ���Ἲ (���� ���� ������, ���ϴ� ����)
        Primary Key
            - ���̺��� �÷��� �� ���� ���� �� �ִ�.
            - �ΰ� �÷��� ��� PK�� ���� �� �ִ�.
            - ���̺��� ������ �� �ݵ�� PK�� �����ؾ��Ѵ�. -> Update, Delete �������� PK �÷��� where �������� �����.
            - Ư�� �÷��� �ߺ��� ���� ���� ���ϵ��� ��.
            - �ݵ�� not null �÷��̾�� ��.
            - index�� �ڵ����� �����ȴ�. �÷��� �˻��� ������ ��.
            - Join�� ON���� ���� ����ϴ� Ű �÷�.
        Unique Key : 
            - �÷��� �ߺ��� ���� ���� ���ϵ��� ��.
            - null�� ���� �� �ִ�. ��, �� ���� ���� �� �ִ�. not null, null ����
            - �ϳ��� ���̺� UK�� ������ ���� �� �ִ�. 
        Foreign Key : 
            - �ٸ� ���̺�(�θ� ���̺�)�� Ư�� �÷��� �����ؼ� ���� �ֵ��� ��.
            - FK�� �����ϴ� �÷��� �θ� ���̺��� PK, UK�� ������.
        NOT NULL
            - �÷��� null�� ���� �� ������ �ϴ� ���� ����
        CHECK
            - �÷��� ������ �־ ���� ���ϴ� ���� ���� �� �ֵ��� ��
            - �� �÷��� 1~12���� ���� �� �ֵ���
        default : ���� ������ �ƴ����� ���� ����ó�� ����
            - �÷��� ���� ���� ������ default�� ������ ���� ��ϵ�
*/

select * from employee;         -- employee ���̺��� dno �÷��� department ���̺��� dno �÷��� �����Ѵ�. (Foreign Key)
select * from department;

-- ���̺� ���� : ���� ���̺��� ���� ������ ������� �ʴ´�. Alter Table�� ����ؼ� ���� ������ �ο�

create table emp01
as
select * from employee;

create table dept01
as
select * from department;

/*
    ���̺��� ���� ������ Ȯ���ϴ� ��ɾ�
    user_constraints : ������ ���� (���̺��� ���� ������ �˷��ִ� ���̺�)
*/

select * from user_constraints;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT');

-- ���̺��� �����ϸ� ���̺��� �÷��� �ο��� ���� ������ ������� �ʴ´�
-- alter table�� ����ؼ� ���� ������ �ο��ؾ���
-- alter table : ������ ���̺��� ����
select * from user_constraints
where table_name in ('EMP01', 'DEPT01');

-- dept01 ���̺��� dno �÷��� Primary Key ���� ������ �߰�
alter table dept01
add constraint PK_DEPT01_DNO primary key (dno);

-- emp01 ���̺��� dno �÷��� Pramary Key ���� ������ �߰�
alter table emp01
add constraint PK_EMP01_ENO primary key (eno);

-- emp01 ���̺��� dno �÷��� Foreign Key �ο� : ����(references)�� ���̺��� �÷��� Dept01 ���̺��� dno �÷��� ����
alter table emp01
add constraint FK_EMP01_DNO foreign key (dno) references dept01 (dno);

-- Primary Key �÷��� Ȯ�� :
desc emp01;

select * from emp01;

-- ���� ���� �� �÷��� �ο��� ���� ������ �� Ȯ���ϰ� ���� insert
-- eno : Primary Key�� ���. �ߺ��� ���� ������ �ȵ�
-- dno : Foreign Key�� ���. Dept01 ���̺��� dno �÷��� �����ϴ� ���� �־�� �Ѵ�.
insert into emp01 (eno, ename, job, manager, hiredate, salary, commission, dno)
values (7977, 'PJW', 'CLERK', 7782, '23/12/11', 1500, null, 40);

commit;     -- DML(insert, update, delete)���� DB�� ������ ����ǵ��� ��

select * from emp01;
select * from dept01;

-- dept ���̺� �� �ֱ� : dno �÷� : Primary key ����
insert into dept01 (dno, dname, loc)
values (40, 'HR', 'SEOUL');

-- JOIN : ���� ���̺��� �÷��� ����� �� JOIN�� ����ؼ� �ϳ��� ���̺�ó�� �����
    -- �� ���̺��� ���� Ű �÷��� Ȯ��
    -- emp01, dept01 ���̺��� ���� Ű �÷��� dno�̴�
    -- EQUI JOIN : ����Ŭ������ �۵��ϴ� JOIN ����
    -- ANSI JOIN : ��� DBMS���� �������� ���Ǵ� JOIN ����
    
-- EQUI JOIN �������� �� ���̺� ǥ��
    -- from ������ join�� ���̺��� ����Ѵ�
    -- ���̺� �̸��� ��Ī �̸����� ��
    -- where ���� �� ���̺��� ���� Ű �÷��� ���
    -- and ������ ������ ó��
    -- ���� Ű �÷��� ����� �� �ݵ�� ���̺��.�÷���
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from emp01 e, dept01 d
where e.dno = d.dno;

select eno, ename, job, d.dno, dname, loc
from emp01 e, dept01 d
where e.dno = d.dno
and d.dno = 10;

-- ANSI JOIN : ��� DBMS���� �������� ���Ǵ� JOIN ����
    -- INNER JOIN : �� ���̺��� Ű �÷��� ����Ǵ� �κи� ���   <== 80%
    -- OUTER JOIN : 
        -- LEFT OUTER JOIN
        -- RIGHT OUTER JOIN
        -- FULL OUTER JOIN
    -- SELF JOIN : 
    -- CROSS JOIN : 
    
    -- INNER JOIN : ANSI JOIN
        -- from ���� JOIN �� ���̺� �̸��� ���
        -- INNER Ű�� ������ �� �ִ�.
    -- ���̺� �̸��� alias(��Ī) ��Ű�� �ʴ� ���
    select eno, ename, salart, d.dno, dname, loc
    from emp01 INNER JOIN dept01
    on emp01.dno = dept01.dno;
    
    -- ���̺� �̸��� alias(��Ī) ����� ���
    select eno, ename, salary, d.dno, dname, loc
    from emp01 e JOIN dept01 d
    on e.dno = d.dno
    where e.dno = 20
    order by ename desc;
    
    -- INNER JOIN : ANSI JOIN : ��� DBMS���� �������� ���Ǵ� SQL ���� (Oracle, MySQL, MSSQL, DB2, ...)
    select *
    from emp01 e JOIN dept01 d
    on e.dno = d.dno
    
   -- OUTER JOIN : 
        -- LEFT OUTER JOIN : ���� ���̺��� ��� ������ �����
        -- RIGHT OUTER JOIN : ������ ���̺��� ��� ������ �����
        -- FULL OUTER JOIN : ����, ������ ���̺��� ��� ������ �����
        
    select * from dept01;
    
    insert into dept01 (dno, dname, loc)
    values (60, 'MANAGE', 'PUSAN');
    
    insert into dept01 (dno, dname, loc)
    values (50, 'HR', 'SEOUL');
    
    commit;
    
        -- RIGHT OUTER JOIN : �� ���̺��� ���� �κ� + ������ ���̺�(dept01)�� ��� ���� ���
        select *
        from emp01 e RIGHT OUTER JOIN dept01 d
        on e.dno = d.dno
    
        -- FULL OUTER JOIN : �� ���̺��� ��� ������ ���
        select *
        from emp01 e FULL OUTER JOIN dept01 d
        on e.dno = d.dno
    
    -- SELF JOIN : �ڽ��� ���̺��� JOIN. �ڽ��� ���̺��� ��Ī�̸����� �������� �����ؼ� JOIN
        -- ������ ���, ���� ��縦 �ٷ� ����� �� ����
    select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ���̸�
    from emp01 e JOIN emp01 m
    on e.manager = m.eno;
    
    select eno, ename, manager, eno, ename
    from employee;
    
    -- 1. ����̸� 'SCOTT'�� �μ���(dname), �μ���ġ(loc)          <== ename : 'SCOTT'�� emp01 �� �ִ� �����
                                                                 -- dname, loc : dept01
    select ename, e.dno, dname, loc
    from emp01 e join dept01 d
    on e.dno = d.dno
    where ename = 'SCOTT';
    
    -- 2. �̸��� 2000 �̻��� ����� �̸�, �μ���, �μ���ġ, ������ ���
    select ename, dname, loc, salary
    from emp01 e join dept01 d
    on e.dno = d.dno
    where salary >= 2000
    order by d.dno desc;
    
    -- 3. ��å�� 'MANAGER'�� ����̸�, �μ���ȣ, �μ���, �μ���ġ
    select ename, e.dno, dname, loc
    from emp01 e join dept01 d
    on e.dno = d.dno
    where job = 'MANAGER'
    order by ename desc;
    
    -- SELF JOIN���� ��� �̸��� ���� ���� ����� �������� ���
        -- ���� ����� ���� ����� ��� : LEFT OUTER JOIN
    select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����
    from emp01 e LEFT OUTER JOIN emp01 m
    on e.manager = m.eno;
    
    -- ��� ��ȣ�� ������ �������� ����� �ƴ� ����� ��� ��� : RIGHT OUTER JOIN
    select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����
    from emp01 e RIGHT OUTER JOIN emp01 m
    on e.manager = m.eno;
    
    -- ���� ����� ���� �� (����), �����ȣ�� �������� � ����� ���� ����� �ƴ� ���(������) : FULL OUTER JOIN
    select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�����, m.ename ���ӻ����
    from emp01 e FULL OUTER JOIN emp01 m
    on e.manager = m.eno;
    
-- VIEW : ������ ���̺�. ���� ������ �ʰ� �ڵ常 ������.
    -- 1. ���� ���̺��� Ư�� �÷��� ����� ��  <== ����
    -- 2. ������ ������ �ѹ��� ���� ����   <== ������ JOIN ������ �ܼ�ȭ �� �� �ִ�.
    
    create table EMP02
    as
    select eno, ename, salary, commission, job, hiredate, dno
    from employee
    where salary > 1500;
    
    select * from EMP02;
    
    create table DEPT02
    as
    select * from DEPARTMENT;
    
    -- ������ ���� ���̺� employee, department ===> emp02, dept02 ���� ����.
        -- �ʵ��, ���� �����
        -- �÷��� �ο��� ���� ������ ������� ����. <== Alter tablle�� ����ؼ� ���� ���� �߰�
        select * from user_constraints where table_name in ('EMPLOYEE', 'DEPARTMENT');
        select * from user_constraints where table_name in ('EMP02', 'DEPT02');
    
        -- 1. DEPT02 ���̺��� dno (Primary Key)
        -- 2. EMP02 ���̺��� eno (Primary Key), dno (Foreign Key)
        alter table DEPT02 
        add constraints PK_DEPT02_DNO primary key (dno);
        
        alter table EMP02
        add constraints PK_EMP02_eno primary key (eno);
        
        alter table EMP02
        add constraints FK_EMP02_dno foreign key (dno) references DEPT02(dno);
        
    -- VIEW ���� : 1. ���� ���̺��� �߿� ������ ���߰� ���. ������ ����� �� �ִ�.
    select * from emp02;    -- ���� ���̺� : emp02
    
    -- �� ���� : ���� ���̺��� ���� ������ ���� �ƴ϶� ���� �ڵ常 ������.
    create view v_EMP02
    as
    select ename, job, dno
    from EMP02; 
    
    -- �� ����
    create view ������̸�
    as
    select �÷���
    from ���������̺�(��)�̸�
    
    select * from v_emp02;
    
-- 1. ������ ���� : user_���̺� <== �ý����� ������ ����Ǿ��ִ� ���̺�
select * from user_views;
    
-- 2. ����� ���Ǽ�. ������ ������ view�� �����ؼ� ������ѵΰ� ���� <== JOIN
    -- �� ���̺��� �����ؼ� ������ 2500 �̻��� ��� ������ ���
    create view v_join
    as
    select ename, job, salary, dname, loc
    from emp02 e
        join dept02 d
            on e.dno = d.dno
    where salary > 2500;

    select * from v_join;
    
    -- employee, department ���̺��� �μ����� �ּ� ������ �޴� ����� ������ ��� (����̸�, ��å, �μ���, �μ���ġ�� ���. �ּҿ��� 1500�̻�)
        -- ��� ��ȣ�� ���, �μ���ȣ 20���� �����ϰ�
        -- �� �ȿ� ������ �����ϰ� �並 �����ؼ� ���
    create view v_join2    
    as
    select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ, d.dno �μ���ȣ
    from employee e
        join department d
            on e.dno = d.dno
    where salary in (
        select min(salary)
        from employee
        where dno != 20
        group by dno
        having min(salary) > 900);
        
    -- �� ����
    select * from v_join2;
    
    -- view�� ���� �÷����� �����
    create view v_join3    
    as
    select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ, d.dno �μ���ȣ
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
    
-- view�� as ����� select ���� ��
    -- ���� ���� ������ ���� ����. select �ڵ常 �������.
    -- ���� ���̺��� �÷��� �� ��Ī �� ���
    -- insert, update, delete�� view ���ؼ� �� �� �ִ�. ��, ���� ���̺��� �� Į���� ���� ���ǿ� ���� �� ����
    
select * from emp02;

create view v_test01
as
select eno, ename, dno
from emp02;

-- view ����
select * from v_test01;

-- view�� ���� ���� �� �ִ� ==> ���� ���̺� ���� ��.
insert into v_test01 (eno, ename, dno)
values (8080, 'HONG', 30);

commit;

-- view�� ����ؼ� ���� ���� : update <== where ������ �ݵ�� �����. �÷����� PK�� �� ��
update v_test01
set ename = 'KIM'
where eno = 8080;

commit;

-- view�� ����ؼ� ���� ���� : delete <== where ������ �ݵ�� �����
delete v_test01
where eno = 8080;

commit;

-- v_test02 : insert (�ȵ�), update(����), delete(����)
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
    
    
