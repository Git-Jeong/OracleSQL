-- 회원 정보
-- 아이디 pk, 비밀번호 nn, 닉네임 nn
CREATE TABLE SAIL_USER (
    userID VARCHAR2(50)
  , userPW VARCHAR2(50)
  , userNAME VARCHAR2(50)
  , CONSTRAINT UR_ID_PK PRIMARY KEY(userID)
  , CONSTRAINT UR_PW_NN CHECK(userPW IS NOT NULL)
  , CONSTRAINT UR_NANE_NN CHECK(userNAME IS NOT NULL)
);

-- 상품 정보
-- 상품 등록 번호 pk, 상품 이름 nn, 상품 가격 nn, 상품 설명 nn, 상품 판매중인지 확인(초기값 TRUE),조회수(초기값 0), 등록일자(SYSDATE), 등록자 아이디(fk)
CREATE TABLE PRODUCT (
    productID NUMBER
  , productNAME VARCHAR2(50)
  , price NUMBER
  , detail VARCHAR2(600) 
  , onSale NUMBER(1) DEFAULT 1 -- 1을 true로, 0을 false로 표현
  , viewcount NUMBER DEFAULT 0
  , onTime DATE
  , userID VARCHAR2(50)
  , CONSTRAINT PT_ID_PK PRIMARY KEY(productID)
  , CONSTRAINT PT_NAME_NN CHECK(productNAME IS NOT NULL)
  , CONSTRAINT PT_PRICE_NN CHECK(price IS NOT NULL)
  , CONSTRAINT PT_DETAIL_NN CHECK(detail IS NOT NULL)
  , CONSTRAINT PT_ONSALE_CK CHECK(OnSale IN (0, 1))
  , CONSTRAINT PT_SELLERID_FK FOREIGN KEY(userID) REFERENCES SAIL_USER(userID) ON DELETE CASCADE
);

-- 상품등록번호 시퀀스 생성
CREATE SEQUENCE PRODUCT_NUM
INCREMENT BY 1
START WITH 10000001;

-- 판매된 상품 목록
-- 판매 등록 번호 (PK), 판매자ID (FK), 판매된 상품 번호 (FK), 판매된 시간(SYSDATE)
CREATE TABLE PURCHASE (
    purchaseID NUMBER
  , userID VARCHAR2(50)
  , productID NUMBER
  , time DATE
  , CONSTRAINT PE_ID_PK PRIMARY KEY(purchaseID)
  , CONSTRAINT PE_SELLERID_FK FOREIGN KEY(userID) REFERENCES SAIL_USER(userID) ON DELETE CASCADE
  , CONSTRAINT PE_PRODUCTID_FK FOREIGN KEY(productID) REFERENCES PRODUCT(productID) ON DELETE CASCADE
);

-- 판매등록번호 시퀀스 생성
CREATE SEQUENCE PURCHASE_NUM
INCREMENT BY 1
START WITH 10000001;

COMMIT;

-- 테이블 삭제
DROP TABLE SAIL_USER CASCADE CONSTRAINT;

DROP TABLE PRODUCT CASCADE CONSTRAINT;

DROP TABLE PURCHASE;