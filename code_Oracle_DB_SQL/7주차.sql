--����
/*
���� ���̺��� �� Ű(�ܷ�Ű) �������� ���� ��

���� �����ڿ� �� ���̺��� ���δٴ� ������ �����ϳ�
���� �����ڴ� �տ� ��õ� �÷��� ���� �÷��� �¿�ǰ�
� �ڷ����� �� �� �� �ִٴ� ������ ������ �ִ�.
*/

SELECT * FROM EMP;
SELECT * FROM DEPT;

--������ �⺻ ����(����Ŭ���� �ش�)
SELECT * FROM EMP, DEPT
 WHERE EMP.DEPTNO = DEPT.DEPTNO;

SELECT EMPNO, ENAME, JOB, DNAME, LOC
  FROM EMP ,DEPT
 WHERE EMP.DEPTNO = DEPT.DEPTNO;
 --EMP�� DEPT�� DEPTNO�� ���� ��Ī�Ǵ� ��쿡�� ����ϱ�
 
--��Ī �����ϱ�
SELECT * FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO AND
       SAL > 3000;
       
--����� : WHERE ������ �ٷ� ��Ī��ų �� �ִ� ���

--������: ������ ������ �� ���� ���, ���� ������ �������� �ٸ� ���̺�� ��Ī��Ű���� �Ҷ�
SELECT * FROM SALGRADE;

SELECT *
  FROM EMP E,SALGRADE S
 WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

--��������(��ü����): �ڱ� ���̺� ������ ���� ��ġ�� ���� ��
--Ư���� ��쿡 ����ϳ� �ǿܷ� ���󵵰� ����
--�ڽ��� ���̺� �ȿ� �ַ�Ű�� �ִ� ���
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS ����ȣ, E2.ENAME AS ����̸�
  FROM EMP E1, EMP E2 --E2�� ������, E1�� ���ϱ��� 
 WHERE E1.MGR = E2.EMPNO;
 
 
--�ܺ�����: �� ���� ������ִ� ���� ���
--���� �ܺ����ΰ� ���� �ܺ��������� ����
--���� �ܺ����� : ���� �ܺ������� �������� ������ NULL�� ���� �� ���
--(+)��ȣ�� �̿��Ͽ� ���� ���̺��� ���� �� ���� --> ����Ŭ ���� ����
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS ����ȣ, E2.ENAME AS ����̸�
  FROM EMP E1, EMP E2 --E2�� ������, E1�� ���ϱ��� 
 WHERE E1.MGR = E2.EMPNO(+); --KING�� ����

--���� �ܺ�����: ���� �ܺ������� �������� ������ NULL�� ���� �� ���
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS ����ȣ, E2.ENAME AS ����̸�
  FROM EMP E1, EMP E2 --E2�� ������, E1�� ���ϱ��� 
 WHERE E1.MGR(+) = E2.EMPNO; --���ϰ� ���� ����� ����
 
 
--232p : SQL99ǥ�ع��� �� ���� ��� DBMS���� ����� �� �ִ� ����

--�̸��� ���� �÷��� ã�� �� �ڵ����� ����
--WHERE�� ����ϴ� �� ���� �� ������ �˾Ƶδ°� ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
  FROM EMP E NATURAL JOIN DEPT D
 ORDER BY DEPTNO, E.EMPNO;
       
--�Ȱ��� ������ϳ� ��ġ�� �÷��� ����ؾ� ��
--��ġ�� �÷��� 2�� �̻��� �� ���  
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC      
  FROM EMP E JOIN DEPT D USING (DEPTNO)
 WHERE SAL >= 3000;
 
--���̺� 1�̸� JOIN ���̺� 2�̸� ON (���ǽ�)
--����Ŭ�� �����ϰ� ������ �� �� ����
--> �� ���� �������ε� ����
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC  
  FROM EMP E JOIN DEPT D ON (D.DEPTNO = E.DEPTNO)
  WHERE SAL >= 3000;
  
  
  
--���� �ܺ����� SQL99
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS ����ȣ, E2.ENAME AS ����̸�
  FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);
--  FROM EMP E1, EMP E2 --E2�� ������, E1�� ���ϱ��� 
-- WHERE E1.MGR = E2.EMPNO(+); --KING�� ����

--��ü �ܺ�����
SELECT E1.EMPNO, E1.ENAME, 
       E2.EMPNO AS ����ȣ, E2.ENAME AS ����̸�
  FROM EMP E1 FULL OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);