-- 서브쿼리
--> 쿼리문 안에 들어가는 쿼리문
--> 자유도가 굉장히 높음 (select, from, where절 모두 들어갈 수 있음
--> from 절 안에서의 사용을 권장하지 않음 (효율적으로 사용할 수 없기 때문)
--> 많이 쓰면 실행기간이 굉장히 길어질 수 있음

--where절에서 사용되는 서브쿼리문
--1. 단일행 서브쿼리
--ROW하나 COLUMN 하나로 이뤄져 있음
--> 이 값을 WHERE절에서 쓰기 위함 
SELECT SAL 
  FROM EMP 
 WHERE ENAME = 'JONES';
 
--JONES보다 많은 월급을 받는 직원들의 정보를 출력
--단점 쿼리문이 길어져서 가독성이 좋지 않음
--두단계를 한단계로 줄일 수 있음
SELECT *
  FROM EMP 
 WHERE SAL > (SELECT SAL
                FROM EMP
               WHERE ENAME = 'JONES');
             

--2.다중행 서브쿼리
--ROW 여러개, COLUMN 한개로 이루어진 쿼리
SELECT ENAME
  FROM EMP
 WHERE SAL > 2000;
--IN연산자 IN(안에 있는 친구들)
SELECT *
  FROM EMP
 WHERE SAL IN (SELECT MAX(SAL)
                 FROM EMP
                GROUP BY DEPTNO);
--ANY, SOME
--> 서브 쿼리문의 결과값이 하나라도 참이면 참으로 리턴한다.
--> 
SELECT *
  FROM EMP
 WHERE SAL = ANY(SELECT MAX(SAL)
                   FROM EMP
                  GROUP BY DEPTNO);
--> 등가 연산자는 잘 사용하지 않음
--> 범위 연산자 를 좀더 빈도있게 사용


--ALL
--> ALL 같은 경우는 등가 연산자와 같이 사용할 수 없음
SELECT *
  FROM EMP
 WHERE SAL > ALL(SELECT SAL
                   FROM EMP
                  WHERE DEPTNO = 30);
SELECT *
  FROM EMP
 WHERE SAL > (SELECT MAX(SAL)
                FROM EMP
               WHERE DEPTNO = 30);
                  
--> ALL 대신 MAX SAL을 써도 상관 없음

--ANY SOME ALL 함수의 경우 비교연산 시 MIN MAX등을 잘 활용하면 좀더 효율적으로 구성할 수 있다.