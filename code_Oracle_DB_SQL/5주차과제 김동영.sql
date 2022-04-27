--175P Q3
SELECT  EMPNO, ENAME, HIREDATE,
        TO_CHAR(NEXT_DAY (ADD_MONTHS(HIREDATE, 3),'월요일'), 'YYYY-MM-DD') AS R_JOB,
        DECODE(COMM,
               NULL, 'N/A',
               COMM) AS COMM       
  FROM  EMP;
  
--Q3 NVL2 함수로
SELECT  EMPNO, ENAME, HIREDATE,
        TO_CHAR(NEXT_DAY (ADD_MONTHS(HIREDATE, 3),'월요일'), 'YYYY-MM-DD') AS R_JOB,
        NVL2(COMM,TO_CHAR(COMM),'N/A') AS COMM --NVL2에서 출력되는 형식 맞춰줘야..
        FROM  EMP;
  
--Q4
SELECT  EMPNO, ENAME, MGR,
  CASE  WHEN MGR IS NULL            THEN 0000
        WHEN SUBSTR(MGR, 1, 2) = 75 THEN 5555
        WHEN SUBSTR(MGR, 1, 2) = 76 THEN 6666
        WHEN SUBSTR(MGR, 1, 2) = 77 THEN 7777
        WHEN SUBSTR(MGR, 1, 2) = 78 THEN 8888
        ELSE                        MGR
   END  AS CHG_MGR
  FROM  EMP;