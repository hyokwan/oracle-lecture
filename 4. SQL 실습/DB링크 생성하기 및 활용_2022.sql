

----------DB��ũ ����------
-----------------------------------
-- DB��ũ ���� (���� �����ͺ��̽��� ��쿡�� �ش��)
-- 1.DB��ũ ����
-- �̱���DB���� �����͸� �ְ�ް� �Ѵ� (�߰��� �ܼ� �̰��̾ƴ϶� INSIGHT������ �̰�����)

CREATE DATABASE LINK -- [���������� ���Ӹ�[������� ��������]]
CONNECT TO kopo -- [������ ���� ���� ID]
IDENTIFIED BY kopo -- [������ ���� ���� PW]
USING 'HOMEPC'    --[������ �������� OR TNSNAMES.ORA�� ���ǵ� ���Ӹ�]    'KOPO112'

CREATE DATABASE LINK HOME1120524
CONNECT TO kopo
IDENTIFIED BY kopo
USING 'HOMEPC'    --[�������� OR TNSNAMES.ORA�� ���ǵ� ���Ӹ�]    'KOPO112'


----------DB��ũ ��ȸ �� ���� ���------
-----------------------------------
-- 2.DB��ũ ��ȸ
SELECT * FROM ALL_DB_LINKS
-- ����ϴ� ���
DROP DATABASE LINK HOME1120524;
------------------------------------


----------DB��ũ Ȱ��------
-----------------------------------
-- DB��ũ Ȱ����
-- 112 -> LOCAL JOINTABLE1�� �����ͼ� �����Ѵ�
CREATE TABLE JOINTABLE2 AS
SELECT * FROM JOINTABLE2@KOPO1120524

-- LOCAL -> HOME JOINTABLE1�� �����ͼ� �����Ѵ�
-- �������� �ִ� PC���� CREATE�� �Ұ��� �ϴ�!
INSERT INTO JOINTABLE1@HOME1120524
SELECT * FROM JOINTABLE1

INSERT INTO JOINTABLE2@HOME1120524
SELECT * FROM JOINTABLE2

-- 3.DB��ũ Ȱ�� ������ �̰�
CREATE TABLE KOPO_PRODUCT_VOLUME_LINK
AS SELECT * FROM KOPO_PRODUCT_VOLUME@KOPO1120524



