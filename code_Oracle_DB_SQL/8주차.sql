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