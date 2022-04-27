--8���� ����
--Q1
SELECT JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
  FROM EMP E, DEPT D
 WHERE D.DEPTNO = E.DEPTNO AND
       E.JOB = (SELECT JOB 
                  FROM EMP 
                 WHERE ENAME = 'ALLEN');
       
--Q2
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
  FROM EMP E, DEPT D, SALGRADE S
 WHERE D.DEPTNO = E.DEPTNO AND
       E.SAL BETWEEN S.LOSAL AND S.HISAL AND
       E.SAL > (SELECT AVG(SAL)
                  FROM EMP)
 ORDER BY E.SAL DESC, E.EMPNO;
 
--Q3
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
       AND E.DEPTNO = 10
       AND E.JOB != ALL(SELECT JOB
                             FROM EMP
                            WHERE DEPTNO = 30);
                            
--Q4
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
       AND E.SAL > (SELECT MAX(SAL)
                      FROM EMP
                     WHERE JOB = 'SALESMAN')
 ORDER BY E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
  FROM EMP E, SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
       AND E.SAL > ALL(SELECT SAL
                      FROM EMP
                     WHERE JOB = 'SALESMAN')
 ORDER BY E.EMPNO                     ;
