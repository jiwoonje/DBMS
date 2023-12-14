
/*
    Oracle의 다양한 함수 사용하기 : 인풋 == 기능 ==> 결과
    1. 문자를 처리하는 함수
    2. 숫자를 처리하는 함수
    3. 날짜를 처리하는 함수
    4. 변환 함수
    5. 일반 함수
*/

-- 1. 문자를 처리하는 함수
    -- UPPER : 소문자를 대문자로 변환해주는 함수
    -- LOWER : 대문자를 소문자로 변환해주는 함수
    -- INITCAP : 첫 글자만 대문자로 변해주는 함수
    -- LENGTH : 글자수를 반환 (영문:1byte, 한글:1byte)
    -- LENGTHB : 글자수를 반환 (영문:1byte, 한글:3byte)
    -- CONCAT : 문자열을 연결해주는 함수
    -- SUBSTR : 글자를 잘라오는 함수
    -- INSTR : 특정 문자의 위치값을 출력
    -- LPAD : 글자 자릿수를 입력 받아서 나머지는 특정 기호로 채움 (왼쪽)
    -- RPAD : 글자 자릿수를 입력 받아서 나머지는 특정 기호로 채움 (오른쪽)
    -- RTRIM : 오른쪽의 공백 제거
    -- LTRIM : 왼쪽의 공백 제거
    
    -- UPPER
    select UPPER ('Oracle') from dual;
                                -- dual : 가상의 테이블
    select * from employee;
    select ename as 원본이름, UPPER(ename) 대문자이름, LOWER(ename) 소문자이름, INITCAP(ename) 첫자만대문자 from employee;
    
    -- 검색이 안 됨 : 컬럼의 값은 대소문자를 구분한다
    select *
    from employee
    where ename = "smith";
    
    select *
    from employee
    where ename = UPPER('smith');
    
    select LENGTH ('Oracle mania') from dual;     -- 12
    select LENGTH ('오라클 매니아') from dual;      -- 7
    
    select LENGTHB ('Oracle mania') from dual;     -- 12
    select LENGTHB ('오라클 매니아') from dual;      -- 19
    
    select ename 원본, LENGTH(ename) 글자수 from employee;
    
    -- CONCAT : 문자열을 연결해주는 함수
        -- || 컬럼을 연결해주는 연산자
    select 'Oracle', 'Mania' from dual;
    
    select CONCAT ('Oracle', 'Mania') as 연결됨 from dual;
    
    select CONCAT (ename, job) from employee;
    
    select ename || job from employee;
    
    select ename ||' '|| job 이름과직책 from employee;
    
    -- SUBSTR : 글자를 잘라오는 함수. SUBSTR (컬럼, 4,3) <== 컬럼에 있는 문자열 중 4번째 자리에서 3글자를 잘라라
    select SUBSTR ('Oracle Mania', 4,3) from dual;
    
    select ename 원본이름, SUBSTR (ename, 2,3) 잘라온이름 from employee;
    
    select * from employee;
        -- employee 테이블에서 이름, 입사월만 출력하세요 SUBSTR 사용
        select ename 이름, SUBSTR (hiredate, 4,2) 입사월 from employee;
    
        -- employee 테이블에서 이름, 입사월만 출력하세요 SUBSTR 사용. + 2월에 입사한 사원만 출력
        select ename 이름, SUBSTR (hiredate, 4,2) 입사월
        from employee
        where hiredate like '___02%';
        
        select ename 이름, SUBSTR (hiredate, 4,2) 입사월
        from employee
        where 입사월 = '02';       -- 원본 컬럼이 아니라서 오류 발생함
        
        select ename 이름, SUBSTR (hiredate, 4,2) 입사월
        from employee
        where SUBSTR (hiredate, 4,2) = '02';
        
        -- employee 테이블에서 81년도에 입사한 사원의 이름, 입사년, 입사월, 입사일 출력
        select ename 이름, SUBSTR (hiredate, 1,2) 입사년, SUBSTR (hiredate, 4,2) 입사월, SUBSTR (hiredate, 7,2) 입사일
        from employee
        where SUBSTR (hiredate,1,2) = '81' ;
        
    -- INSTR : 특정 문자의 위치값(index)을 출력. index는 1부터
        -- INSTR(컬럼명, 'A') : 컬럼에서 문자열 중에 'A'가 있는 index 번호를 출력
        select INSTR('Oracle Mania', 'a') from dual;    -- 3
        
        select ename 이름, INSTR(ename, 'M') as M의위치 from employee;
        
        -- INSTR(컬럼명, 'A', 4) : index 4번부터 오른쪽 문자열 중에 'A'가 있는 index 번호를 출력
        select INSTR('Oracle Mania', 'a', 4) from dual;    -- 9
                       
    -- LPAD : 글자 자릿수를 입력 받아서 나머지는 특정 기호로 채움 (왼쪽)
    -- RPAD : 글자 자릿수를 입력 받아서 나머지는 특정 기호로 채움 (오른쪽)
        -- LPAD(컬럼명, 늘릴 자릿수, '*') : 공백자리를 특수문자로 치환 (왼쪽)
        select '770824-1' 주민번호, LPAD ('770824-1', 20, '*') from dual;
        
        -- RPAD(컬럼명, 늘릴 자릿수, '*') : 공백자리를 특수문자로 치환 (오쪽)
        select '770824-1' 주민번호, RPAD ('770824-1', 20, '*') from dual;
        
        -- 이름 출력, hiredate 칼럼을 년도만 출력하고 나머지는 *로 출력. SUBSTR, RPAD 사용
        select ename 이름, RPAD (SUBSTR (hiredate, 1, 2), 14, '*') 입사년도
        from employee;
        
    -- 공백 제거
        -- RTRIM : 오른쪽의 공백 제거
        -- LTRIM : 왼쪽의 공백 제거
        -- TRIM : 양쪽 모든 공백 제거
        select '     Oracle Mania     ' as 원본,
            LTRIM ('     Oracle Mania     ') 왼쪽공백제거,
            RTRIM ('     Oracle Mania     ') 오른쪽공백제거,
            TRIM ('     Oracle Mania     ') 모든공백제거 from dual;
        
        select *
        from employee
        where ename = TRIM ('     SMITH');
        
        -- 앞뒤 공백 제거 후 값을 대문자로 변환
        select *
        from employee
        where ename = UPPER (TRIM ('   smith'   )) ;
            
