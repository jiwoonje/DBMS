select *
from employee;

-- 1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
select ename ����̸�, salary ����޿�, salary+300 �λ�ȱ޿�
from employee;

-- 2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. 
    -- ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�. 
select ename ����̸�, salary �޿�, salary*12+100 �����Ѽ���
from employee
order by salary*12+100 desc;
    
-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���. 
select ename ����̸�, salary �޿�
from employee
where salary > 2000
order by salary desc;

-- 4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
select ename ����̸�, dno �μ���ȣ
from employee
where eno = 7788;

-- 5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
select ename ����̸�, salary �޿�
from employee
where salary < 2000 or salary > 3000;

-- 6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
select ename ����̸�, job ������, hiredate �Ի���
from employee
where hiredate between '81/02/20' and '81/05/01' ;

-- 7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�. 
select ename ����̸�, dno �μ���ȣ
from employee
where dno = 20 or dno = 30
order by ename desc;

-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���. 
select ename ����̸�, salary �޿�, dno �μ���ȣ
from employee
where (salary between 2000 and 3000) and (dno = 20 or dno = 30)
order by ename asc;

-- 9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
select ename ����̸�, hiredate �Ի糯¥
from employee
where hiredate like '81%';

select ename ����̸�, hiredate �Ի糯¥
from employee
where substr(hiredate, 1, 2) = 81 ;

-- 10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
select ename ����̸�, job ������
from employee
where manager is null;

-- 11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename ����̸�, salary �޿�, commission Ŀ�̼�
from employee
where commission is not null
order by salary desc, commission desc;

-- 12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
select ename ����̸�
from employee
where ename like '__R%';

select ename ����̸�
from employee
where instr(ename, 'R', 3)=3;

-- 13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename ����̸�
from employee
where (ename like '%A%') and (ename like '%E%');

select ename ����̸�
from employee
where instr(ename, 'A')!=0 and instr(ename, 'E')!=0;

select ename, instr(ename, 'A'), instr(ename, 'E') from employee;

-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭 
    -- �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename ����̸�, job ������, salary �޿�
from employee
where (job = 'CLERK' or job = 'SALESMAN') and (salary != 1600 and salary != 950 and salary != 1300);
    
select ename ����̸�, job ������, salary �޿�
from employee
where (job = 'CLERK' or job = 'SALESMAN') and salary not in(1600, 950, 1300);

-- 15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
select ename ����̸�, salary �޿�, commission Ŀ�̼�
from employee
where commission > 500;

