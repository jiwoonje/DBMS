select *
from employee;

-- 1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
select SUBSTR(hiredate, 1,2) �Ի翬��, SUBSTR(hiredate, 4, 2) �Ի�� from employee;

-- 2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
select ename ���
from employee
where SUBSTR(hiredate, 4,2)=04;

-- 3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
select ename ���
from employee
where MOD(MANAGER, 2)=1 ;

-- 4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
select ename ���
from employee
where MOD(salary, 3)=0;

-- 5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�. 
select ename ���, to_CHAR(hiredate, 'YY') �Ի翬��, to_CHAR(hiredate, 'MON') �Ի��, to_CHAR(hiredate, 'DY') �Ի���� from employee;

-- 6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ������ ��ġ ��Ű�ÿ�.
select round(sysdate-to_date('2023/01/01', 'YYYY-MM-DD')) ��ĥ from dual;

-- 7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
select round(sysdate-to_date('1992/02/11', 'YYYY-MM-DD')) ��ĥ from dual;

-- 8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
select round(months_between(sysdate, to_date('1992/02/11', 'YYYY-MM-DD'))) ��� from dual;

-- 9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
select nvl(manager, 0) �����ȣ
from employee;

-- 10.   �����ȣ,
   --   [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
   --   �̸�, 
   --    [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�" 
select eno �����ȣ, RPAD((SUBSTR(eno, 1, 2)), 4, '*') ������ȣ, ename �̸�, RPAD((SUBSTR(ename, 1, 1)), 4, '*') �����̸�
from employee;
   
-- 11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12******* dual ���̺� ���
select RPAD((SUBSTR('920211-2855555', 1, 8)), 14, '*') �ֹι�ȣ, RPAD((SUBSTR('010-2991-8658', 1, 6)), 13, '*') ��ȭ��ȣ
from dual;
    
--12 �ڽ��� ���Ͽ��� ������� ��� ��Ҵ��� ?  ���� ��Ҵ��� ���   <== months_between ( ���糯¥, ����)  : ������ 
        -- sysdate - ���� (date) 
select round(months_between(sysdate, to_date('1992/02/11', 'YYYY-MM-DD'))) ���, round(sysdate-to_date('1992/02/11', 'YYYY-MM-DD')) ��ĥ from dual;

--13.  employee ���̺��� �Ի��Ϸκ��� 2050�� 12�� 24 �ϱ����� ��¥(�ϼ�)  �� ��� 
select round(to_date('2050/12/24', 'YYYY-MM-DD')-hiredate) ��ĥ
from employee;
