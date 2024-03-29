--4���� ����

--Q1_1
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO, 1, 2), LENGTH(EMPNO), '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME, 1, 1), LENGTH(ENAME), '*') AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME) >= 5 
   AND LENGTH(ENAME) < 6;
   
--Q1_2
SELECT EMPNO,
       CONCAT(SUBSTR(EMPNO, 1, 2), '**') AS MASKING_EMPNO,
       ENAME,
       CONCAT(SUBSTR(ENAME, 1, 1), '****') AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME) >= 5 
   AND LENGTH(ENAME) < 6;
   
--Q1_3
SELECT EMPNO,
       SUBSTR(EMPNO, 1, 2) || '**'  AS MASKING_EMPNO,
       ENAME,
       SUBSTR(ENAME, 1, 1) || '****'  AS MASKING_ENAME
  FROM EMP
 WHERE LENGTH(ENAME) >= 5 
   AND LENGTH(ENAME) < 6;
   
--Q2
SELECT EMPNO,
       ENAME,
       SAL,
       TRUNC(SAL / 21.5, 2) AS DAY_PAY,
       ROUND(SAL/ 21.5 / 8, 1) AS TIME_PAY
  FROM EMP;
  
  
--Q3
SELECT EMPNO,
       ENAME,
       '19' || REPLACE(HIREDATE, '/', '-') AS HIREDATE
  FROM EMP;
  