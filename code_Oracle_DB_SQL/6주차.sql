--다중행 함수

/*
여러 컬럼에 대하어 반환하는 값이 하나인 함수

*/

SELECT SUM(SAL) FROM EMP;
SELECT SUM(SAL), SAL FROM EMP; --행 수가 다르므로 출력 불가
--단일 행으로 출력되는 칼럼과 다중행 함수는 같이 표기할 수 없으나, 다중행 하수를 여러개 명시하는 것은 가능하다.
SELECT SUM(SAL), AVG(SAL) FROM EMP;

--COUNT(셀 컴럼): 지정된 셀 값이 NULL이 아닌 친구의 개수를 세 줌
--어떤 테이블이든 널 조건에 해당하지 않고 개수를 셀 수 있기 때문에 가장 많이 사용되는 관용어구
SELECT COUNT(*) FROM EMP;

--널은 세지 않음
SELECT COUNT(COMM) FROM EMP;


--MAX, MIN : 최소 최대값을 구하는 함수
SELECT MAX(SAL) FROM EMP;
SELECT MIN(SAL) FROM EMP;


--AVG :평균 구하는 함수
SELECT ROUND(AVG(SAL),2) FROM EMP;


--GROUP BY 함수: 그루핑 해주는 함수
---> 기준이 되는 컬럼을 토대로 다중행 함수의 반환값을 출력하는 함수
--다중행 함수를 사용하지 않은 열은 그룹바이절에 명시하지 않으면 셀렉트 절에서 사용할 수 없음

SELECT  ROUND(AVG(SAL), 2), DEPTNO, JOB 
  FROM  EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;
--부서별로 평균 월급을 산정


--HAVING절 : 그루핑 한 후에 실행되는 WHERE절
--WHERE 절은 ROW하나하나에 따른 조건을 입력하지만, HAVING절은 그룹에 대한 조건을 명시
SELECT  ROUND(AVG(SAL), 2), DEPTNO
  FROM  EMP
GROUP BY    DEPTNO
HAVING      ROUND(AVG(SAL),2) > 2000
ORDER BY    DEPTNO;

SELECT  ROUND(AVG(SAL), 2), DEPTNO
  FROM  EMP
 WHERE  SAL > 2000
GROUP BY    DEPTNO
ORDER BY    DEPTNO;

--ROLL UP
--앞에 적힌 조건을 기준으로 다중행 함수에 다한 값을 반환한 뒤
--전체에 대한 다중행 검사 결과값을 반환한다
SELECT  ROUND(AVG(SAL), 2), DEPTNO, JOB
  FROM  EMP
GROUP BY ROLLUP (DEPTNO, JOB)
ORDER BY        DEPTNO;

--CUBE
-- ROLL UP + 뒤에 적힌 조건
SELECT  ROUND(AVG(SAL), 2), DEPTNO, JOB
  FROM  EMP
GROUP BY CUBE (DEPTNO, JOB)
ORDER BY       DEPTNO;


--JOIN
/*
외래키를 기준으로 테이블 간의 관계를 맺어주는 명령어.
관계형 데이터베이스의 꽃으로 무조건 알고 있어야 함.
DQL의 30%
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

--