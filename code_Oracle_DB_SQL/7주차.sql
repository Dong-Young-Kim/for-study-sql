--조인
/*
여러 테이블을 한 키(외래키) 기준으로 묶는 것

집합 연산자와 두 테이블을 붙인다는 데에서 유사하나
집합 연산자는 앞에 명시된 컬럼에 따라 컬럼이 좌우되고
어떤 자료인지 잘 모를 수 있다는 데에서 단점이 있다.
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

--조인의 기본 형식(오라클에만 해당)
SELECT * FROM EMP, DEPT
 WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT EMPNO, ENAME, JOB, DNAME, LOC
  FROM EMP ,DEPT
 WHERE EMP.DEPTNO = DEPT.DEPTNO;
 --EMP와 DEPT의 DEPTNO가 서로 매칭되는 경우에만 출력하기
 
--별칭 지정하기
SELECT * FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO AND
       SAL > 3000;
       
--등가조인 : WHERE 절에서 바로 매칭시킬 수 있는 경우

--비등가조인: 범위를 저정할 때 많이 사용, 속한 범위를 기준으로 다른 테이블과 매칭시키고자 할때
SELECT * FROM SALGRADE;

SELECT *
  FROM EMP E,SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--셀프조인(자체조인): 자기 테이블 내에서 서로 합치고 싶을 때
--특수한 경우에 사용하나 의외로 사용빈도가 높음
--자신의 테이블 안에 왜래키가 있는 경우
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS 상사번호, E2.ENAME AS 상사이름
  FROM EMP E1, EMP E2 --E2는 상사기준, E1은 부하기준 
 WHERE E1.MGR = E2.EMPNO;
 
 
--외부조인: 널 값을 출력해주는 조인 방식
--좌측 외부조인과 우측 외부조인으로 나뉨
--좌측 외부조인 : 좌측 외부조인을 기준으로 우측에 NULL이 있을 때 출력
--(+)기호를 이용하여 기준 테이블을 정할 수 있음 --> 오라클 고유 문법
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS 상사번호, E2.ENAME AS 상사이름
  FROM EMP E1, EMP E2 --E2는 상사기준, E1은 부하기준 
 WHERE E1.MGR = E2.EMPNO(+); --KING이 나옴

--우측 외부조인: 우측 외부조인을 기준으로 좌측에 NULL이 있을 때 출력
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS 상사번호, E2.ENAME AS 상사이름
  FROM EMP E1, EMP E2 --E2는 상사기준, E1은 부하기준 
 WHERE E1.MGR(+) = E2.EMPNO; --부하가 없는 사람이 나옴
 
 
--232p : SQL99표준문법 이 경우는 모든 DBMS에서 사용할 수 있는 문법

--이름이 같은 컬럼을 찾은 후 자동으로 연결
--WHERE절 사용하는 게 편할 수 있지만 알아두는게 좋음
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
  FROM EMP E NATURAL JOIN DEPT D
 ORDER BY DEPTNO, E.EMPNO;
       
--똑같이 등가조인하나 겹치는 컬럼을 명시해야 함
--겹치는 컬럼이 2개 이상일 때 사용  
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC      
  FROM EMP E JOIN DEPT D USING (DEPTNO)
 WHERE SAL >= 3000;
 
--테이블 1이름 JOIN 테이블 2이름 ON (조건식)
--오라클과 유사하게 조인을 할 수 있음
--> 비등가 조인 셀프조인도 가능
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC  
  FROM EMP E JOIN DEPT D ON (D.DEPTNO = E.DEPTNO)
  WHERE SAL >= 3000;
  
  
  
--좌측 외부조인 SQL99
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS 상사번호, E2.ENAME AS 상사이름
  FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);
--  FROM EMP E1, EMP E2 --E2는 상사기준, E1은 부하기준 
-- WHERE E1.MGR = E2.EMPNO(+); --KING이 나옴

--전체 외부조인
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS 상사번호, E2.ENAME AS 상사이름
  FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);