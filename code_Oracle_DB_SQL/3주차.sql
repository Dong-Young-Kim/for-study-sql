select * from emp;

/*
BETWEEN A AND B
NOT BETWEEN A AND B
LIKE : -�� ���� -ó�� �˻��� �� ���� ���, ���ϵ�ī��
NOT�������� Ȱ��
IS NULL
���� ������
*/


-- BETWEEN
SELECT * FROM EMP
WHERE SAL <= 3000 AND SAL >= 1000;

SELECT * FROM EMP
WHERE SAL BETWEEN 1000 AND 3000;



--NOT BETWEEN
SELECT * FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;



--LIKE : -�� ���� -ó�� �˻��� �� ���� ���, ���ϵ�ī��*****
-- �Խñ� ��ȸ�ϴ� ����� ����ų�, ��������� �˻��Ҷ� ���� ���
-- ���ڿ� �˻��� �� ������ ���� ���
/*
���ϵ�ī��
(%)��� �������� ������� �ƹ�����
(%S%) �ش� ���ڰ� ���Ե� ��� ����
(_) � ���ڵ� �� ���ڸ�
*/


SELECT * 
  FROM EMP
 WHERE ename  LIKE '%S%';

SELECT ENAME
  FROM EMP
 WHERE ENAME LIKE '_A%';

--35��


--IS NULL ������
--NULL���� �ƴ��� �����ϴ� ������ / NULL�ƹ� ���� ����Ǿ����� ���� ��, ���� ���� �Ұ�

SELECT *
  FROM EMP
 WHERE COMM = NULL;
-- �ƹ��� ����� ������ ����
--���� ��ü�� �Ұ����ϱ� ������ / ���ڶ� NULL�� ���� �ƴϴ� ���굵 �Ұ���
SELECT *
  FROM EMP
 WHERE COMM IS NULL;
 
 
 
 --���� ������ : ���η� �ٿ��ִ� ������,, ������
SELECT EMPNO,ENAME, JOB
  FROM EMP
 UNION
SELECT * FROM DEPT;
--���� ������ �ڷ����� ���ƾ� ��� ����
--�ַ� ������ ���
--���Ͽ��� �� ������� ����

--INTERSECT ������ ,, ��ġ�ϴ� �͸� ���