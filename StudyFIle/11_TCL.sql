-------
-- COMMIT은 마지막 트랜젝션의 결과를 저장
-- ROLLBACK의 경우 트렉젝션의 취소, 마지막 COMMIT 시점까지만 복구 가능

SELECT *
FROM 카카오뱅크;

-- KAKAO BANK

CREATE TABLE 카카오뱅크(
    계좌번호 VARCHAR(50) PRIMARY KEY,
    이름 VARCHAR(50) NOT NULL,
    잔액 NUMBER CHECK(잔액 >= 0) NOT NULL
);

//DDL은 자동 COMMIT이라, ROLLBACK이 안 된다.
ROLLBACK;

DROP TABLE 카카오뱅크;

INSERT INTO 카카오뱅크 VALUES ('78940101668988', '문정진', 0);
INSERT INTO 카카오뱅크 VALUES ('ASDASDAS668988', '홍길동', 0);

COMMIT;

-- SESSION 데이터베이스에 접속해 있는 연결 상태
-- SQL DEVELOPER를 2개 사용하면 세션 2개가 여결된 상태
-- DB연결에 대한 SECTION

UPDATE 카카오뱅크 
SET 잔액 = 2000000 
WHERE 계좌번호 = 'ASDASDAS668988';

COMMIT;
-- 1번 섹션에서 커밋을 안 하면 반영이 안 된다.
-- 이를 읽기 일관성 이라고 부른다.
-- 커밋을 해야만 다른 섹션에서도 수정된 값을 확인할 수 있다.


-- LOCK
UPDATE 카카오뱅크 
SET 잔액 = 12345 
WHERE 계좌번호 = 'ASDASDAS668988';
-- COMMIT을 하지 않고, 다른 사용자가 COMMIT을 하려고 하면 무한로딩에 걸린다.!
-- 데이터의 변형을 막기 위한 조치.