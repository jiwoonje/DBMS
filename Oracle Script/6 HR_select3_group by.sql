
/* �׷��Լ� : group by, having

    select �÷���
    from ���̺�
    where ����
    group by �÷��� [������ ���� �׷���]
    having ���� [group by �� ������� ����]
    order by �÷��� asc [desc]
*/

/* ���� �Լ� : number Ÿ���� �÷��� ����
    SUM - �÷��� ��� ���� ��
    AVG - �÷��� ��� ���� ���
    MAX - �÷��� �ִ밪
    MIN - �÷��� �ּҰ�
    COUNT (*) - �׷��� �� ���ڵ� �� ���
    
    ���� : ���� ������ ��µǱ� ������ �ٸ� �÷��� ���� ���� �߻�
        ��, group by �տ� groupping �� �÷� ��� �Ұ��� (?)
*/

desc employee;

select SUM(salary), ename   -- ���� �߻�
from employee;

-- �÷��� �Լ� ���
-- ���� (salary)
select SUM(salary) �հ�, round(AVG(salary)) ���, MAX(salary) �ִ밪, MIN(salary) �ּҰ�, COUNT(*) ���ȷ��ڵ��
from employee;

-- ���� �Լ��� NULL�� �ڵ����� ó����
select commission
from employee;

-- ���ʽ� (commission)
select SUM(commission) �հ�, round(AVG(commission)) ���, MAX(commission) �ִ밪, MIN(commission) �ּҰ�, COUNT(*) ���ȷ��ڵ��
from employee;

-- �μ����� ������ �հ�, ���, �ִ�, �ּ�, �׷��� ���� ���
select
from employee
group by dno        -- DNO �÷��� ������ ���� �׷����ؼ� ���� �Լ��� ó����

select salary, dno
from employee
order by dno asc;

select dno �μ���ȣ, SUM(salary) �հ�, round(AVG(salary)) ���, MAX(salary) �ִ밪, MIN(salary) �ּҰ�, count(*) �׷��εȼ�
from employee
group by dno;

-- ��å���� ������ �հ�, ���, �ִ�, �ּ�, �׷��� ���� ���
select job ��å, sum(salary) �հ�, round(avg(salary)) ���, max(salary) �ִ밪, min(salary) �ּҰ�, count(*) �׷��εȼ�
from employee
group by job;


/*
    group by ������ where [����] vs having [����]
        where [����] : group by �ϱ� ���� ������ ������        ��Ī �̸��� ����� �� ����.
        having [����] : group by �ؼ� ���� ����� ���� ����    ��Ī �̸��� ����� �� ����.
        
        order by �÷��� asc(desc) : ��Ī �̸��� ��� ����
*/

-- ���޺��� ������ �հ�, ���, �ִ�, �ּ�, �׷��� �� ���� ����ϵ� �μ���ȣ 20�� �����ϰ�, �μ����� ����� 2000 �̻��� ���븸 ���
    -- ����� desc ���
select job ����, sum(salary) �հ�, round(avg(salary)) ���, max(salary) �ִ�, min(salary) �ּ�, count(*) �׷��εȼ�
from employee
where dno!=20
group by job
having avg(salary)>2000
order by �հ� desc;

-- group by ������ �÷��� 2�� �̻�. �� �÷��� ���ļ� ������ ������ �׷�����
    -- job, dno
    
select dno, job, sum(salary) ���Ѱ�, count(*)
from employee
group by job, dno
order by job asc;

-- �� ��å�� ���ؼ� ������ �հ�, ���, �ִ�, �ּ�, ī��Ʈ���� ����ϵ�, 81�� �Ի��� ����� ����
-- ������ ����� 1500���� �̻��� �͸� ���. ����� �������� ����

select job ��å, sum(salary) �հ�, round(avg(salary)) ���, max(salary) �ִ�, min(salary) �ּ�, count(*) ī��Ʈ��
from employee
where hiredate like '81%'
group by job
having sum(salary) >= 1500
order by ��� desc;


