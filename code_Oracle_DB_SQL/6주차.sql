--������ �Լ�

/*
���� �÷��� ���Ͼ� ��ȯ�ϴ� ���� �ϳ��� �Լ�

*/

SELECT SUM(SAL) FROM EMP;
SELECT SUM(SAL), SAL FROM EMP; --�� ���� �ٸ��Ƿ� ��� �Ұ�
--���� ������ ��µǴ� Į���� ������ �Լ��� ���� ǥ���� �� ������, ������ �ϼ��� ������ ����ϴ� ���� �����ϴ�.
SELECT SUM(SAL), AVG(SAL) FROM EMP;

--COUNT(�� �ķ�): ������ �� ���� NULL�� �ƴ� ģ���� ������ �� ��
--� ���̺��̵� �� ���ǿ� �ش����� �ʰ� ������ �� �� �ֱ� ������ ���� ���� ���Ǵ� ����
SELECT COUNT(*) FROM EMP;

--���� ���� ����
SELECT COUNT(COMM) FROM EMP;


--MAX, MIN : �ּ� �ִ밪�� ���ϴ� �Լ�
SELECT MAX(SAL) FROM EMP;
SELECT MIN(SAL) FROM EMP;


--AVG :��� ���ϴ� �Լ�
SELECT ROUND(AVG(SAL),2) FROM EMP;


--GROUP BY �Լ�: �׷��� ���ִ� �Լ�
---> ������ �Ǵ� �÷��� ���� ������ �Լ��� ��ȯ���� ����ϴ� �Լ�
--������ �Լ��� ������� ���� ���� �׷�������� ������� ������ ����Ʈ ������ ����� �� ����

SELECT  ROUND(AVG(SAL), 2), DEPTNO, JOB 
  FROM  EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO;
--�μ����� ��� ������ ����


--HAVING�� : �׷��� �� �Ŀ� ����Ǵ� WHERE��
--WHERE ���� ROW�ϳ��ϳ��� ���� ������ �Է�������, HAVING���� �׷쿡 ���� ������ ���
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
--�տ� ���� ������ �������� ������ �Լ��� ���� ���� ��ȯ�� ��
--��ü�� ���� ������ �˻� ������� ��ȯ�Ѵ�
SELECT  ROUND(AVG(SAL), 2), DEPTNO, JOB
  FROM  EMP
GROUP BY ROLLUP (DEPTNO, JOB)
ORDER BY        DEPTNO;

--CUBE
-- ROLL UP + �ڿ� ���� ����
SELECT  ROUND(AVG(SAL), 2), DEPTNO, JOB
  FROM  EMP
GROUP BY CUBE (DEPTNO, JOB)
ORDER BY       DEPTNO;


--JOIN
/*
�ܷ�Ű�� �������� ���̺� ���� ���踦 �ξ��ִ� ��ɾ�.
������ �����ͺ��̽��� ������ ������ �˰� �־�� ��.
DQL�� 30%
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

--