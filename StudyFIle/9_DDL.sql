-----------------
-- CREATE TABLE
-- EMPLOYESS
DROP TABLE 직원;

CREATE TABLE 직원(
    직원ID NUMBER(6), 
    성 VARCHAR(25) NOT NULL,
    이름 VARCHAR(25),
    이메일 VARCHAR(25) NOT NULL,
    입사일 DATE,
    휴대전화 VARCHAR(25),
    직업번호 VARCHAR(20) NOT NULL,
    급여 NUMBER(8, 2),
    보너스_비율 NUMBER(2, 2),
    매니저ID NUMBER(2,2),
    부서ID NUMBER(4,0)
)

-- 제약조건 --
-- PRIMARY KEY : NOT NULL + UNIQUE
-- UNIQUE KEY : 중복불가, NULL은 가능
-- NOT NULL : NULL값이 불가능
-- FOREIGN KEY : 

ALTER TABLE 직원 ADD CONSTRAINT 직원_직원ID_PK PRIMARY KEY(직원ID);
ALTER TABLE 직원 ADD CONSTRAINT 직원_이메일_UK UNIQUE(이메일);
ALTER TABLE 직원 ADD CONSTRAINT 직원_급여_최솟값 CHECK(급여 > 0); 


-- 부서 -------------------------------------------------------------


DROP TABLE 부서;

CREATE TABLE 부서(
    부서ID NUMBER(4) NOT NULL,
    부서이름 VARCHAR(30) NOT NULL,
    매니저ID NUMBER(6),
    위치 NUMBER(4)
)

ALTER TABLE 부서 ADD CONSTRAINT 부서_부서ID_PK PRIMARY KEY(부서ID); 

--직원 테이블의 부서ID 컬럼은 부서 테이블의 부서ID 컬럼을 참조하게 된다
ALTER TABLE 직원 ADD CONSTRAINT 직원_부서ID_PK FOREIGN KEY (부서ID) REFERENCES 부서(부서ID);

ALTER TABLE 직원 MODIFY 이름 NOT NULL;

-- 만약 제약조건을 삭제한다?   
ALTER TABLE 직원 DROP CONSTRAINT SYS_C007030;
-- SYS_C007030D으로 걸린 조건을 삭제.
-- 여기서 SYS_C007030의 경우는 TABLE 클릭 후 shift f4를 누른다음, 제약조건에 들어가면 나온다


-- 제약조건 테스트 ------------

DROP TABLE 제약조건_테스트_1;
DROP TABLE 제약조건_테스트_2;

CREATE TABLE 제약조건_테스트_1 (
    PK NUMBER PRIMARY KEY,
    UK VARCHAR(1) UNIQUE,
    NN NUMBER NOT NULL,
    CK VARCHAR(1) CHECK ( CK IN ('1', '2'))
);

CREATE TABLE 제약조건_테스트_2 (
    PK NUMBER,
    UK VARCHAR(1),
    NN NUMBER,
    CK VARCHAR(1),
    
    CONSTRAINT T_PK_PK PRIMARY KEY(PK),
    CONSTRAINT T_UK_UK UNIQUE(UK),
    CONSTRAINT T_NN_NN CHECK(NN IS NOT NULL),
    CONSTRAINT T_CK_MIN CHECK(CK > 0)
);

INSERT INTO 제약조건_테스트_1 VALUES (1, 2, 3, 1);   


--직원 테이블에 나이를 추가
ALTER TABLE 직원 ADD 나이 NUMBER(1) NOT NULL;

--나이의 크기를 수정
ALTER TABLE 직원 MODIFY 나이 NUMBER(3);

--컬럼 나이라는 이름을 AGE로 수정
ALTER TABLE 직원 RENAME COLUMN 나이  TO AGE;

--AGE라는 COLUMN을 삭제
ALTER TABLE 직원 DROP COLUMN AGE;

--참조되는 중인 부서를 지워보면?
DROP TABLE 부서;
-- unique/primary keys in table referenced by foreign keys
-- 즉, 부서ID가 지금 직원TABLE에 참조가 되어있기 때문에 지우지 못함.

-- PK 관계를 삭제
DROP TABLE 부서 CASCADE CONSTRAINTS;

-- 제약조건에 삭제조건도 걸어놓기
-- ON DELETE CASCADE -- 부모를 삭제시 자녀도 삭제하는 조건!
ALTER TABLE 직원 ADD CONSTRAINT 직원_부서ID_PK FOREIGN KEY (부서ID) REFERENCES 부서(부서ID) ON DELETE CASCADE;

-- ON DELETE SET NULL -- 부모를 삭제할 시 자녀는 NULL이 대입됨
ALTER TABLE 직원 ADD CONSTRAINT 직원_부서ID_PK FOREIGN KEY (부서ID) REFERENCES 부서(부서ID) ON DELETE SET NULL;


--테이블 내부구조 파악
DESC 제약조건_테스트_1;
DESC 제약조건_테스트_2;