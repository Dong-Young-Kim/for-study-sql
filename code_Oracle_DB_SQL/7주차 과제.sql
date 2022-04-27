--Q1
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO AND 
       E.SAL > 2000;
       
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
 FROM EMP E JOIN DEPT D ON (D.DEPTNO = E.DEPTNO)
 WHERE SAL >= 2000;
 
 
 
--Q2
SELECT D.DEPTNO, D.DNAME,
       ROUND(AVG(E.SAL),0) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E, DEPT D 
 WHERE E.DEPTNO = D.DEPTNO
 GROUP BY D.DEPTNO, D.DNAME;
  
SELECT D.DEPTNO, D.DNAME,
       ROUND(AVG(E.SAL),0) AS AVG_SAL, MAX(E.SAL) AS MAX_SAL, MIN(E.SAL) AS MIN_SAL,
       COUNT(*) AS CNT
  FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
 GROUP BY D.DEPTNO, D.DNAME;
  
 
--Q3
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E, DEPT D 
 WHERE E.DEPTNO(+) = D.DEPTNO;
 
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
 FROM EMP E RIGHT OUTER JOIN DEPT D ON (D.DEPTNO = E.DEPTNO);



--Q4
SELECT D.DEPTNO, D.DNAME, 
        E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E1, EMP E2, DEPT D, SALGRADE S
 WHERE (E1.DEPTNO(+) = D.DEPTNO)
       AND (E1.MGR = E2.EMPNO(+))
       AND (E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+))
 ORDER BY E1.DEPTNO, E1.EMPNO;
 
 

SELECT D.DEPTNO, D.DNAME, 
       E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL, E1.DEPTNO,
       S.LOSAL, S.HISAL, S.GRADE,
       E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
  FROM EMP E1 RIGHT OUTER JOIN DEPT D ON(E1.DEPTNO = D.DEPTNO)
              LEFT OUTER JOIN EMP E2 ON(E1.MGR = E2.EMPNO)
              LEFT OUTER JOIN SALGRADE S ON(E1.SAL BETWEEN S.LOSAL AND S.HISAL)
 ORDER BY E1.DEPTNO, E1.EMPNO;
 
