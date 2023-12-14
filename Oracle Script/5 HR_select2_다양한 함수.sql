
/*
    Oracle�� �پ��� �Լ� ����ϱ� : ��ǲ == ��� ==> ���
    1. ���ڸ� ó���ϴ� �Լ�
    2. ���ڸ� ó���ϴ� �Լ�
    3. ��¥�� ó���ϴ� �Լ�
    4. ��ȯ �Լ�
    5. �Ϲ� �Լ�
*/

-- 1. ���ڸ� ó���ϴ� �Լ�
    -- UPPER : �ҹ��ڸ� �빮�ڷ� ��ȯ���ִ� �Լ�
    -- LOWER : �빮�ڸ� �ҹ��ڷ� ��ȯ���ִ� �Լ�
    -- INITCAP : ù ���ڸ� �빮�ڷ� �����ִ� �Լ�
    -- LENGTH : ���ڼ��� ��ȯ (����:1byte, �ѱ�:1byte)
    -- LENGTHB : ���ڼ��� ��ȯ (����:1byte, �ѱ�:3byte)
    -- CONCAT : ���ڿ��� �������ִ� �Լ�
    -- SUBSTR : ���ڸ� �߶���� �Լ�
    -- INSTR : Ư�� ������ ��ġ���� ���
    -- LPAD : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� (����)
    -- RPAD : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� (������)
    -- RTRIM : �������� ���� ����
    -- LTRIM : ������ ���� ����
    
    -- UPPER
    select UPPER ('Oracle') from dual;
                                -- dual : ������ ���̺�
    select * from employee;
    select ename as �����̸�, UPPER(ename) �빮���̸�, LOWER(ename) �ҹ����̸�, INITCAP(ename) ù�ڸ��빮�� from employee;
    
    -- �˻��� �� �� : �÷��� ���� ��ҹ��ڸ� �����Ѵ�
    select *
    from employee
    where ename = "smith";
    
    select *
    from employee
    where ename = UPPER('smith');
    
    select LENGTH ('Oracle mania') from dual;     -- 12
    select LENGTH ('����Ŭ �ŴϾ�') from dual;      -- 7
    
    select LENGTHB ('Oracle mania') from dual;     -- 12
    select LENGTHB ('����Ŭ �ŴϾ�') from dual;      -- 19
    
    select ename ����, LENGTH(ename) ���ڼ� from employee;
    
    -- CONCAT : ���ڿ��� �������ִ� �Լ�
        -- || �÷��� �������ִ� ������
    select 'Oracle', 'Mania' from dual;
    
    select CONCAT ('Oracle', 'Mania') as ����� from dual;
    
    select CONCAT (ename, job) from employee;
    
    select ename || job from employee;
    
    select ename ||' '|| job �̸�����å from employee;
    
    -- SUBSTR : ���ڸ� �߶���� �Լ�. SUBSTR (�÷�, 4,3) <== �÷��� �ִ� ���ڿ� �� 4��° �ڸ����� 3���ڸ� �߶��
    select SUBSTR ('Oracle Mania', 4,3) from dual;
    
    select ename �����̸�, SUBSTR (ename, 2,3) �߶���̸� from employee;
    
    select * from employee;
        -- employee ���̺��� �̸�, �Ի���� ����ϼ��� SUBSTR ���
        select ename �̸�, SUBSTR (hiredate, 4,2) �Ի�� from employee;
    
        -- employee ���̺��� �̸�, �Ի���� ����ϼ��� SUBSTR ���. + 2���� �Ի��� ����� ���
        select ename �̸�, SUBSTR (hiredate, 4,2) �Ի��
        from employee
        where hiredate like '___02%';
        
        select ename �̸�, SUBSTR (hiredate, 4,2) �Ի��
        from employee
        where �Ի�� = '02';       -- ���� �÷��� �ƴ϶� ���� �߻���
        
        select ename �̸�, SUBSTR (hiredate, 4,2) �Ի��
        from employee
        where SUBSTR (hiredate, 4,2) = '02';
        
        -- employee ���̺��� 81�⵵�� �Ի��� ����� �̸�, �Ի��, �Ի��, �Ի��� ���
        select ename �̸�, SUBSTR (hiredate, 1,2) �Ի��, SUBSTR (hiredate, 4,2) �Ի��, SUBSTR (hiredate, 7,2) �Ի���
        from employee
        where SUBSTR (hiredate,1,2) = '81' ;
        
    -- INSTR : Ư�� ������ ��ġ��(index)�� ���. index�� 1����
        -- INSTR(�÷���, 'A') : �÷����� ���ڿ� �߿� 'A'�� �ִ� index ��ȣ�� ���
        select INSTR('Oracle Mania', 'a') from dual;    -- 3
        
        select ename �̸�, INSTR(ename, 'M') as M����ġ from employee;
        
        -- INSTR(�÷���, 'A', 4) : index 4������ ������ ���ڿ� �߿� 'A'�� �ִ� index ��ȣ�� ���
        select INSTR('Oracle Mania', 'a', 4) from dual;    -- 9
                       
    -- LPAD : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� (����)
    -- RPAD : ���� �ڸ����� �Է� �޾Ƽ� �������� Ư�� ��ȣ�� ä�� (������)
        -- LPAD(�÷���, �ø� �ڸ���, '*') : �����ڸ��� Ư�����ڷ� ġȯ (����)
        select '770824-1' �ֹι�ȣ, LPAD ('770824-1', 20, '*') from dual;
        
        -- RPAD(�÷���, �ø� �ڸ���, '*') : �����ڸ��� Ư�����ڷ� ġȯ (����)
        select '770824-1' �ֹι�ȣ, RPAD ('770824-1', 20, '*') from dual;
        
        -- �̸� ���, hiredate Į���� �⵵�� ����ϰ� �������� *�� ���. SUBSTR, RPAD ���
        select ename �̸�, RPAD (SUBSTR (hiredate, 1, 2), 14, '*') �Ի�⵵
        from employee;
        
    -- ���� ����
        -- RTRIM : �������� ���� ����
        -- LTRIM : ������ ���� ����
        -- TRIM : ���� ��� ���� ����
        select '     Oracle Mania     ' as ����,
            LTRIM ('     Oracle Mania     ') ���ʰ�������,
            RTRIM ('     Oracle Mania     ') �����ʰ�������,
            TRIM ('     Oracle Mania     ') ���������� from dual;
        
        select *
        from employee
        where ename = TRIM ('     SMITH');
        
        -- �յ� ���� ���� �� ���� �빮�ڷ� ��ȯ
        select *
        from employee
        where ename = UPPER (TRIM ('   smith'   )) ;
            
