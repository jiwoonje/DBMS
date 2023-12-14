/*
    select : ���̺��� ���� �˻�
    select �÷��� from ���̺���(���)
    select * from employee;
*/

-- employee ���̺��� ��� �÷��� ��� �ϱ�

select *
from employee;

-- Ư�� �÷��� ��� �ϱ�
select eno, ename, job
from employee;

-- Ư�� �÷��� ������ ��� �ϱ�, �÷��� ������ �� �� �ִ�.
select eno, ename, salary, ename, ename, salary, salary * 12
from employee;

-- �÷� �̸��� ��Ī���� �ٲٰ� ����ϱ�
select eno as "��� ��ȣ", ename �����, salary as ����, salary * 12 as ����
from employee;

-- employee ���̺��� �� �÷��� �ǹ�
select *
from employee;

select eno �����ȣ, ename �����, job ��å, manager ���ӻ��, hiredate �Ի糯¥, salary ����, commission ���ʽ�, dno �μ���ȣ
from employee;

-- ���̺� ������ Ȯ���ϱ� : desc ���̺��� / ���� �÷���, null ��� ����, �ڷ���(number : ����,�Ǽ� / char,varchar2 : ���ڿ�)
desc employee;      -- insert �� �÷��� �ڷ���, null ��� ���θ� Ȯ�� �� ���� ����

select * from employee;

-- ������ ���. ���� : null ���� ������ ����� null 
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�
from employee;

-- ���� = ���� * 12 + ���ʽ�
    -- null �÷��� ������ �ϸ� ��� null -> null ó���� ���־����
    
-- null ó���� �� �Ǿ ������ �߻���
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�,      -- ���� ���̺� ���
        salary * 12 + commission ����                                -- ������ ���� ���̺� �߰�
from employee;

-- nvl (�÷���, 0) : null�� 0���� ó���ϴ� �Լ�
select eno �����ȣ, ename �����, salary ����, commission ���ʽ�,               -- ���� ���̺� ���
       nvl(commission, 0) ��ó����, salary * 12 + nvl(commission, 0) ����      -- ������ ���� ���̺� �߰�
from employee;

-- �÷��� �÷��� ������ �� �ִ�. : + - * / <== number (����, �Ǽ�Ÿ��)
    -- number : ����
    -- number (7,2) : �Ǽ�. ��ü 7�ڸ� �Ҽ��� �Ʒ� 2�ڸ�
select * from employee;
desc employee;

select ename, salary, salary + salary as "+����", salary * salary as "*����", salary * 0.1 as "������10%"
from employee;

-- �ߺ� ó�� �� ��� : distinct �÷��� : �÷����� �ߺ��� �����ϰ� ��� (������ ����ϰ� ���� ��)
select * from employee;

-- �츮 ȸ���� �μ��� �ߺ� ���� �� ���
select distinct dno
from employee;

-- �츮 ȸ���� ��å�� �ߺ� ���� �� ��� (CLERK : �繫��, SALESMAN : ����, MANAGER : ������, ANALYST : �м���, PRESIDENT : ����)
    -- ��ҹ��� ������ ���� ���� : ����(select, create, from, group by, order by), �÷���, ���̺���
    -- ���̺� ���� ���ڵ� ���� ��ҹ��ڸ� ������
    
select distinct job
from employee;

select * from employee;

-- JOB (��å) �� MANAGER (������) �� ����� ������ ���
select ename �����, job ��å
from employee
where job = 'MANAGER' ;

-- �μ� ���̺� Ȯ��
select * from department;

select dno �μ���ȣ, dname �μ���, loc �μ���ġ
from department;

-- salgrade : ������ ����� �����ϴ� ���̺�      <== JOIN
select * from salgrade;

select grade �����ǵ��, losal ���ϳ�������, hisal ���ϳ�������
from salgrade;

-- SELECT ���� ��ü ����. SQL : ����ȭ�� ���� ���
/*
    SELECT �÷���
    FROM ���̺���(���)
    WHERE ����
    GROUP BY �׷������÷���        <== �÷��� ������ ���� �׷����ؼ� ó����
    HAVING ����                   <== GROUP BY ����� ���� ����
    ORDER BY �÷��� ASC[DESC]      <== �÷��� ������ �����ؼ� ���. ASC�������� DESC��������
*/

