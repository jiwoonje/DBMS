
/*
    CRUD : Create, Read, Update, Delete
            (����) (�˻�)  (����)  (����)
*/

-- ������ ���̺� ����
Create Table member (
    idx number not null,
    name varchar2(50) not null,
    id varchar2(50) not null,
    pw varchar2(50) not null,
    addr varchar2(50) null
    );
    
-- �˻� : select 
select * from member ;

-- �Է� : ���̺� ���� ����
insert into member (idx, name, id, pw, addr)
values (1, 'ȫ�浿', 'jjw', '1234', '����') ;
commit;         -- DB�� ������ �����϶� 

insert into member (idx, name, id, pw, addr)
values (2, '��浿', 'jjw1', '1234', '�λ�') ;
commit;

-- �ǽ�
-- HR3 ������ �����ϰ�, HR3 �������� �����Ͽ� member ���̺� ���� �� ���ڵ� 2�� �ֱ