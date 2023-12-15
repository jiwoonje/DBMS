
CREATE TABLE DEPARTMENT (
    dno number(2) constraint PK_DEPARTMENT_DNO primary key,
    dname varchar2(14),
    loc varchar2(13)
);

CREATE TABLE EMPLOYEE (
    eno number(4) constraint PK_EMPLOYEE_ENO primary key,
    ename varchar2(10),
    job varchar2(9),
    manager number(4),
    hiredate date,
    salary number(7,2),
    commission number(7,2),
    dno number(2),
        constraint FK_EMPLOYEE_DNO foreign key (dno) references DEPARTMENT(dno)
);
insert into DEPARTMENT (dno, dname, loc)
    values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPARTMENT (dno, dname, loc)
    values (20, 'RESEARCH', 'DALLAS');
insert into DEPARTMENT (dno, dname, loc)
    values (30, 'SALES', 'CHICAGO');
insert into DEPARTMENT (dno, dname, loc)
    values (40, 'OPERATIONS', 'BOSTON');

insert into DEPARTMENT
    values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPARTMENT
    values (20, 'RESEARCH', 'DALLAS');
insert into DEPARTMENT
    values (30, 'SALES', 'CHICAGO');
insert into DEPARTMENT
    values (40, 'OPERATIONS', 'BOSTON');
    
select * from department;
commit;

insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7369, 'SMITH','CLERK', 7902, '80/12/17', 800, 20);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, commission, dno)
    values (7499, 'ALLEN','SALESMAN', 7698, '81/02/20', 1600, 300, 20);
update employee
set dno = 30
where eno = 7499;
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, commission, dno)
    values (7521, 'WARD','SALESMAN', 7698, '81/02/22', 1250, 500, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7566, 'JONES','MANAGER', 7839, '81/04/02', 2975, 20);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, commission, dno)
    values (7654, 'MARTIN','SALESMAN', 7698, '81/09/28', 1250, 1400, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7698, 'BLAKE','MANAGER', 7839, '81/05/01', 2850, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7785, 'CLARK','MANAGER', 7839, '81/06/09', 2450, 10);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7788, 'SCOTT','ANALYST', 7566, '87/07/13', 3000, 20);
insert into EMPLOYEE (eno, ename, job, hiredate, salary, dno)
    values (7839, 'KING','PRESIDENT', '81/11/17', 5000, 10);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, commission, dno)
    values (7844, 'TURNER','SALESMAN', 7698, '81/09/08', 1500, 0, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7876, 'ADANS','CLERK', 7788, '87/07/13', 1100, 20);
update employee
set ename = 'ADAMS'
where eno = 7876;
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7900, 'JAMES','CLERK', 7698, '81/12/03', 950, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7902, 'FORD','ANALYST', 7566, '81/12/03', 3000, 20);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7934, 'MILLER','CLERK', 7782, '82/01/23', 1300, 10);
update employee
set eno = 7782
where eno = 7785;

insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7369, 'SMITH','CLERK', 7902, '80/12/17', 800, 20);
insert into EMPLOYEE
    values (7499, 'ALLEN','SALESMAN', 7698, '81/02/20', 1600, 300, 30);
insert into EMPLOYEE
    values (7521, 'WARD','SALESMAN', 7698, '81/02/22', 1250, 500, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7566, 'JONES','MANAGER', 7839, '81/04/02', 2975, 20);
insert into EMPLOYEE
    values (7654, 'MARTIN','SALESMAN', 7698, '81/09/28', 1250, 1400, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7698, 'BLAKE','MANAGER', 7839, '81/05/01', 2850, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7782, 'CLARK','MANAGER', 7839, '81/06/09', 2450, 10);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7788, 'SCOTT','ANALYST', 7566, '87/07/13', 3000, 20);
insert into EMPLOYEE (eno, ename, job, hiredate, salary, dno)
    values (7839, 'KING','PRESIDENT', '81/11/17', 5000, 10);
insert into EMPLOYEE
    values (7844, 'TURNER','SALESMAN', 7698, '81/09/08', 1500, 0, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7876, 'ADAMS','CLERK', 7788, '87/07/13', 1100, 20);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7900, 'JAMES','CLERK', 7698, '81/12/03', 950, 30);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7902, 'FORD','ANALYST', 7566, '81/12/03', 3000, 20);
insert into EMPLOYEE (eno, ename, job, manager, hiredate, salary, dno)
    values (7934, 'MILLER','CLERK', 7782, '82/01/23', 1300, 10);


select * from employee;

commit;

-- 1. �����ȣ(eno)�� 7788�� ����� �̸�(ename)�� �μ���ȣ(dno)�� ����ϼ���.  �÷����� ��Ī(alias) ���Ѽ� ��� �ϼ���.
select ename ����̸�, dno �μ���ȣ
from employee
where eno = 7788;

-- 2. 1981�⵵ �Ի��� ����� �̸�(ename)�� �Ի���(hiredate) �� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ���: _ , %)
select ename ����̸�, hiredate �Ի���
from employee
where hiredate like '81%';

-- 3. ��� ����(job) �� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭
    -- �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename �̸�, job ������, salary �޿�
from employee
where job in ('CLERK', 'SALESMAN') and salary not in (1600, 950, 1300);

