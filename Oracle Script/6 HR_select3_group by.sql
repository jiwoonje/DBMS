
/* 그룹함수 : group by, having

    select 컬럼명
    from 테이블
    where 조건
    group by 컬럼명 [동일한 값을 그룹핑]
    having 조건 [group by 한 결과값의 조건]
    order by 컬럼명 asc [desc]
*/

/* 집계 함수 : number 타입의 컬럼에 적용
    SUM - 컬럼의 모든 값의 합
    AVG - 컬럼의 모든 값의 평균
    MAX - 컬럼의 최대값
    MIN - 컬럼의 최소값
    COUNT (*) - 그룹핑 된 레코드 수 출력
    
    주의 : 단일 행으로 출력되기 때문에 다른 컬럼과 사용시 오류 발생
        단, group by 앞에 groupping 된 컬럼 사용 불가능 (?)
*/

desc employee;

select SUM(salary), ename   -- 오류 발생
from employee;

-- 컬럼에 함수 사용
-- 월급 (salary)
select SUM(salary) 합계, round(AVG(salary)) 평균, MAX(salary) 최대값, MIN(salary) 최소값, COUNT(*) 계산된레코드수
from employee;

-- 집계 함수는 NULL을 자동으로 처리함
select commission
from employee;

-- 보너스 (commission)
select SUM(commission) 합계, round(AVG(commission)) 평균, MAX(commission) 최대값, MIN(commission) 최소값, COUNT(*) 계산된레코드수
from employee;

-- 부서별로 월급의 합계, 평균, 최대, 최소, 그룹핑 개수 출력
select
from employee
group by dno        -- DNO 컬럼의 동일한 값을 그룹핑해서 집계 함수를 처리함

select salary, dno
from employee
order by dno asc;

select dno 부서번호, SUM(salary) 합계, round(AVG(salary)) 평균, MAX(salary) 최대값, MIN(salary) 최소값, count(*) 그룹핑된수
from employee
group by dno;

-- 직책별로 월급의 합계, 평균, 최대, 최소, 그룹핑 개수 출력
select job 직책, sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대값, min(salary) 최소값, count(*) 그룹핑된수
from employee
group by job;


/*
    group by 절에서 where [조건] vs having [조건]
        where [조건] : group by 하기 전에 조건을 가져옴        별칭 이름을 사용할 수 없다.
        having [조건] : group by 해서 나온 결과에 대한 조건    별칭 이름을 사용할 수 없다.
        
        order by 컬럼명 asc(desc) : 별칭 이름을 사용 가능
*/

-- 직급별로 월급의 합계, 평균, 최대, 최소, 그룹핑 된 수를 출력하되 부서번호 20은 제외하고, 부서별로 평균이 2000 이상인 내용만 출력
    -- 평균을 desc 출력
select job 직급, sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대, min(salary) 최소, count(*) 그룹핑된수
from employee
where dno!=20
group by job
having avg(salary)>2000
order by 합계 desc;

-- group by 절에서 컬럼이 2개 이상. 두 컬럼에 걸쳐서 동일한 내용을 그룹핑함
    -- job, dno
    
select dno, job, sum(salary) 합한값, count(*)
from employee
group by job, dno
order by job asc;

-- 각 직책에 대해서 월급의 합계, 평균, 최대, 최소, 카운트수를 출력하되, 81년 입사한 사원만 적용
-- 월급의 평균이 1500만원 이상인 것만 출력. 평균을 내림차순 정렬

select job 직책, sum(salary) 합계, round(avg(salary)) 평균, max(salary) 최대, min(salary) 최소, count(*) 카운트수
from employee
where hiredate like '81%'
group by job
having sum(salary) >= 1500
order by 평균 desc;


/*
    group by 절에서 사용되는 키워드
        rollup : group by 컬럼 <== 결과 마지막 라인에 전체 결과도 한번 출력
        cube : 그룹핑 마지막 라인에 결과 출력. 마지막 라인에 전체 결과도 세부적으로 출력
*/

-- 1. rollup과 cube를 사용하지 않는 경우 : 그룹핑한 결과만 출력
    select dno, job, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by dno, job
    order by dno asc;
    
    select dno, job
    from employee
    order by dno asc;

-- 2. rollup을 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력
    select dno, job, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by rollup(dno, job)
    order by dno asc;

    select job, dno, count(*), sum(salary), round(avg(salary), 2), max(salary), min(salary)
    from employee
    group by rollup(job, dno)
    order by job asc;
    
-- 3. cube를 사용하는 경우 : 그룹핑한 결과 출력, 전체 내용도 출력, 세부 사항까지 출력
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
    SubQuery : Select 문 내의 select 쿼리 [sub query]. 여러번의 작업을 한 구문에서 처리
        - where 절 내에서 많이 사용됨
*/

-- ename[사원이름]이 SCOTT인 사원의 직책[JOB]과 같은 사원들을 출력. 쿼리가 2번 필요함
    -- 1. SCOTT 사원의 직책을 알아오는 쿼리
    select job
    from employee
    where ename = 'SCOTT';
    
    -- 2. 알아온 직책을 조건으로 해당하는 사원들을 출력
    select ename
    from employee
    where job = 'ANALYST';
    
    -- SubQuery를 써서 하나의 쿼리로 만들기
    select ename, job
    from employee
    where job = (select job from employee where ename = 'SCOTT');
    
-- SCOTT과 ALLEN 의 직책에 해당되지 않는 사원들을 모두 출력
    -- 1. scott의 직책을 출력하는 쿼리
    -- 2. allen의 직책을 출력하는 쿼리
    -- 3. where job not in ('scott의직책', 'allen 직책')

    -- 1. scott의 직책을 출력하는 쿼리
    select job from employee where ename = 'SCOTT'

    -- 2. allen의 직책을 출력하는 쿼리
    select job from employee where ename = 'ALLEN'
 
    -- 3. SCOTT과 ALLEN 의 직책에 해당되지 않는 사원들을 모두 출력
    select ename.job
    from employee
    where job not in ('ANALIST', 'SALESMAN');

    -- SubQuery로 한 라인으로 출력
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

-- 'SCOTT' 보다 많은 월급을 받는 사원들 정보, 월급을 출력
select ename 사원, salary 월급
from employee
where salary >(select salary from employee where ename = 'SCOTT')

select * from employee
order by salary desc;

-- 최소 급여를 받는 사원의 이름, 담당업무, 급여 출력
select ename, job, salary
from employee
where salary = (select min(salary) from employee);

-- 부서별로 최소 급여를 받는 사원정보의 이름, 직책, 월급을 출력   : 힌트 : group by, dno, min, in 키워드
select salary, dno, ename
from employee
order by dno asc, salary desc;

select ename 이름, job 직책, salary 월급
from employee
where salary in (
    select min(salary)
    from employee
    group by dno
);

-- 각 부서의 최소 급여가 30번 부서의 최소 급여보다 큰 부서를 출력
select dno 부서
from employee
where min(salary) > (
    select min(salary)
    from employee
    group by dno
);
    
select dno, count(*), min(salary) 부서별최소월급
from employee
group by dno                -- 부서번호 동일한 값을 그룹핑
having min(salary) > (      -- 서브쿼리 : 30번 부서의 최소 월급
    select min(salary)
    from employee
    where dno = 30
);






