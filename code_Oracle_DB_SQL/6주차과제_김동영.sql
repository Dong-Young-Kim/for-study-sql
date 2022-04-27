--Q1
SELECT  DEPTNO,
        ROUND(AVG(SAL),0) AS AVG_SAL,
        ROUND(MAX(SAL),0) AS MAX_SAL,
        ROUND(MIN(SAL),0) AS MIN_SAL,
        COUNT (*)         AS CNT
  FROM  EMP
GROUP BY DEPTNO;

SELECT  DEPTNO,
        ROUND(AVG(SAL),0) AS AVG_SAL,
        MAX(SAL) AS MAX_SAL,
        MIN(SAL) AS MIN_SAL,
        COUNT (*)         AS CNT
  FROM  EMP
GROUP BY DEPTNO;


--Q2
SELECT  JOB,
        COUNT(*)
  FROM  EMP
GROUP BY JOB
HAVING   COUNT(*) >= 3;


--Q3
SELECT  TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        DEPTNO,
        COUNT(*)                  AS CNT
  FROM  EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO;

SELECT  TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        DEPTNO,
        COUNT(*)                  AS CNT
  FROM  EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDRR BY TO_CHAR(HIREDATE, 'YYYY');


--Q4
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM,
       COUNT(*)             AS CNT
  FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');


--Q5
SELECT  DEPTNO,
        TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
        COUNT(*)                  AS CNT,
        MAX(SAL)                  AS MAX_SAL,
        SUM(SAL)                  AS SUM_SAL,
        AVG(SAL)                  AS AVG_SAL
  FROM  EMP
GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'))