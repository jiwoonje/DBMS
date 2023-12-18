/*
    sequence : ������, �ڵ� ��ȣ �����
        - Ư�� �÷��� ��ȣ�� �ڵ����� ������
        - ���� Ÿ���� �÷��� �����ؾ���
        - user_sequences <== ������ ������ Ȯ��
        - ������ ������ ����. �ڷδ� �ǵ��� �� ����. �ߺ��� ���� ��������� �ʴ´�.
*/

-- 1. ������ ���� : �ʱⰪ : 1, ������ : 1
create sequence seq1
    start with 1
    increment by 1;
    
-- 2. �������� ������ Ȯ��
select * from user_sequences;

-- 3. ��� ���̺��� ����ؼ� sequence ���� Ȯ��
select seq.currval from dual;       -- ���� �������� ��ȣ Ȯ��
select seq.nextval from dual;       -- ���� �������� ��ȣ Ȯ��

-- 4. ���� insert �� Ư�� �÷��� �������� ����
create table abc (
	a number not null primary key,
	b varchar2(50),
	c varchar2(50)
);

insert into abc
	values (seq1.nextval, '����', 'add1');
commit;

select * from abc;