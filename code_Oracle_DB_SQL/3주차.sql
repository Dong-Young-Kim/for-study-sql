select * from emp;

/*
BETWEEN A AND B
NOT BETWEEN A AND B
LIKE : -와 같은 -처럼 검색할 때 많이 사용, 와일드카드
NOT연산자의 활영
IS NULL
집합 연산자
*/


-- BETWEEN
SELECT * FROM EMP
WHERE SAL <= 3000 AND SAL >= 1000;

SELECT * FROM EMP
WHERE SAL BETWEEN 1000 AND 3000;



--NOT BETWEEN
SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;



--LIKE : -와 같은 -처럼 검색할 때 많이 사용, 와일드카드*****
-- 게시글 조회하는 기능을 만들거나, 생년월일을 검색할때 많이 사용
-- 문자열 검색할 때 굉장히 많이 사용
/*
와일드카드
(%)몇개의 글자인지 상관없이 아무글자
(%S%) 해당 문자가 포함된 모든 글자
(_) 어떤 글자든 한 글자만
*/


SELECT * 
  FROM EMP
 WHERE ename  LIKE '%S%';

SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '_A%';

--35분


--IS NULL 연산자
--NULL인지 아닌지 구분하는 연산자 / NULL아무 값도 저장되어있지 않은 값, 연산 수행 불가

SELECT *
  FROM EMP
 WHERE COMM = NULL;
-- 아무련 결과도 나오지 않음
--연산 자체가 불가능하기 때문에 / 숫자랑 NULL은 같다 아니다 연산도 불가능
SELECT *
  FROM EMP
 WHERE COMM IS NULL;
 
 
 
 --집합 연산자 : 세로로 붙여주는 연산자,, 합집합
SELECT EMPNO,ENAME, JOB
  FROM EMP
 UNION
SELECT * FROM DEPT;
--열의 개수와 자료형이 같아야 출력 가능
--주로 조인을 사용
--유니온은 잘 사용하지 않음

--INTERSECT 교집합 ,, 일치하는 것만 출력