-- 2. ���ڸ� ó���ϴ� �Լ�
    -- ROUND : �ݿø�. 5�̻� �ø�, 5�̸� ����
    /*
        ROUND(�Ǽ�) : �Ҽ��� ���ڸ����� �ݿø�
        ROUNG(�Ǽ�, �Ҽ����ڸ���) : ������ �ڸ�
            - �Ҽ��� �ڸ��� ����� �� : �Ҽ��� �������� ���������� �̵��ؼ�, �� ���� �ڸ����� �ݿø�
            - �Ҽ��� �ڸ��� ������ �� : �Ҽ��� �������� �������� �̵��ؼ�, �� �ڸ����� �ݿø�
    */
    select 98.7654 as ����,                   -- 98.7654
        round(98.7654) as R1,                -- 99
        round(98.7654, 2) as R2,             -- 98.77
        round(98.7654, -1) as R3,            -- 100
        round(98.7654, -2) as R4,            -- 100
        round(98.7654, -3) as R5            -- 0
    from dual;
        
        -- �ٷμҵ漼 : ������ 3.3% (salary * 0.033)
        select salary ����, salary*0.033 �ٷμҵ漼
        from employee;
    
        select salary ����, salary*0.033 �ٷμҵ漼, round(salary*0.033) R1, round(salary*0.033, 2) R2, round(salary-(salary*0.033)) �Ǽ��ɾ�
        from employee;
    
    -- TRUNC : Ư�� �ڸ��� ���� �߶󳻱�. ��¥�� ���� �� �� ����.
    select trunc(98.7654) T1,
        trunc(98.7654, 2) T2,
        trunc(98.7654, -1) T3,
        trunc(98.7654, -2) T4
    from dual;
         select trunc(98.7654)
         from dual;
    -- MOD : �������� ���
        -- �� ����� ���� ������ �� �� trunc ���
    select MOD(5,2) ������, TRUNC(31/2) ��
    from dual;
    