-- 2. 숫자를 처리하는 함수
    -- ROUND : 반올림. 5이상 올림, 5미만 버림
    /*
        ROUND(실수) : 소숫점 뒷자리에서 반올림
        ROUNG(실수, 소숫점자릿수) : 지정한 자리
            - 소숫점 자리가 양수일 때 : 소숫점 기준으로 오른쪽으로 이동해서, 그 다음 자리에서 반올림
            - 소숫점 자리가 음수일 때 : 소숫점 기준으로 왼쪽으로 이동해서, 그 자리에서 반올림
    */
    select 98.7654 as 원본,                   -- 98.7654
        round(98.7654) as R1,                -- 99
        round(98.7654, 2) as R2,             -- 98.77
        round(98.7654, -1) as R3,            -- 100
        round(98.7654, -2) as R4,            -- 100
        round(98.7654, -3) as R5            -- 0
    from dual;
        
        -- 근로소득세 : 월급의 3.3% (salary * 0.033)
        select salary 월급, salary*0.033 근로소득세
        from employee;
    
        select salary 월급, salary*0.033 근로소득세, round(salary*0.033) R1, round(salary*0.033, 2) R2, round(salary-(salary*0.033)) 실수령액
        from employee;
    
    -- TRUNC : 특정 자리수 이하 잘라내기. 날짜를 연산 할 수 있음.
    select trunc(98.7654) T1,
        trunc(98.7654, 2) T2,
        trunc(98.7654, -1) T3,
        trunc(98.7654, -2) T4
    from dual;
         select trunc(98.7654)
         from dual;
    -- MOD : 나머지만 출력
        -- 몫만 출력할 때는 나누기 한 후 trunc 사용
    select MOD(5,2) 나머지, TRUNC(31/2) 몫
    from dual;
    
