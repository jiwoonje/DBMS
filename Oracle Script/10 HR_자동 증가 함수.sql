/*
    sequence : 시퀀스, 자동 번호 재생기
        - 특정 컬럼에 번호를 자동으로 생성함
        - 정수 타입의 컬럼에 적용해야함
        - user_sequences <== 시퀀스 정보를 확인
        - 앞으로 전진만 가능. 뒤로는 되돌릴 수 없다. 중복된 값이 만들어지지 않는다.
*/

-- 1. 시퀀스 생성 : 초기값 : 1, 증가값 : 1
create sequence seq1
    start with 1
    increment by 1;
    
-- 2. 시퀀스의 정보를 확인
select * from user_sequences;

-- 3. 듀얼 테이블을 사용해서 sequence 정보 확인
select seq.currval from dual;       -- 현재 시퀀스의 번호 확인
select seq.nextval from dual;       -- 다음 시퀀스의 번호 확인

-- 4. 값을 insert 시 특정 컬럼에 시쿼스를 부착
create table abc (
	a number not null primary key,
	b varchar2(50),
	c varchar2(50)
);

insert into abc
	values (seq1.nextval, '서울', 'add1');
commit;

select * from abc;