/*
    group by ������ ���Ǵ� Ű����
        rollup : group by �÷� <== ��� ������ ���ο� ��ü ����� �ѹ� ���
        cube : �׷��� ������ ���ο� ��� ���. ������ ���ο� ��ü ����� ���������� ���
*/

-- 1. rollup�� cube�� ������� �ʴ� ��� : �׷����� ����� ���
    select dno, job, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by dno, job
    order by dno asc;
    
    select dno, job
    from employee
    order by dno asc;

-- 2. rollup�� ����ϴ� ��� : �׷����� ��� ���, ��ü ���뵵 ���
    select dno, job, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by rollup(dno, job)
    order by dno asc;

    select job, dno, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by rollup(job, dno)
    order by job asc;
    
-- 3. cube�� ����ϴ� ��� : �׷����� ��� ���, ��ü ���뵵 ���, ���� ���ױ��� ���
    select dno, job, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by cube(dno, job)
    order by dno asc;
    
    select job, dno, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by cube(job, dno)
    order by job asc;

select *
from employee;


/*
    SubQuery : Select �� ���� select ���� [sub query]. �������� �۾��� �� �������� ó��
        - where �� ������ ���� ����
*/

-- ename[����̸�]�� SCOTT�� ����� ��å[JOB]�� ���� ������� ���. ������ 2�� �ʿ���
    -- 1. SCOTT ����� ��å�� �˾ƿ��� ����
    select job
    from employee
    where ename = 'SCOTT';
    
    -- 2. �˾ƿ� ��å�� �������� �ش��ϴ� ������� ���
    select ename
    from employee
    where job = 'ANALYST';
    
    -- SubQuery�� �Ἥ �ϳ��� ������ �����
    select ename, job
    from employee
    where job = (select job from employee where ename = 'SCOTT');
    
-- SCOTT�� ALLEN �� ��å�� �ش���� �ʴ� ������� ��� ���
    -- 1. scott�� ��å�� ����ϴ� ����
    -- 2. allen�� ��å�� ����ϴ� ����
    -- 3. where job not in ('scott����å', 'allen ��å')

    -- 1. scott�� ��å�� ����ϴ� ����
    select job from employee where ename = 'SCOTT'

    -- 2. allen�� ��å�� ����ϴ� ����
    select job from employee where ename = 'ALLEN'
 
    -- 3. SCOTT�� ALLEN �� ��å�� �ش���� �ʴ� ������� ��� ���
    select ename.job
    from employee
    where job not in ('ANALIST', 'SALESMAN');

    -- SubQuery�� �� �������� ���
    select ename, job
    from employee
    where job not in(
    (select job from employee where ename = 'SCOTT'),
    (select job from employee where ename = 'ALLEN')
    );

    select ename, job
    from employee
    where job not in (
        select job from employee
        where ename = 'SCOTT' or ename = 'ALLEN'
    );

-- 'SCOTT' ���� ���� ������ �޴� ����� ����, ������ ���
select ename ���, salary ����
from employee
where salary >(select salary from employee where ename = 'SCOTT')

select * from employee
order by salary desc;

-- �ּ� �޿��� �޴� ����� �̸�, ������, �޿� ���
select ename, job, salary
from employee
where salary = (select min(salary) from employee);

-- �μ����� �ּ� �޿��� �޴� ��������� �̸�, ��å, ������ ���   : ��Ʈ : group by, dno, min, in Ű����
select salary, dno, ename
from employee
order by dno asc, salary desc;

select ename �̸�, job ��å, salary ����
from employee
where salary in (
    select min(salary)
    from employee
    group by dno
);

-- �� �μ��� �ּ� �޿��� 30�� �μ��� �ּ� �޿����� ū �μ��� ���
select dno �μ�
from employee
where min(salary) > (
    select min(salary)
    from employee
    group by dno
);
    
select dno, count(*), min(salary) �μ����ּҿ���
from employee
group by dno                -- �μ���ȣ ������ ���� �׷���
having min(salary) > (      -- �������� : 30�� �μ��� �ּ� ����
    select min(salary)
    from employee
    where dno = 30
);






