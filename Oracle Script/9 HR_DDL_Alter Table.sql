
/*
    DDL : Create, Alter, drop <-- ��ü(���̺�, ��, �Լ�, �������ν���, Ʈ����, ������..)
    - ���̺� ���� ��, ������ ������ ���̺� ���ؼ� ����ϰ� ��������(Alter table)
        - 1. �÷��� �ڷ����� ���� : varchar(50) ==> varchar(100)
        - 2. �÷��� �̸��� ����, �÷��� ����, �÷��� �߰�
        - 3. �÷��� ���������� �߰�, ����(PK, FK, Unique, NOT NULL, CHECK, default)
*/

-- �ǽ��� ���� ���̺� ���� : �÷���, ���� ����
create table emp60
as
select * from employee;

create table dept60
as
select * from department;

select * from emp60;
select * from dept60;

-- ������ ���� : user_. user_constraints : �����ͺ��̽��� �����ϴ� ��� ���̺� ���� ���������� ���
select * from user_constraints;

select * from user_constraints
where table_name in ('EMPLOYEE', 'DEPARTMENT');

-- ������ ���̺��� ���� ������ ������� �ʴ´�.
select * from user_constraints
where table_name in ('EMP60', 'DEPT60');

    -- 1. Alter Table�� ����ؼ� ���� ���̺� �÷��� �߰� : birth(date), email(varchar2(100))
        -- ���� ���̺� �÷��� �߰��� �� �ش� �÷��� nullable�̾����
    desc dept60;
    
    alter table dept60
    add (birth date);
    
        -- ���� ���̺� �������� Į���� �Ѳ����� �߰��ϱ�
        alter table dept60
        add (email varchar2(100), addr varchar2(200), jumin char(14));
    
        -- ������ ������ �÷��� �� �ֱ� : update
        update dept60
        set birth = sysdate, email = 'aaa@aaa.com', addr = '����', jumin = '123456-7891011'
            -- where ������ ��� ���ڵ忡 ����
        select * from dept60;
        rollback;
        
        update dept60
        set birth = sysdate, email = 'aaa@aaa.com', addr = '����', jumin = '123456-7891011'
        where dno = 10;
        
        rollback;
        commit;
        
        -- default ���������� not null �տ� ��ġ�ؾ� �Ѵ�.
        create table account10(
            no number not null primary key,
            name varchar(50) not null,
            money number(7,2) default 0 not null 
        );
        
        
    -- 2. �÷��� �ο��� �ڷ����� ���� : char(10) ==> char(50), varchar2(100) ==> varchar2(200)
    desc dept60;
    
    alter table dept60
    modify email varchar2(200);
    
    -- 3. Ư�� �÷��� ���� :
    alter table dept60
    drop column JUMIN;
    
    -- 4. �÷��� �̸� ���� : addr ==> address1
    alter table dept60
    rename column addr to address1;
    
    -- 5. ���̺� �̸� ���� : dept60 ==> dept70
    desc dept60;
    
    rename dept60 to dept70;
    
    select * from dept60;
    select * from dept70;
    

    rename dept70 to dept60;
    
    -- 6. ���� ���̺��� ���� ���� �߰�, ���� (PK, Unique, FK,  check, default)
    select * from user_constraints where table_name in ('DEPARTMENT', 'EMPLOYEE');
    select * from user_constraints where table_name in ('DEPT60', 'EMP60');
    
        -- 6-1. PK �������� �߰� : dept60(dno) emp60(ename)
            -- DEPT60(dno)�� PK �������� �߰� : ���� ���� �̸��� ����ؼ� �ο���
        alter table DEPT60  
        add constraint PK_DEPT60_DNO Primary Key (dno);
        
            -- EMP60(ename)�� PK �������� �߰� : ���� ���� �̸��� Oracle�� ���Ƿ� �ο���
        alter table EMP60
        add Primary key (ename);
        
        alter table EMP60  
        add constraint PK_EMP60_ENAME Primary Key (ename);
                
            -- ���� ���� ����
        alter table EMP60
        drop constraint PK_EMP_ENAME;
        
        -- 6-2. FK : �ٸ� ���̺��� �÷��� ���� �����ؼ� ���� ���� �� �ִ�.
            -- �θ����̺� <== FK ���̺�
            -- JOIN�� on ������ ���Ǵ� Ű �÷�
            -- �θ� ���̺��� ���� �÷��� PK, Unique�� ������ �� �ִ�.
            -- ���� �÷��� ������ Ÿ���� ����ϰų� ���ƾ� �Ѵ�.
            
            select * from user_constraints where table_name in ('DEPT60', 'EMP60');
            -- EMP60(dno) ===> DEPT60(dno)
            desc dept60;
            desc emp60;
            
            -- Foreign Key ���� ������ �ֱ�
            -- 1. �θ����̺� Primary Key �Ҵ�
            alter table dept60
            add constraint PK_DEPT60)DNO primary key (dno);
            
            -- 2. �ڽ� ���̺��� Foreign Key �Ҵ� : �θ� ���̺��� Primary Key�� ����
            alter table emp60
            add constraint FK_EMP60_DNO Foreign Key(dno) references DEPT60(dno);
            
            select * from user_constraints where table_name in ('DEPT60', 'EMP60');
            
                -- Foreign Key�� JOIN�� ON���� �����ϴ� �÷�
                select eno, ename, salary, e.dno, d.dno, dname, loc
                from emp60 e
                    JOIN dept60 d
                        ON e.dno = d.dno;
            
        -- 6-3. Unique ���� ���� �߰� : �÷� �ߺ��� ���� ���� ���ϵ��� ����
            -- �� ���̺��� ���� �÷��� �ο��� �� �ִ�.
            -- not null, null ��� Unique. �ֹι�ȣ, Email
            -- null �� ���� ���� �� �ִ�. (�ߺ��Ǹ� �ȵ�)
            
        desc dept60;
        desc emp60;
        select * from user_constraints where table_name in ('DEPT60', 'EMP60');
        
        alter table dept60
        add constraint U_DEPT60_EMAIL unique (email);
        
        select * from dept60;
        
        insert into dept60
            values (50, '������', '�λ�', sysdate, 'aaa@aaa.com', '�λ�');
        
        insert into dept60
            values (60, '������', '�λ�', sysdate, 'aaa@aaa.com', '�λ�');      -- email�� �ߺ��Ǵ� ���� �־ �� ����

        
        insert into dept60
            values (60, '������', '�λ�', sysdate, 'bbb@bbb.com', '����');
            
        alter table dept60
        add constraint U_DEPT60_ADDRESS1 unique (address1);
        
            -- ���� ���� ����
            alter table dept60
            drop constraint U_DEPT60_ADDRESS1;
            
        
        -- 6-4. CHECK ���� ���� �߰� : �÷��� ������ �ο��ؼ� ���ǿ� �´� ���� �˻�
        select * from emp60;
        
        alter table emp60
        add (addr varchar2(50), hdate date);
        
            -- addr �÷� : '����', '�λ�', '����' �� ���� �� �ֵ��� ����
            -- hdate �÷� : 2023�� 1�� 1�� ~ 2023�� 12�� 31�� ���̿����� �����ϵ��� ����
            -- AGE Į�� : 0~300�� ������ ����
            alter table emp60
            add constraint CK_EMP60_ADDR check (addr in('����', '�λ�', '����'));
            
            desc emp60; 
            insert into emp60 (eno, dno, addr)
            values (8080, 20, '����');
            
            alter table emp60
            add constraint CK_EMP60_HDATE check (HDATE BETWEEN TO_DATE('20230101', 'YYYYMMDD') and TO_DATE('20231231', 'YYYYMMDD'));
            
            insert into emp60 (eno, dno, addr, hdate)
                values (8181, 20, '����', '23/10/01');
            
            alter table emp60
            add age number(5);
            
            alter table EMP60
            add constraint CK_EMP60_AGE CHECK (AGE >=0 and age <= 300);
            
            insert into EMP60 (eno, dno, addr, hdate, age)
            values (8282, 20, '�λ�', '23/10/01', 88);
            
            select * from emp60;
            commit;
            
        -- 6-5. NOT NULL ��� ���� : �÷��� NULL �Ұ����ϵ��� ����. �ݵ�� ���� �ԷµǾ�� �Ѵ�.
            -- �÷��� ���� NULL�� ������ ���� �߻�
        
        desc dept60;
        select* from dept60;
        
        alter table dept60
        modify address1 constraint NN_DEPT60_ADDRESS1 NOT NULL;
        
        update dept60
        set address1 = '����'
        where address1 is null;
        
        select * from user_constraints where table_name in ('DEPT60', 'EMP60');
        
        insert into dept60
            values (70, '������', '�λ�', sysdate, 'ccc@ccc.com', '�뱸');
            
        -- 6-6. default : ���� ������ �ƴ�. ���� ���� �̸��� �ο��� �� ����.
            -- �÷��� ���� ���� ���� ��� default�� ������ ���� �ڵ����� ��.
            -- default�� ������ �����ϱ� ���ؼ��� default null
        select * from dept60;
        
        alter table dept60
        add address2 varchar2(100);
        
        alter table dept60
        modify address2 default '����';
        
        insert into dept60
            values (80, '������', '�λ�', sysdate, 'ddd@ddd.com', '�뱸', default);
        
        commit;
        
        insert into dept60 (dno, address1)
        values (90, '����');
        
        commit;
    
            -- default ���� ���� ���� : default null 
            alter table dept60
            modify address2 default null;
        
        -- ���� ���� ���� : PK, FK, Uniqje, NOT NULL, CHECK
            -- alter table ���̺�� drop �������� �̸�
        -- ���� ���� ���� : defaul
            -- alter table ���̺�� modify �÷��� default null
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        