-- 3. 날짜를 처리하는 함수
    -- sysdate : 현재 시스템의 날짜를 출력
    -- months_between : 두 날짜 사이의 개월수를 출력
    -- add_months : 특정 날짜에서 개월수를 더해서 출력
    -- next_day : 특정 날짜에서 다음에 초래하는 요일을 인자로 받아서 도래하는 날짜를 출력
    -- last_day : 달의 마지막 날짜를 출력
    -- round(날짜) : 날짜를 반올림. 15일 이상 올림, 14일 이하 버림.
    -- trunc(날짜) : 날짜를 잘라냄

    -- sysdate
    select sysdate from dual;       -- 23/12/07
    
        -- 날짜에 연산이 가능
        select sysdate 현재날짜, sysdate-1 어제날짜, sysdate+1 내일날짜 from dual;
        
        -- 오늘에서 100일전 날짜는?
        select sysdate-100 "100일 전 날짜" from dual;
        
        -- 오늘부터 1000일후 날짜는?
        select sysdate+1000 "1000일 후 날짜" from dual;
        
        -- 입사일에서 오늘까지 총 근무일수?
        select ename 이름, round(sysdate-hiredate) 총근무일수 from employee;
        
        -- 입사일에서 1000일 지난 시점의 날짜를 출력
        select ename 이름, hiredate 입사날짜, hiredate+1000 "+1000일" from employee;
        
        -- 특정 날짜에서 월만 출력. TRUNC(날짜, 'MONTH') / ROUND(날짜, 'MONTH') 
        select hiredate 원본날짜, TRUNC(hiredate, 'MONTH'), round(hiredate, 'MONTH') from employee;
        
    -- months_between
        -- 현재까지 근무 개월수 출력 : months_between(날짜, 날짜)
        select ename 이름, hiredate 입사일, months_between(sysdate, hiredate) 근무개월수 from employee;
    
    -- add_months
        -- 오늘 날짜에서 100개월 이후의 날짜 
        select sysdate 오늘날짜, add_months(sysdate, 100) "100개월후", sysdate+100 "100일후" from dual;
    
    -- next_day
    
    -- last_day : 해당 월의 마지막 날짜를 출력
    select last_day(sysdate) from dual;
        -- 모든 사원의 입사한 월의 마지막 날짜가 무엇인지 출력
        select hiredate 입사날짜, last_day(hiredate) 마지막날짜 from employee;
                
-- 4. 변환 함수
    -- TO_CHAR : 날짜, 숫자 ===> 문자
    -- TO_DATE : 문자 ===> 날짜
    -- TO_NUMBER : 문자 ===> 숫자

    -- TO_CHAR 1. 날짜 ===> 문자
    select sysdate from dual;       -- 23/12/07
    select TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:ss') from dual;
    select hiredate 입사날짜, TO_CHAR(hiredate, 'YYYY"년" MM"월" DD"일" HH:MI:ss') 입사날짜2 from employee;
    select hiredate 입사날짜, TO_CHAR(hiredate, 'YYYY-MM-DD MON DAY DY HH:MI:ss') 입사날짜2 from employee;
    
    -- TO_CHAR 2. 숫자 ===> 문자
        -- 0 : 자릿수를 처리함. 자릿수가 많으면 0으로 처리됨
        -- 9 : 자릿수를 처리함. 자릿수가 많으면 공백으로 처리됨
        -- L : 각 지역의 통화를 기호로 표시함
        -- . : 소수점으로 처리함
        -- , : 천 단위 구분자
        select TO_CHAR(9876, '000,000') from dual;
        select TO_CHAR(9876, '999,999') from dual;
        select TO_CHAR(9876, 'L000,000') from dual;
        select TO_CHAR(9876, 'L999,999') from dual;
            -- 월급을 그 나라의 통화기호로 천 단위로 출력
            select salary 월급, TO_CHAR(salary, 'L999,999') from employee;
        
    -- TO_DATE 문자 ===> 날짜
    select to_date('1998-10-10', 'YYYY-MM-DD') from dual;
        -- 1981년 1월 1일에서 100일 지난 시점의 날짜를 출력. 100개월 지난 시점의 날짜 출력
        select to_date('1981/01/01', 'YYYY-MM-DD') 현재, to_date('1981/01/01', 'YYYY-MM-DD')+100 "100일후",
            add_months(to_date('1981/01/01', 'YYYY-MM-DD'), 100) "100개월후" from dual;
        -- 자신의 생일에서 몇 개월 지났는지? 며칠 지났는지?
        select to_date('1992/02/11', 'YYYY-MM-DD') 태어난날, round(months_between(sysdate, to_date('1992/02/11', 'YYYY-MM-DD'))) 몇개월,
            round(sysdate-to_date('1992/02/11', 'YYYY-MM-DD')) 며칠 from dual;
        -- employee 테이블에서, 입사일에서 2050년 12월 24일까지 며칠인지?
        select ename 이름, hiredate 입사일, round(to_date('2050/12/24', 'YYYY-MM-DD')-hiredate) 며칠 from employee;
    
    -- TO_NUMBER
    
    -- 5. 일반 함수