-- 5���� ����

--��¥ ������
/*
����Ŭ���� ��¥�� �ð����� �����͸� ����ϴ� ������ Ÿ��
DATE Ÿ��
��� DB���� �ٷ�� �ſ� �߿��� ��¥���� ������
��¥ ������ ���� �߿�
*/

-- SYDATE
/*
���� ��¥�� ����ϴ� �Լ�
�ٸ� �ŰԺ����� �ʿ����� �ʱ� ������ ��ȣ�� ������ �ʾƵ� �ȴ�.
*/

SELECT SYSDATE AS NOW,
       SYSDATE - 1 AS YESTERDAY,
       SYSDATE + 1 AS TOMMOROW
  FROM DUAL;
  
  
  
--ADD_MONTHS
/*
��¥���� �� ������ ���� ��¥�� ����ϴ� �Լ�

Ư¡ : ���� 28,29,30,31���� ���� �ڵ����� ����ؼ� ǥ������..
���� ��¥���� ����� DB�� ���ļ� ���
�⺻������ �� ��¥���� ���̴� ������ ���ؼ� �̷�����µ�
���� ��¥�� ���� ����, ���� ��¥�� ū ����
*/
  
SELECT SYSDATE AS NOW,
       ADD_MONTHS(SYSDATE, 36)
  FROM DUAL;
  
--MONTHS-BETWEEN
/*
�� ��¥���� �󸶳� ���̰� �ִ��� �˷��ִ� �Լ� 
*/

SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
       MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTH1, -- ����
       MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTH2, -- ���
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
  FROM EMP;
  
/*
��¥�� �����ϴ� ����� ����
���� ������ ���ü� ����
�ð��� �Ҽ���
*/

--NEXT_DAY
/*
������ ��¥�κ��� ���ƿ��� ���� ������ ������ ��¥�� �����
*/
SELECT NEXT_DAY(SYSDATE, '�ݿ���')
  FROM DUAL;
  
--LAST_DAY
/*
������ ��¥�� ���� ������ ���� ����ϴ� �Լ�
*/
SELECT LAST_DAY(SYSDATE)
  FROM DUAL;
  
SELECT LAST_DAY(SYSDATE) + 1 -- �������� ù��
  FROM DUAL;
  
  
  
/*
�� ��ȯ �Լ�
NUMBER, CHAR, DATE : ������ Ÿ���� ū �� �з�
����ȯ �Լ� : TO_NUMBER

*/

SELECT TO_NUMBER('123456')
  FROM DUAL;
  
SELECT TO_CHAR(123456)
  FROM DUAL;


-- ���� ���� ����
--�ٸ� ���� �ٸ��� ���� MI�� ǥ��  (��¥ �Է� ����) 
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS')
  FROM DUAL; --�ð����� �߶� ����ϰ� ���� ���
  
--TO_DATE�� ������ ���ڿ��� �޴� �Լ�
SELECT TO_DATE('2010-2-2')
  FROM DUAL;
  
--175P Q3
SELECT EMPNO,
       ENAME,
       HIREDATE,
       TO_CHAR(NEXT_DAY (ADD_MONTHS(HIREDATE, 3),'������'), 'YYYY-MM-DD') AS R_JOB
  FROM EMP;
  
  
--NULL ó�� �Լ�
/*
NULL ó�� ������ -- IS NULL : WHERE������
NULL ó�� ������ -- WHERE�� �Ӹ� �ƴ϶� SELECT�������� �� ����
*/


--NVL : NULL�� ó�� �Լ� 
--NVL(�÷���, �÷��� NULL�̸� ó���� ���ڳ� ����)


SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM,
       NVL(COMM, 0),
       SAL + NVL(COMM,0)
  FROM EMP;
  
--NVL2(�÷���, �÷��� NULL�� '�ƴϸ�' ó���� ���ڳ� ����, NULL'�̸�' ó���� ���ڳ� ����)
-- �� ���� ���
SELECT EMPNO, ENAME, COMM, SAL,
       NVL2(COMM, 'O', 'X'),
       NVL2(COMM, SAL*12+COMM , SAL*12) AS ANNSAL
  FROM EMP;
  
  
  
  
--DECODE �Լ�
--SWITCH CASE �� ����
SELECT EMPNO, ENAME, JOB, SAL,
       DECODE(JOB,
             'MANAGER',  SAL*1.1,
             'SALESMAN', SAL*1.05,
             'ANALYST' , SAL,
              SAL*1.03) AS UPSAL
  FROM EMP;
  
  
--CASE �Լ� 
/*
IF ���� ���� ���� �Լ� 
���� ���� ������ ���� ������ �� �ְ�, �پ��� ���ǿ��� ������ �� �ִ�.
*/

SELECT EMPNO, ENAME, COMM,
       CASE
       WHEN COMM IS NULL    THEN '�ش���׾���'
       WHEN COMM = 0        THEN '��������'
       WHEN COMM > 0        THEN '����: ' || COMM
       END AS COMM_TEXT
  FROM EMP;

/*
�Լ��� �ַ� ��ȣ�� �Ἥ ǥ��
C++�̳� �ٸ� ����� �Լ��� ȣ�� �� ��ȣ�� �� �ٿ��� �Ѵ�.
������ ����Ŭ������ ���� �ȿ� �� �ʿ䰡 ���� �Լ��� ��ȣ�� �ٿ��� ǥ������ �ʴ´�.
*/