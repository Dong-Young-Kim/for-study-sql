-- 4���� ����

/*
�Լ���: �Է��� ������ ����� ������ ģ��

����Ŭ�� ���� �ִ� �Լ� ���� : �����Լ�

������ �Լ��� ������ �Լ��� ����

""������ �Լ��� ���ؼ�""
����� ��µǴ� ���� ������

""�������Լ��� ���ؼ�""
������(�÷� ��ü�̰ų� �÷��Ϻ�)�� �ŰԺ����� �ʿ��ϸ�, ����� ��µǴ� ���� �ϳ�
*/

--upper, lower, initcap
/*
upper : �빮�ڷ�
lower : �ҹ��ڷ�
initcap : ù���ڸ� �빮�ڷ�
UPPER LOWER�� LIKE�� ���ϵ�ī��� �Բ� �˻��� ���� ���Ǵ� �Լ�
*/

SELECT UPPER(ENAME) FROM EMP;
SELECT LOWER(ENAME) FROM EMP;
SELECT INITCAP(ENAME) FROM EMP;

SELECT *
  FROM EMP
 WHERE LOWER(ENAME) LIKE '%scott%';
 
/* ���ñ� �˻� ����
    SELECT TITLE, CONTENT
      FROM BOARD
     WHERE UPPER(TITLE) LIKE '%����� �Է°�%' --> �ڹٳ� ���̽� ���� ���ξ��� �빮�ڷ� ��ȯ�� ��
        OR UPPER(CONTENT) LIKE '%����� �Է°�%' 
*/
 
--dual ����, dual ���̺�
/*
�ӽð���
����Ŭ������ ����� ����
*/ 

SELECT 1111, 2222 AS NAME
  FROM DUAL;
  
-- LENGTH �Լ�
/*
���ڿ��� ���̸� ��ȯ�ϴ� �Լ�
���������� ����� ���� ���� ����� ���� ����
*/

SELECT ENAME, LENGTH(ENAME)
  FROM EMP;
  

SELECT ENAME, LENGTH(ENAME)
  FROM EMP
 WHERE LENGTH(ENAME) >= 6;
 
 
 
--SUBSTR
/*
��� ���ڿ��� ��ȯ�ϴ� ����� �� �����ִ� �Լ�.
Ư�� ���ڿ��� �����ϴ� �Լ�
*/

SELECT SUBSTR('HELLO', 1, 2)
  FROM DUAL;
  
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)--������
  FROM EMP;
  
--���� ������ �ٷ� �� ����

--INSTR; �Ⱦ��ϱ� �ȴٷ�, �ڹٳ� ���̽㿡�� ó������

--REPLACE(���ڿ� ������, ��ü�� ���ڿ�, ��ü�� ����): ���ڸ� �ٸ� ���ڷ� ��ü
/*
�ø��� ��ȣ�� ���� ��ȣ ���� ��� ���
- ���� ��
*/
SELECT REPLACE ('10/2', '/', '-')
  FROM DUAL;
  
--RPAD, LPAD (���ڿ�, �ڸ���, ��ġ�� ���ڿ�)
/*
�ڸ����� �ɶ����� ���ϴ� ���ڿ��� ä��
������ ���ʿ� Ư�� ���ڿ��� ä�� �� ���
��й�ȣ, ��������� �� ���������� �Ϻθ� ������ ���ؼ�
*/

SELECT RPAD(SUBSTR('000501-3234567', 1, 8), LENGTH('000501-3234567'), '*')
  FROM DUAL;
  


--CONCAT : �� ���ڿ� �����͸� ��ħ

SELECT CONCAT(SUBSTR('000501-3234567', 1, 8), '******')
  FROM DUAL;
  
-- || �ַ� OR ���������� ���ڿ��� ��ġ�µ��� ��� ����

SELECT SUBSTR('000501-3234567', 1, 8) || '******'
  FROM DUAL;
  
-- TRIM(���ڿ�, ����); ������ ������, Ư�� ���ڿ� ����

--ROUND(1) : �Ҽ��� ��°�ڸ� �ݿø�, �����κе� ����
--TRUNC : ������ �Լ�
--MOD ������ (�Ϲ������� %)

SELECT ROUND(239.4556, -1) FROM DUAL;