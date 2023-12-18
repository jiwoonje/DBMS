DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE SALGRADE;

CREATE TABLE DEPARTMENT (
	DNO INT CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR(14),
	LOC VARCHAR(13)
) ;

CREATE TABLE EMPLOYEE (
	ENO INT CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR(10),
 	JOB   VARCHAR(9),
	MANAGER  INT,
	HIREDATE DATE,
	SALARY REAL,
	COMMISSION REAL,
	DNO INT CONSTRAINT FK_DNO REFERENCES DEPARTMENT
);
CREATE TABLE SALGRADE (
	GRADE INT,
	LOSAL INT,
	HISAL INT
);

INSERT INTO DEPARTMENT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPARTMENT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPARTMENT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPARTMENT VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO EMPLOYEE VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);
INSERT INTO EMPLOYEE VALUES
(7499, 'ALLEN', 'SALESMAN', 7698,'1981-02-20', 1600, 300, 30);
INSERT INTO EMPLOYEE VALUES
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30);
INSERT INTO EMPLOYEE VALUES
(7566, 'JONES', 'MANAGER', 7839,'1981-04-02', 2975, NULL, 20);
INSERT INTO EMPLOYEE VALUES
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30);
INSERT INTO EMPLOYEE VALUES
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30);
INSERT INTO EMPLOYEE VALUES
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10);
INSERT INTO EMPLOYEE VALUES
(7788, 'SCOTT', 'ANALYST', 7566, '1987-07-13', 3000, NULL, 20);
INSERT INTO EMPLOYEE VALUES
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10);
INSERT INTO EMPLOYEE VALUES
(7844, 'TURNER', 'SALESMAN',7698, '1981-09-08', 1500, 0, 30);
INSERT INTO EMPLOYEE VALUES
(7876, 'ADAMS', 'CLERK', 7788, '1987-07-13', 1100, NULL, 20);
INSERT INTO EMPLOYEE VALUES
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30);
INSERT INTO EMPLOYEE VALUES
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20);
INSERT INTO EMPLOYEE VALUES
(7934, 'MILLER', 'CLERK', 7782,'1982-01-23', 1300, NULL, 10);

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

COMMIT;

select * from DEPARTMENT;
select * from EMPLOYEE;
select * from SALGRADE;