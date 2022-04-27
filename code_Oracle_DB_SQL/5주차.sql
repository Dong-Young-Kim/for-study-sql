-- 5주차 강의

--날짜 데이터
/*
오라클에서 날짜와 시간관련 데이터를 명시하는 데이터 타입
DATE 타입
모든 DB에서 다루는 매우 중요한 날짜관련 데이터
날짜 내용은 정말 중요
*/

-- SYDATE
/*
오늘 날짜를 출력하는 함수
다만 매게변수가 필요하지 않기 때문에 괄호를 붇이지 않아도 된다.
*/

SELECT SYSDATE AS NOW,
       SYSDATE - 1 AS YESTERDAY,
       SYSDATE + 1 AS TOMMOROW
  FROM DUAL;
  
  
  
--ADD_MONTHS
/*
날짜에서 달 단위로 더한 날짜를 출력하는 함수

특징 : 달의 28,29,30,31일인 달은 자동으로 계산해서 표시해줌..
따라서 날짜관련 계산은 DB를 거쳐서 계산
기본적으로 두 날짜간의 차이는 뺄셈을 통해서 이루어지는데
이전 날짜는 작은 정수, 나중 날짜는 큰 정수
*/
  
SELECT SYSDATE AS NOW,
       ADD_MONTHS(SYSDATE, 36)
  FROM DUAL;
  
--MONTHS-BETWEEN
/*
두 날짜간에 얼마나 차이가 있는지 알려주는 함수 
*/

SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1, -- 음수
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2, -- 양수
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
  FROM EMP;
  
/*
날짜를 저장하는 방식이 정수
따라서 음수가 나올수 있음
시간은 소수점
*/

--NEXT_DAY
/*
지정한 날짜로부터 돌아오는 주의 설정한 요일의 날짜를 출력함
*/
SELECT NEXT_DAY(SYSDATE, '금요일')
  FROM DUAL;
  
--LAST_DAY
/*
지정한 날짜가 속한 마지막 날을 출력하는 함수
*/
SELECT LAST_DAY(SYSDATE)
  FROM DUAL;
  
SELECT LAST_DAY(SYSDATE) + 1 -- 다음달의 첫날
  FROM DUAL;
  
  
  
/*
형 변환 함수
NUMBER, CHAR, DATE : 데이터 타입의 큰 세 분류
형변환 함수 : TO_NUMBER

*/

SELECT TO_NUMBER('123456')
  FROM DUAL;
  
SELECT TO_CHAR(123456)
  FROM DUAL;


-- 형식 지정 가능
--다른 언어와 다르게 분은 MI로 표현  (날짜 입력 포멧) 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS')
  FROM DUAL; --시간값을 잘라 출력하고 싶은 경우
  
--TO_DATE는 무조건 문자열을 받는 함수
SELECT TO_DATE('2010-2-2')
  FROM DUAL;
  
--175P Q3
SELECT EMPNO,
       ENAME,
       HIREDATE,
       TO_CHAR(NEXT_DAY (ADD_MONTHS(HIREDATE, 3),'월요일'), 'YYYY-MM-DD') AS R_JOB
  FROM EMP;
  
  
--NULL 처리 함수
/*
NULL 처리 연산자 -- IS NULL : WHERE절에서
NULL 처리 연산자 -- WHERE절 뿐만 아니라 SELECT절에서도 잘 쓰임
*/


--NVL : NULL값 처리 함수 
--NVL(컬럼명, 컬럼이 NULL이면 처리할 문자나 숫자)


SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM,
       NVL(COMM, 0),
       SAL + NVL(COMM,0)
  FROM EMP;
  
--NVL2(컬럼명, 컬럼이 NULL이 '아니면' 처리할 문자나 숫자, NULL'이면' 처리할 문자나 숫자)
-- 더 많이 사용
SELECT EMPNO, ENAME, COMM, SAL,
       NVL2(COMM, 'O', 'X'),
       NVL2(COMM, SAL*12+COMM , SAL*12) AS ANNSAL
  FROM EMP;
  
  
  
  
--DECODE 함수
--SWITCH CASE 와 유사
SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
             'MANAGER',  SAL*1.1,
             'SALESMAN', SAL*1.05,
             'ANALYST' , SAL,
              SAL*1.03) AS UPSAL
  FROM EMP;
  
  
--CASE 함수 
/*
IF 문과 많이 닮음 함수 
가장 넗은 범위의 값을 포현할 수 있고, 다양한 조건에서 실행할 수 있다.
*/

SELECT EMPNO, ENAME, COMM,
       CASE
       WHEN COMM IS NULL    THEN '해당사항없음'
       WHEN COMM = 0        THEN '수정없음'
       WHEN COMM > 0        THEN '수당: ' || COMM
       END AS COMM_TEXT
  FROM EMP;

/*
함수는 주로 괄호를 써서 표현
C++이나 다른 언어의 함수는 호출 시 괄호를 꼭 붙여야 한다.
하지만 오라클에서는 굳이 안에 들어갈 필요가 없는 함수는 괄호를 붙여서 표현하지 않는다.
*/