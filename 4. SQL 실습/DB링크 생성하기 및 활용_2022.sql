

----------DB링크 생성------
-----------------------------------
-- DB링크 설정 (동일 데이터베이스인 경우에만 해당됨)
-- 1.DB링크 생성
-- 이기종DB간의 데이터를 주고받고 한다 (추가로 단순 이관이아니라 INSIGHT도출결과 이관가능)

CREATE DATABASE LINK -- [원격지서버 접속명[마음대로 설정가능]]
CONNECT TO kopo -- [원격지 서버 접속 ID]
IDENTIFIED BY kopo -- [원격지 서버 접속 PW]
USING 'HOMEPC'    --[원격지 접속정보 OR TNSNAMES.ORA에 정의된 접속명]    'KOPO112'

CREATE DATABASE LINK HOME1120524
CONNECT TO kopo
IDENTIFIED BY kopo
USING 'HOMEPC'    --[접속정보 OR TNSNAMES.ORA에 정의된 접속명]    'KOPO112'


----------DB링크 조회 및 삭제 방법------
-----------------------------------
-- 2.DB링크 조회
SELECT * FROM ALL_DB_LINKS
-- 드롭하는 방법
DROP DATABASE LINK HOME1120524;
------------------------------------


----------DB링크 활용------
-----------------------------------
-- DB링크 활용방법
-- 112 -> LOCAL JOINTABLE1을 가져와서 생성한다
CREATE TABLE JOINTABLE2 AS
SELECT * FROM JOINTABLE2@KOPO1120524

-- LOCAL -> HOME JOINTABLE1을 가져와서 생성한다
-- 원격지에 있는 PC에는 CREATE는 불가능 하다!
INSERT INTO JOINTABLE1@HOME1120524
SELECT * FROM JOINTABLE1

INSERT INTO JOINTABLE2@HOME1120524
SELECT * FROM JOINTABLE2

-- 3.DB링크 활용 데이터 이관
CREATE TABLE KOPO_PRODUCT_VOLUME_LINK
AS SELECT * FROM KOPO_PRODUCT_VOLUME@KOPO1120524



