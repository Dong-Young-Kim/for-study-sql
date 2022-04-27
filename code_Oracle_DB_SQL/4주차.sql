-- 4주차 수업

/*
함수란: 입력을 넣으면 출력이 나오는 친구

오라클이 갖고 있는 함수 존재 : 내장함수

다중행 함수와 단일행 함수가 존재

""단일행 함수에 대해서""
결과로 출력되는 값이 여러개

""다중행함수에 대해서""
여러개(컬럼 전체이거나 컬럼일부)의 매게변수가 필요하며, 결과로 출력되는 값이 하나
*/

--upper, lower, initcap
/*
upper : 대문자로
lower : 소문자로
initcap : 첫글자를 대문자로
UPPER LOWER은 LIKE와 와일드카드와 함께 검색에 많이 사용되는 함수
*/

SELECT UPPER(ENAME) FROM EMP;
SELECT LOWER(ENAME) FROM EMP;
SELECT INITCAP(ENAME) FROM EMP;

SELECT *
  FROM EMP
 WHERE LOWER(ENAME) LIKE '%scott%';
 
/* 개시글 검색 예제
    SELECT TITLE, CONTENT
      FROM BOARD
     WHERE UPPER(TITLE) LIKE '%사용자 입력값%' --> 자바나 파이썬 같은 메인언어에서 대문자로 변환한 값
        OR UPPER(CONTENT) LIKE '%사용자 입력값%' 
*/
 
--dual 계정, dual 테이블
/*
임시계정
오라클에서만 사용이 가능
*/ 

SELECT 1111, 2222 AS NAME
  FROM DUAL;
  
-- LENGTH 함수
/*
문자열의 길이를 반환하는 함수
독자적으로 쓰기기 보다 더룬 험수와 같이 쓰임
*/

SELECT ENAME, LENGTH(ENAME)
  FROM EMP;
  

SELECT ENAME, LENGTH(ENAME)
  FROM EMP
 WHERE LENGTH(ENAME) >= 6;
 
 
 
--SUBSTR
/*
모든 문자열을 반환하는 언어라면 다 갖고있는 함수.
특정 문자열을 추출하는 함수
*/

SELECT SUBSTR('HELLO', 1, 2)
  FROM DUAL;
  
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)--끝까지
  FROM EMP;
  
--개인 정보를 다룰 때 유용

--INSTR; 안쓰니까 안다룸, 자바나 파이썬에서 처리가능

--REPLACE(문자열 데이터, 대체될 문자열, 대체할 문자): 문자를 다른 문자로 대체
/*
시리얼 번호나 통장 번호 같은 경우 사용
- 제거 등
*/
SELECT REPLACE ('10/2', '/', '-')
  FROM DUAL;
  
--RPAD, LPAD (문자열, 자리수, 배치할 문자열)
/*
자리수가 될때까지 원하는 문자열로 채움
오른쪽 왼쪽에 특정 문자열을 채울 때 사용
비밀번호, 생년월ㅇ일 등 개인정보의 일부를 가리기 위해서
*/

SELECT RPAD(SUBSTR('000501-3234567', 1, 8), LENGTH('000501-3234567'), '*')
  FROM DUAL;
  


--CONCAT : 두 문자열 데이터를 합침

SELECT CONCAT(SUBSTR('000501-3234567', 1, 8), '******')
  FROM DUAL;
  
-- || 주로 OR 연산이지만 문자열을 합치는데도 사용 가능

SELECT SUBSTR('000501-3234567', 1, 8) || '******'
  FROM DUAL;
  
-- TRIM(문자열, 문자); 공백을 지워줌, 특정 문자열 제거

--ROUND(1) : 소수점 둘째자리 반올림, 정수부분도 가능
--TRUNC : 버리는 함수
--MOD 나머지 (일반적으로 %)

SELECT ROUND(239.4556, -1) FROM DUAL;