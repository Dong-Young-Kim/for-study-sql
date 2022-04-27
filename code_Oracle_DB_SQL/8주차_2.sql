-- ��������
--> ������ �ȿ� ���� ������
--> �������� ������ ���� (select, from, where�� ��� �� �� ����
--> from �� �ȿ����� ����� �������� ���� (ȿ�������� ����� �� ���� ����)
--> ���� ���� ����Ⱓ�� ������ ����� �� ����

--where������ ���Ǵ� ����������
--1. ������ ��������
--ROW�ϳ� COLUMN �ϳ��� �̷��� ����
--> �� ���� WHERE������ ���� ���� 
SELECT SAL 
  FROM EMP 
 WHERE ENAME = 'JONES';
 
--JONES���� ���� ������ �޴� �������� ������ ���
--���� �������� ������� �������� ���� ����
--�δܰ踦 �Ѵܰ�� ���� �� ����
SELECT *
  FROM EMP 
 WHERE SAL > (SELECT SAL
                FROM EMP
               WHERE ENAME = 'JONES');
             

--2.������ ��������
--ROW ������, COLUMN �Ѱ��� �̷���� ����
SELECT ENAME
  FROM EMP
 WHERE SAL > 2000;
--IN������ IN(�ȿ� �ִ� ģ����)
SELECT *
  FROM EMP
 WHERE SAL IN (SELECT MAX(SAL)
                 FROM EMP
                GROUP BY DEPTNO);
--ANY, SOME
--> ���� �������� ������� �ϳ��� ���̸� ������ �����Ѵ�.
--> 
SELECT *
  FROM EMP
 WHERE SAL = ANY(SELECT MAX(SAL)
                   FROM EMP
                  GROUP BY DEPTNO);
--> � �����ڴ� �� ������� ����
--> ���� ������ �� ���� ���ְ� ���


--ALL
--> ALL ���� ���� � �����ڿ� ���� ����� �� ����
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
                  
--> ALL ��� MAX SAL�� �ᵵ ��� ����

--ANY SOME ALL �Լ��� ��� �񱳿��� �� MIN MAX���� �� Ȱ���ϸ� ���� ȿ�������� ������ �� �ִ�.

--EXIST ������
--> �ϳ��� ���̸� ���� ���̶�� ����

--FROM���� ����ϴ� ��������
--> ���������� ��Ī�� �� ������ �־��
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
       (SELECT * FROM DEPT) D
 WHERE E10.DEPTNO = D.DEPTNO;
 
 --WITH��
 -->������������ ������ ���� ������������ �Ϲ� ���̺��� �������ִ� ����
  WITH E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10),
       D   AS(SELECT * FROM DEPT)
SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM E10, D
 WHERE E10.DEPTNO = D.DEPTNO;
 
 
--SELECT���� ���Ǵ� ��������
--��Į�� ��������
--�̷��� ���ι��� �� ������ ����
--�̷��� �� ���� �ֱ���
SELECT EMPNO, ENAME, JOB, SAL,
       (SELECT GRADE FROM SALGRADE WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
       DEPTNO,
       (SELECT DNAME FROM DEPT WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
  FROM EMP E;
  
  
  
  
  
--������ ���۾� (DML)
--> �������� ����(INSERT) ����(DELETE) ����(UPDATE)

--������ ���Ǿ� (DDL)
-->���̺��� ����(CREATE), ����(DROP), ����(ALTER)

--���̺��� ����
--���̺��� ���� �ڷḦ �����ϰ��� �� �� ASŰ���带 ����Ѵ�.
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    

SELECT * FROM DEPT_TEMP;





--���� �ڷ���� �� ���̺��� ����� ���� ��
CREATE TABLE MYTABLE
(
    HUM_NO NUMBER PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL
    
);
--UNIQUE        �ߺ��� ������� �ʴ� Ű����
--NOT NULL      �ΰ��� ������� �ʴ� Ű����
--PRIMARY KEY   �⺻Ű ���� �����ϴ� Ű����

SELECT * FROM MYTABLE;

--�������� ����
INSERT INTO MYTABLE(HUM_NO, NAME) VALUES(1,'�赿��');
INSERT INTO MYTABLE(HUM_NO, NAME) VALUES(2,'���¿�');


--���̺��� ����
DROP TABLE MYTABLE;
DROP TABLE DEPT_TEMP;


--���̺��� ����
--ALTER
--COLUMN�� �߰�
ALTER TABLE MYTABLE
  ADD PHONE VARCHAR2(12) NOT NULL UNIQUE;
--COLUMN�� �̸��� ����
ALTER TABLE MYTABLE
RENAME COLUMN PHONE TO HP;
--COLUMN�� �ڷ����� ����
ALTER TABLE MYTABLE
MODIFY HP NUMBER(12);

DESC MYTABLE;

--�������� ����
--> WHERE ���� ������� ������ �ϰ������� ����ǹǷ� ����
UPDATE MYTABLE SET NAME = '����Ŭ', HUM_NO = 3 WHERE HUM_NO = 2;


--�������� ����
-->���ǿ� �´� ���� ã�� ����
DELETE MYTABLE WHERE HUM_NO = 3;


--262,263

--������, GRANT ���Ѽ���, VIEW, 
