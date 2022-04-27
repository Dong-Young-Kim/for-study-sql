--싱글라인 주석
/*
멀티라인 주석
*/
--F9로 실행

/*index pos 의 index가 배열의 index와 동일하다고 보면 됩니다.
int arr[];
arr[1] 어레이에 접근
인덱스처럼 작용
*/

--DESC : 테이블에 있는 칼럼이 어떤 속성을 가지는지 알기위해 사용하는 명령어
desc emp;

--처음에 웹 백엔드 프로그래머로 회사에 들어가면 데이터베이스에 무슨 테이블이 있는지 모름.
-- mysqi의 경우는 show table로

select * from user_objects where object_type = 'TABLE';
--회사 내 데이터베이스를 조회하는 방법

SELECT * FROM EMP;

--DISTINCT : 데이터가 중복된게 있으면 중복을 제거해줌
--SELECT DISTINCT JOB FROM EMP;
--ALL 은 DISTICNT와 반대로 중복된 것 전부 출력 디폴트 값으로 설정되어있음

--연봉구하기
SELECT ENAME, SAL*12 FROM EMP;

-- 사칙연산이 SELECT문에 적용

--보너스 구하기
SELECT ENAME, SAL*12 + comm FROM EMP;
/*
null과 숫자를 계산하려하여 빈값이 출력
확실한 연봉정보를 위해서는 null을 0으로 처리하는 과정이 필요
*/


--별칭. 컬럼에 대한 별칭을 정할 수 있음
--as : ~로서 -->이름을 지을떄 사용
--as 사용시 띄어쓰기가 없으면 따옴표 사용안해도 괜찮음
SELECT EMPNO as "직원번호", ENAME as "직원이름", SAL*12 as "연봉" 
  FROM EMP;
--as 는 컬럼에 이름을 붙임 한글로도 가능하고 사칙연산이 적용되어있더라도 충분히 적용가능



--ORDER BY : 행들을 정렬하는 명령어 
SELECT EMPNO as "직원번호", ENAME as "직원이름", SAL*12 as "연봉" 
  FROM EMP
    --ORDER BY ENAME ASC; -- 이름 순서대로 오름차순 정렬 ASC, DESC "asc가 디폴트"
 ORDER BY "직원이름" ASC; -- 별칭으로도 가능 단) 따옴표를 작행하줘야 함
    
--두 칼럼을 순서대로 지정할 수 있음
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
--DEPTNO 먼저정렬, 같은 것은 SAL로 정렬

--데이터베이스 정렬 알고리즘은 무조건 많이 사용
-- 실제로 웹 업무에서는 데이터베이스에서 정렬을 한 후에 많이 구현하고 있다.



------------- WHERE절에 대해서--------------------------------
--> IF문과 상당히 유사, (SQL의 조건문 역할)

/*
SELECT [조회할 열1], [조회할 열2], ...
FROM [조회할 테이블]
WHERE [조건식] 조건식의 예시 : 조회할 열 > 500
*/

-- 셀렉션?? : 행단위로 데이터를 조회하는 방식이고 대표적으로 WHERE절이 있음.
SELECT *
    FROM EMP
    WHERE SAL >= 3000;
    
/*
셀렉션 : 행 단위로 원하는 데이터를 조회하는 방식.
프로젝션 : 열 단위로 데이터를 조회하는 방식.
*/
    




-- 컴퓨터계산에서의 오칙연산 +-*/%
-- 오라클에서는 사칙연산만 지원한다.





--비교연산자---------------------------------
/* 
보통은 이렇게 사용 !=, ==, >=, 등
오라클에서는 같다와 아니다가 다름

같다 : =
다르다 : !=, <>, ^= 모두 사용가능

not연산자 보통 not을 많이 사용

*/

SELECT *
  FROM EMP
  WHERE NOT deptno IN (30);



--조건 연산자 : AND OR------------------------
/*
보통 &&,||와 같은 방식으로 사용하지만
오라클에서는 AND OR 그대로 사용
and 사용 순서가 중요  속도의 차이가 발생
*/

SELECT *
  FROM EMP
 WHERE SAL >= 3000 OR SAL <= 1000;
    
    
    
    
    
--IN 연산자 107쪽---------------------
/*
=으로 되어있는 조건인데 OR로 묶여있을 경우 사용함
아래와 같은 경우 IN절을 사용함
*/


    
SELECT *
  FROM EMP
 WHERE SAL IN (3000, 1500, 2000, 5000);
 

-- 과제는 92페이지 문제 메일로 제출