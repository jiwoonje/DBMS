/*
    select : 테이블의 값을 검색
    select 컬럼명 from 테이블명(뷰명)
    select * from employee;
*/

-- employee 테이블의 모든 컬럼을 출력 하기

select *
from employee;

-- 특정 컬럼만 출력 하기
select eno, ename, job
from employee;

-- 특정 컬럼을 여러번 출력 하기, 컬럼에 연산을 할 수 있다.
select eno, ename, salary, ename, ename, salary, salary * 12
from employee;

-- 컬럼 이름을 별칭으로 바꾸고 출력하기
select eno as "사원 번호", ename 사원명, salary as 월급, salary * 12 as 연봉
from employee;

-- employee 테이블의 각 컬럼의 의미
select *
from employee;

select eno 사원번호, ename 사원명, job 직책, manager 직속상관, hiredate 입사날짜, salary 월급, commission 보너스, dno 부서번호
from employee;

-- 테이블 구조를 확인하기 : desc 테이블명 / 실제 컬럼명, null 허용 여부, 자료형(number : 정수,실수 / char,varchar2 : 문자열)
desc employee;      -- insert 시 컬럼의 자료형, null 허용 여부를 확인 후 값을 넣음

select * from employee;

-- 연봉을 계산. 주의 : null 과의 연산은 결과가 null 
select eno 사원번호, ename 사원명, salary 월급, commission 보너스
from employee;

-- 연봉 = 월급 * 12 + 보너스
    -- null 컬럼과 연산을 하면 모두 null -> null 처리를 해주어야함
    
-- null 처리가 안 되어서 오류가 발생함
select eno 사원번호, ename 사원명, salary 월급, commission 보너스,      -- 원본 테이블 출력
        salary * 12 + commission 연봉                                -- 연산을 넣은 테이블 추가
from employee;

-- nvl (컬럼명, 0) : null을 0으로 처리하는 함수
select eno 사원번호, ename 사원명, salary 월급, commission 보너스,               -- 원본 테이블 출력
       nvl(commission, 0) 널처리됨, salary * 12 + nvl(commission, 0) 연봉      -- 연산을 넣은 테이블 추가
from employee;

-- 컬럼과 컬럼을 연산할 수 있다. : + - * / <== number (정수, 실수타입)
    -- number : 정수
    -- number (7,2) : 실수. 전체 7자리 소수점 아래 2자리
select * from employee;
desc employee;

select ename, salary, salary + salary as "+연산", salary * salary as "*연산", salary * 0.1 as "월급의10%"
from employee;

-- 중복 처리 후 출력 : distinct 컬럼명 : 컬럼명의 중복을 제거하고 출력 (종류만 출력하고 싶을 때)
select * from employee;

-- 우리 회사의 부서만 중복 제거 후 출력
select distinct dno
from employee;

-- 우리 회사의 직책만 중복 제거 후 출력 (CLERK : 사무원, SALESMAN : 영업, MANAGER : 관리자, ANALYST : 분석가, PRESIDENT : 사장)
    -- 대소문자 구분을 하지 않음 : 쿼리(select, create, from, group by, order by), 컬럼명, 테이블명
    -- 테이블 안의 레코드 값은 대소문자를 구분함
    
select distinct job
from employee;

select * from employee;

-- JOB (직책) 이 MANAGER (관리자) 인 사용자 정보만 출력
select ename 사원명, job 직책
from employee
where job = 'MANAGER' ;

-- 부서 테이블 확인
select * from department;

select dno 부서번호, dname 부서명, loc 부서위치
from department;

-- salgrade : 연봉의 등급을 적용하는 테이블      <== JOIN
select * from salgrade;

select grade 연봉의등급, losal 제일낮은연봉, hisal 제일높은연봉
from salgrade;

