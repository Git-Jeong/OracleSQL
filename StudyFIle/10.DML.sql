
-- 네이버 회원 테이블을 만들어보기

CREATE TABLE 네이버회원(
    ID VARCHAR(15) PRIMARY KEY,
    이름 VARCHAR(12) NOT NULL,
    비밀번호 VARCHAR(16),
    생년월일 DATE,
    성별 VARCHAR(3) CHECK(성별 IN ('남', '여'))
);

INSERT INTO 네이버회원 VALUES ('JEONGJIN', '문정진', 'PWD1234', SYSDATE, '남');

SELECT *
FROM 네이버회원;

-- 지정하지 않은 값은 자공으로 NULL값이 들어간다.
-- 다만. PRIMARY KEY와 NOT NULL의 조건이 있는 칼럼은 무조건 값을 넣어줘야 된다.
INSERT INTO 네이버회원(이름, 비밀번호) VALUES ('TEST-NAME', 'TEST-PWD');
INSERT INTO 네이버회원(ID, 이름, 비밀번호) VALUES ('TEST-ID', 'TEST-NAME', 'TEST-PWD'); 

ALTER TABLE 네이버회원 MODIFY 성별 VARCHAR(10);
    
INSERT INTO 네이버회원 VALUES ('NEW_ID', '문정진', 'PWD1234', SYSDATE, '남');

UPDATE 네이버회원 
SET 이름 = 'JeongJin'
WHERE ID = 'NEW_ID';

//데이터 복구하는 명령어, CTRL + 'Z' 느낌?
ROLLBACK;