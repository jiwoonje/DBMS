select *
from employee;

-- 1. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력 하시오. 
select SUBSTR(hiredate, 1,2) 입사연도, SUBSTR(hiredate, 4, 2) 입사월 from employee;

-- 2. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력 하시오.
select ename 사원
from employee
where SUBSTR(hiredate, 4,2)=04;

-- 3. MOD 함수를 사용하여 직속상관이 홀수인 사원만 출력하시오. 
select ename 사원
from employee
where MOD(MANAGER, 2)=1 ;

-- 4. MOD 함수를 사용하여 월급이 3의 배수인 사원들만 출력하세요.
select ename 사원
from employee
where MOD(salary, 3)=0;

-- 5. 입사한 년도는 2자리 (YY), 월은 (MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력 하시오. 
select ename 사원, to_CHAR(hiredate, 'YY') 입사연도, to_CHAR(hiredate, 'MON') 입사월, to_CHAR(hiredate, 'DY') 입사요일 from employee;

-- 6. 올해 몇 일이 지났는지 출력 하시오. 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형식을 일치 시키시오.
select round(sysdate-to_date('2023/01/01', 'YYYY-MM-DD')) 며칠 from dual;

-- 7. 자신이 태어난 날짜에서 현재까지 몇 일이 지났는지 출력 하세요. 
select round(sysdate-to_date('1992/02/11', 'YYYY-MM-DD')) 며칠 from dual;

-- 8. 자신이 태어난 날짜에서 현재까지 몇 개월이 지났는지 출력 하세요.
select round(months_between(sysdate, to_date('1992/02/11', 'YYYY-MM-DD'))) 몇개월 from dual;

-- 9. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 null 갑대신 0으로 출력 하시오.
select nvl(manager, 0) 상관번호
from employee;

-- 10.   사원번호,
   --   [사원번호 2자리만출력 나머지는 *가림 ] as "가린번호", 
   --   이름, 
   --    [이름의 첫자만 출력 총 네자리, 세자리는 * 가림] as "가린이름" 
select eno 사원번호, RPAD((SUBSTR(eno, 1, 2)), 4, '*') 가린번호, ename 이름, RPAD((SUBSTR(ename, 1, 1)), 4, '*') 가린이름
from employee;
   
-- 11.  주민번호:   를 출력하되 801210-1*******   출력 하도록 , 전화 번호 : 010-12******* dual 테이블 사용
select RPAD((SUBSTR('920211-2855555', 1, 8)), 14, '*') 주민번호, RPAD((SUBSTR('010-2991-8658', 1, 6)), 13, '*') 전화번호
from dual;
    
--12 자신의 생일에서 현재까지 몇개월 살았는지 ?  몇일 살았는지 출력   <== months_between ( 현재날짜, 생일)  : 개월수 
        -- sysdate - 생일 (date) 
select round(months_between(sysdate, to_date('1992/02/11', 'YYYY-MM-DD'))) 몇개월, round(sysdate-to_date('1992/02/11', 'YYYY-MM-DD')) 며칠 from dual;

--13.  employee 테이블에서 입사일로부터 2050년 12월 24 일까지의 날짜(일수)  를 출력 
select round(to_date('2050/12/24', 'YYYY-MM-DD')-hiredate) 며칠
from employee;