-- SELECT 문의 전체 내용. SQL : 구조화된 질의 언어
/*
    SELECT 컬럼명
    FROM 테이블명(뷰명)
    WHERE 조건
    GROUP BY 그룹핑할컬럼명        <== 컬럼의 동일한 값을 그룹핑해서 처리함
    HAVING 조건                   <== GROUP BY 결과에 대한 조건
    ORDER BY 컬럼명 ASC[DESC]      <== 컬럼의 내용을 정렬해서 출력. ASC내림차순 DESC오름차순
*/

-- where 조건 사용하기 : 비교 연산자 (NUMBER 타입의 컬럼에서 사용) = > < >= <= <> != ^= 
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

-- or 연산자
select *
from employee
where salary = 1500 or salary = 800 or salary = 1600;

-- in 키워드 : in (값, 값, 값)
select *
from employee
where salary in (1500, 800, 1600);

-- and 연산자 사용 : 부서번호가 10번이면서 월급이 1500 이상인 사원을 출력
select *
from employee
where dno = 10 and salary > 1500;

    -- 직책이 MANAGER 이면서 월급이 2000 이상인 사원의 사원번호, 사원명, 월급을 출력
    select eno 사원번호, ename 사원명, salary 월급, job 직책
    from employee
    where job = 'MANAGER' and salary > 2000 ;

-- 비교 연산자를 data, varchar, char : 81년도에 입사한 사원을 모두 출력
select *
from employee
where hiredate > '81/01/01' and hiredate < '81/12/31' ;

-- 문자열 : char, varchar, nvarchar, nchar : '문자열'
select *
from employee
where ename < 'D' ;         -- 첫 글자가  D보다 작은 경우

-- like : 문자열에서 특정 값만 검색 : %(모든 것이 와도 상관없다) / _(한 글자가 어떤 것이 와도 상관없다)
    -- 컬럼의 특정 값을 검색 시 사용함
select *
from employee
where ename like '%LA%' ;   -- LA라는 글자가 들어있기만 하면 출력

select *
from employee
where ename like '_CO%' ;

-- null 검색 : 등호, 따옴표 안 된다. is (not) null 이용.
select * from employee;

-- commission 컬럼의 값이 null인 사용자만 출력
select *
from employee
where commission is null;

select *
from employee
where commission is not null;

-- count () : 레코드의 개수를 출력 : 페이징 처리
    -- null은 카운트하지 않는다.
select count(*)
from employee;

select count(ename)
from employee;

select commission
from employee;

select count(commission)        -- null은 세지 않는다
from employee;

select commission 수능점수      --null : 비어있는 상태. 0점
from employee;

desc employee;

-- 테이블의 전체 레코드를 정확하게 출력 : not null 칼럼을 count(컬럼명), count(*)

-- 특정 컬럼을 정렬해서 출력 : order by 컬럼명 ASC[DESC]
    -- ASC 오름차순 : A ===> Z, 가 ===> 하, 1 ===> 9     : 생략 가능
    -- DESC 내림차순 : Z ===> A, 하 ===> 가, 9 ===> 1 
    
-- 월급 컬럼을 오름차순 정렬
select *
from employee
order by salary asc;   -- asc 생략 가능

-- 월급 컬럼을 내림차순 정렬
select *
from employee
order by salary desc;

-- 이름 컬럼을 오름차순 정렬
select *
from employee
order by ename;

-- 직책 컬럼을 내림차순 정렬
select *
from employee
order by job desc;

-- 정렬할 컬럼을 where와 같이 사용할 때 order by는 where 절 다음에 처리
select *
from employee
where salary > 1500
order by salary desc;

-- order by에서 여러 컬럼을 정렬할 때, 앞의 컬럼을 모두 정렬하고, 같은 값이 존재할 때 같은 값에 대해서 위의 컬럼을 정렬
    -- 답변형 게시판 만들 때 사용됨
select dno, ename
from employee
order by dno asc, ename desc ;

-- job : 오름차순 정렬, dno : job의 동일한 값에 대해서 dno를 오름차순, ename : dno의 동일한 값에 대해서 ename을 오름차순
select job, dno, ename
from employee
order by job asc, dno asc, ename asc;

select dno, job, ename
from employee
order by dno desc, job asc, ename desc;