-- where ���� ����ϱ� : �� ������ (NUMBER Ÿ���� �÷����� ���) = > < >= <= <> != ^= 
    -- or
    -- and
    -- between
    -- in (    )
    -- like
select * from employee ;

select *
from employee
where salary > 1500;

select *
from employee
where salary = 1500;

select *
from employee
where salary ^= 1500;

-- or ������
select *
from employee
where salary = 1500 or salary = 800 or salary = 1600;

-- in Ű���� : in (��, ��, ��)
select *
from employee
where salary in (1500, 800, 1600);

-- and ������ ��� : �μ���ȣ�� 10���̸鼭 ������ 1500 �̻��� ����� ���
select *
from employee
where dno = 10 and salary > 1500;

    -- ��å�� MANAGER �̸鼭 ������ 2000 �̻��� ����� �����ȣ, �����, ������ ���
    select eno �����ȣ, ename �����, salary ����, job ��å
    from employee
    where job = 'MANAGER' and salary > 2000 ;

-- �� �����ڸ� data, varchar, char : 81�⵵�� �Ի��� ����� ��� ���
select *
from employee
where hiredate > '81/01/01' and hiredate < '81/12/31' ;

-- ���ڿ� : char, varchar, nvarchar, nchar : '���ڿ�'
select *
from employee
where ename < 'D' ;         -- ù ���ڰ�  D���� ���� ���

-- like : ���ڿ����� Ư�� ���� �˻� : %(��� ���� �͵� �������) / _(�� ���ڰ� � ���� �͵� �������)
    -- �÷��� Ư�� ���� �˻� �� �����
select *
from employee
where ename like '%LA%' ;   -- LA��� ���ڰ� ����ֱ⸸ �ϸ� ���

select *
from employee
where ename like '_CO%' ;

-- null �˻� : ��ȣ, ����ǥ �� �ȴ�. is (not) null �̿�.
select * from employee;

-- commission �÷��� ���� null�� ����ڸ� ���
select *
from employee
where commission is null;

select *
from employee
where commission is not null;

-- count () : ���ڵ��� ������ ��� : ����¡ ó��
    -- null�� ī��Ʈ���� �ʴ´�.
select count(*)
from employee;

select count(ename)
from employee;

select commission
from employee;

select count(commission)        -- null�� ���� �ʴ´�
from employee;

select commission ��������      --null : ����ִ� ����. 0��
from employee;

desc employee;

-- ���̺��� ��ü ���ڵ带 ��Ȯ�ϰ� ��� : not null Į���� count(�÷���), count(*)

-- Ư�� �÷��� �����ؼ� ��� : order by �÷��� ASC[DESC]
    -- ASC �������� : A ===> Z, �� ===> ��, 1 ===> 9     : ���� ����
    -- DESC �������� : Z ===> A, �� ===> ��, 9 ===> 1 
    
-- ���� �÷��� �������� ����
select *
from employee
order by salary asc;   -- asc ���� ����

-- ���� �÷��� �������� ����
select *
from employee
order by salary desc;

-- �̸� �÷��� �������� ����
select *
from employee
order by ename;

-- ��å �÷��� �������� ����
select *
from employee
order by job desc;

-- ������ �÷��� where�� ���� ����� �� order by�� where �� ������ ó��
select *
from employee
where salary > 1500
order by salary desc;

-- order by���� ���� �÷��� ������ ��, ���� �÷��� ��� �����ϰ�, ���� ���� ������ �� ���� ���� ���ؼ� ���� �÷��� ����
    -- �亯�� �Խ��� ���� �� ����
select dno, ename
from employee
order by dno asc, ename desc ;

-- job : �������� ����, dno : job�� ������ ���� ���ؼ� dno�� ��������, ename : dno�� ������ ���� ���ؼ� ename�� ��������
select job, dno, ename
from employee
order by job asc, dno asc, ename asc;

select dno, job, ename
from employee
order by dno desc, job asc, ename desc;








