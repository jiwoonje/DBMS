
select * from help;
select * from redo_log;

-- SQL의 주석 : 한 줄 주석
/*
   여러 줄 주석
*/

/*
    일반 계정을 생성 후 일반 계정으로 접속 : 계정 생성, 권한 부여
*/
-- system 계정으로 접속한 쿼리창에서만 계정을 생성할 수 있다. 
-- 1. hr 계정을 생성 : Oracle 12 버전 이상부터 계정 생성시 C##계정명 
        -- 계정명 : hr     dkagh : 1234
create user C##HR20 identified by 1234
default tablespace USERS
temporary tablespace TEMP;

-- 2. 계정에 권한을 부여하기 : connect(접속), resource(객체 생성, 수정, 삭제)
grant resource, connect to C##HR20;

-- 3. 테이블 스페이스에서 사용량 할당
alter user C##HR20 quota unlimited on USERS;

-- 4. 계정 삭제
drop user C##HR2

-- System 계정에서 hR 계정에게 create view 권한을 부여함
grant create view to C##HR20;