-- 3. ��¥�� ó���ϴ� �Լ�
    -- sysdate : ���� �ý����� ��¥�� ���
    -- months_between : �� ��¥ ������ �������� ���
    -- add_months : Ư�� ��¥���� �������� ���ؼ� ���
    -- next_day : Ư�� ��¥���� ������ �ʷ��ϴ� ������ ���ڷ� �޾Ƽ� �����ϴ� ��¥�� ���
    -- last_day : ���� ������ ��¥�� ���
    -- round(��¥) : ��¥�� �ݿø�. 15�� �̻� �ø�, 14�� ���� ����.
    -- trunc(��¥) : ��¥�� �߶�

    -- sysdate
    select sysdate from dual;       -- 23/12/07
    
        -- ��¥�� ������ ����
        select sysdate ���糯¥, sysdate-1 ������¥, sysdate+1 ���ϳ�¥ from dual;
        
        -- ���ÿ��� 100���� ��¥��?
        select sysdate-100 "100�� �� ��¥" from dual;
        
        -- ���ú��� 1000���� ��¥��?
        select sysdate+1000 "1000�� �� ��¥" from dual;
        
        -- �Ի��Ͽ��� ���ñ��� �� �ٹ��ϼ�?
        select ename �̸�, round(sysdate-hiredate) �ѱٹ��ϼ� from employee;
        
        -- �Ի��Ͽ��� 1000�� ���� ������ ��¥�� ���
        select ename �̸�, hiredate �Ի糯¥, hiredate+1000 "+1000��" from employee;
        
        -- Ư�� ��¥���� ���� ���. TRUNC(��¥, 'MONTH') / ROUND(��¥, 'MONTH') 
        select hiredate ������¥, TRUNC(hiredate, 'MONTH'), round(hiredate, 'MONTH') from employee;
        
    -- months_between
        -- ������� �ٹ� ������ ��� : months_between(��¥, ��¥)
        select ename �̸�, hiredate �Ի���, months_between(sysdate, hiredate) �ٹ������� from employee;
    
    -- add_months
        -- ���� ��¥���� 100���� ������ ��¥ 
        select sysdate ���ó�¥, add_months(sysdate, 100) "100������", sysdate+100 "100����" from dual;
    
    -- next_day
    
    -- last_day : �ش� ���� ������ ��¥�� ���
    select last_day(sysdate) from dual;
        -- ��� ����� �Ի��� ���� ������ ��¥�� �������� ���
        select hiredate �Ի糯¥, last_day(hiredate) ��������¥ from employee;
                
-- 4. ��ȯ �Լ�
    -- TO_CHAR : ��¥, ���� ===> ����
    -- TO_DATE : ���� ===> ��¥
    -- TO_NUMBER : ���� ===> ����

    -- TO_CHAR 1. ��¥ ===> ����
    select sysdate from dual;       -- 23/12/07
    select TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:ss') from dual;
    select hiredate �Ի糯¥, TO_CHAR(hiredate, 'YYYY"��" MM"��" DD"��" HH:MI:ss') �Ի糯¥2 from employee;
    select hiredate �Ի糯¥, TO_CHAR(hiredate, 'YYYY-MM-DD MON DAY DY HH:MI:ss') �Ի糯¥2 from employee;
    
    -- TO_CHAR 2. ���� ===> ����
        -- 0 : �ڸ����� ó����. �ڸ����� ������ 0���� ó����
        -- 9 : �ڸ����� ó����. �ڸ����� ������ �������� ó����
        -- L : �� ������ ��ȭ�� ��ȣ�� ǥ����
        -- . : �Ҽ������� ó����
        -- , : õ ���� ������
        select TO_CHAR(9876, '000,000') from dual;
        select TO_CHAR(9876, '999,999') from dual;
        select TO_CHAR(9876, 'L000,000') from dual;
        select TO_CHAR(9876, 'L999,999') from dual;
            -- ������ �� ������ ��ȭ��ȣ�� õ ������ ���
            select salary ����, TO_CHAR(salary, 'L999,999') from employee;
        
    -- TO_DATE ���� ===> ��¥
    select to_date('1998-10-10', 'YYYY-MM-DD') from dual;
        -- 1981�� 1�� 1�Ͽ��� 100�� ���� ������ ��¥�� ���. 100���� ���� ������ ��¥ ���
        select to_date('1981/01/01', 'YYYY-MM-DD') ����, to_date('1981/01/01', 'YYYY-MM-DD')+100 "100����",
            add_months(to_date('1981/01/01', 'YYYY-MM-DD'), 100) "100������" from dual;
        -- �ڽ��� ���Ͽ��� �� ���� ��������? ��ĥ ��������?
        select to_date('1992/02/11', 'YYYY-MM-DD') �¾��, round(months_between(sysdate, to_date('1992/02/11', 'YYYY-MM-DD'))) ���,
            round(sysdate-to_date('1992/02/11', 'YYYY-MM-DD')) ��ĥ from dual;
        -- employee ���̺���, �Ի��Ͽ��� 2050�� 12�� 24�ϱ��� ��ĥ����?
        select ename �̸�, hiredate �Ի���, round(to_date('2050/12/24', 'YYYY-MM-DD')-hiredate) ��ĥ from employee;
    
    -- TO_NUMBER
    
    -- 5. �Ϲ� �Լ