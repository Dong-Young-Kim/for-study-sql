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

--EXIST 연산자
--> 하나라도 참이면 전부 참이라고 만듦

--FROM절에 사용하는 서브쿼리
--> 서브쿼리는 별칭을 꼭 지정해 주어야
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
       (SELECT * FROM DEPT) D
 WHERE E10.DEPTNO = D.DEPTNO;
 
 --WITH절
 -->서브쿼리문의 정리를 위해 서브쿼리문과 일반 테이블을 구별해주는 역할
  WITH E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
       D   AS(SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM E10, D
 WHERE E10.DEPTNO = D.DEPTNO;
 
 
--SELECT절에 사용되는 서브쿼리
--스칼라 서브쿼리
--이러한 조인문은 잘 사용되지 않음
--이렇게 할 수도 있구나
SELECT EMPNO, ENAME, JOB, SAL,
       (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
       (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
  FROM EMP E;
  
  
  
  
  
--데이터 조작어 (DML)
--> 데이터의 삽입(INSERT) 삭제(DELETE) 수정(UPDATE)

--데이터 정의어 (DDL)
-->테이블의 생성(CREATE), 삭제(DROP), 수정(ALTER)

--테이블의 생성
--테이블의 기초 자료를 복사하고자 할 때 AS키워드를 사용한다.
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    

SELECT * FROM DEPT_TEMP;





--기초 자료없이 빈 테이블을 만들고 싶을 때
CREATE TABLE MYTABLE
(
    HUM_NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL
    
);
--UNIQUE        중복을 허용하지 않는 키워드
--NOT NULL      널값을 허용하지 않는 키워드
--PRIMARY KEY   기본키 임을 지정하는 키워드

SELECT * FROM MYTABLE;

--테이터의 삽입
INSERT INTO MYTABLE(HUM_NO, NAME) VALUES(1,'김동영');
INSERT INTO MYTABLE(HUM_NO, NAME) VALUES(2,'양태영');


--테이블의 삭제
DROP TABLE MYTABLE;
DROP TABLE DEPT_TEMP;


--테이블의 수정
--ALTER
--COLUMN을 추가
ALTER TABLE MYTABLE
  ADD PHONE VARCHAR2(12) NOT NULL UNIQUE;
--COLUMN의 이름을 변경
ALTER TABLE MYTABLE
RENAME COLUMN PHONE TO HP;
--COLUMN의 자료형을 변경
ALTER TABLE MYTABLE
MODIFY HP NUMBER(12);

DESC MYTABLE;

--데이터의 수정
--> WHERE 절을 사용하지 않으면 일괄적으로 변경되므로 주의
UPDATE MYTABLE SET NAME = '오라클', HUM_NO = 3 WHERE HUM_NO = 2;


--데이터의 삭제
-->조건에 맞는 열을 찾아 삭제
DELETE MYTABLE WHERE HUM_NO = 3;


--262,263

--시퀀스, GRANT 권한설정, VIEW, 
