
-- 네이버 회원 테이블을 만들어보기

CREATE TABLE 네이버회원(
    ID VARCHAR(15) PRIMARY KEY,
    이름 VARCHAR(12) NOT NULL,
    비밀번호 VARCHAR(16),
    생년월일 DATE,
    성별 VARCHAR(3) CHECK(성별 IN ('남', '여'))
);

INSERT INTO 네이버회원 