-- 4. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���. �Ҽ����� �߶� ��� �ϼ��� . (months_between , trunc �Լ� ���)
select trunc(months_between(sysdate,to_date('1992/02/11', 'YYYY-MM-DD')))
from dual;

-- 5. �μ���(dno) ������ ����� 2000 �̻� ��� �ϵ� �μ���ȣ(dno)��  ������������ ����ϼ���.
    --����� �Ҽ����� 2�ڸ������� ����ϵ� �ݿø��ؼ� ��� �ϼ���.
select dno �μ���ȣ, round(avg(salary),2) �������
from employee
group by dno
having round(avg(salary),2) >= 2000
order by dno asc;
    
-- 6. �޿��� ��� �޿����� ���� ������� �����ȣ(eno)�� �̸�(ename)�� ǥ���ϵ� ����� �޿�(salary) �� ���� �������� �����Ͻÿ�.
    --subquery�� ����ؼ� ��� �ϼ���.
select eno �����ȣ, ename ����̸�, salary �޿�
from employee
where salary > (
    select avg(salary) ��ձ޿�
    from employee)
order by salary asc;
    
-- 7. ��å(job) �� 'MANAGER' �� ����̸�(ename), �μ���ȣ(dno), �μ���(dname), �μ���ġ(loc) ����ϵ� ����̸�(ename)
    -- �������� �����ϼ���.
select ename ����̸�, d.dno �μ���ȣ, dname �μ���, loc �μ���ġ
from employee e
    join department d
    on e.dno = d.dno
where job = 'MANAGER'
order by ename desc;
    
/*
    8. ������ ������ ������ view �� �����ؼ� �ܼ�ȭ�ϰ� view�� �����Ͻÿ� . 
��(view) �� :  v_join 

employee, department ���̺��� �μ����� �ּ� ������ �޴� ����̸�(ename), ����� ��å (job), �μ���(dname), �μ���ġ (loc)�� ����ϵ�
�ּҿ����� 900�̻� �� ����ϼ���. ��, �μ���ȣ 20���� �����ϰ� ����ϼ���. 
��Ʈ :  JOIN, group by, where, having , subquery  ������ Ȱ�� �ϼ���
��� :  view ���� ����, view ���� ���� �� ��������. 
*/
create view v_join 
as
select ename ����̸�, job ��å, dname �μ���, loc �μ���ġ
    from employee e
        join department d
            on e.dno = d.dno
where salary in (
    select min(salary)
    from employee
    where dno != 20
    group by dno
    having min(salary) > 900);

select * from v_join;

-- 9. ���̺� ����� alter table �� ����Ͽ� ������ ���� ���̺�� ���� ���� ������ �߰� �Ͻÿ� 
   -- employee ���̺��� ��� �÷��� ���� �����Ͽ� EMP50 ���̺��� �����Ͻÿ�
   -- department ���̺��� ��� �÷��� ���� �����Ͽ� DEPT50 ���̺��� �����Ͻÿ�. 
   -- ���� ���̺� �ο��� ���������� ����� ���̺��� �ο� �Ͻÿ� . 

    -- employee ���̺� ����
create table EMP50
as
select * from employee;

    -- department ���̺� ����
create table DEPT50
as
select * from department;

    -- DEPT50 PK �ο�
alter table DEPT50
add constraint PK_DEPT50_DNO primary key (dno);

select * from user_constraints where table_name in ('DEPT50');

    -- EMP50 PK �ο�
alter table EMP50
add constraint PK_EMP50_ENO primary key (eno);
    
    -- EMP50 FK �ο�
alter table EMP50
add constraint FK_EMP50_DNO foreign key (dno) references DEPT50(dno);
    
select * from user_constraints where table_name in ('EMP50');

/*
-- 10. 9�� ���׿��� ������ ���̺� (EMP50, DEPT50) ���̺��� ����Ͽ� �Ʒ� ������ �ۼ��Ͻÿ�. 
     - ��� ������ DataBase �� ������ ���� �Ͻÿ�. 
     1. EMP50 ���̺� ���ڵ�(���� �߰��Ͻÿ�). 
          �����ȣ : 8181     ����̸� : ȫ�浿     ��å : �繫��     ���ӻ�� :  SCOTT (7788) 
          �Ի糯¥ : ������ �ý����� ��¥     ���� : 1000.     ���ʽ� : 100     �μ���ȣ : 20
    2. EMP50 ���̺� ���� ���ʽ��� ���� ������� ã�Ƽ� ���ʽ��� 50���� ���� �Ͻÿ�. 
    3. DEPT50 ���̺��� �μ���ȣ 40�� �μ����� ����Ρ��� �ٲٰ�, �μ���ġ�� ������� �����Ͻÿ�. 
    4. EMP50 ���̺��� ��å�� ��MANAGER�� ������� ã�� ���� �Ͻÿ�. 
*/

insert into EMP50
    values (8181, 'ȫ�浿', '�繫��', 7788, sysdate, 1000, 100, 20);
    
select * from emp50;

update EMP50
set commission = 50
where commission is null or commission = 0;

select * from emp50;

update DEPT50
set dname = '���', loc = '����'
where dno = 40;

select * from dept50;

delete EMP50
where job = 'MANAGER';

select * from employee;

commit;
