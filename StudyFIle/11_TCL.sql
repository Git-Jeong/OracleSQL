-------
-- COMMIT�� ������ Ʈ�������� ����� ����
-- ROLLBACK�� ��� Ʈ�������� ���, ������ COMMIT ���������� ���� ����

SELECT *
FROM īī����ũ;

-- KAKAO BANK

CREATE TABLE īī����ũ(
    ���¹�ȣ VARCHAR(50) PRIMARY KEY,
    �̸� VARCHAR(50) NOT NULL,
    �ܾ� NUMBER CHECK(�ܾ� >= 0) NOT NULL
);

//DDL�� �ڵ� COMMIT�̶�, ROLLBACK�� �� �ȴ�.
ROLLBACK;

DROP TABLE īī����ũ;

INSERT INTO īī����ũ VALUES ('78940101668988', '������', 0);
INSERT INTO īī����ũ VALUES ('ASDASDAS668988', 'ȫ�浿', 0);

COMMIT;

-- SESSION �����ͺ��̽��� ������ �ִ� ���� ����
-- SQL DEVELOPER�� 2�� ����ϸ� ���� 2���� ����� ����
-- DB���ῡ ���� SECTION

UPDATE īī����ũ 
SET �ܾ� = 2000000 
WHERE ���¹�ȣ = 'ASDASDAS668988';

COMMIT;
-- 1�� ���ǿ��� Ŀ���� �� �ϸ� �ݿ��� �� �ȴ�.
-- �̸� �б� �ϰ��� �̶�� �θ���.
-- Ŀ���� �ؾ߸� �ٸ� ���ǿ����� ������ ���� Ȯ���� �� �ִ�.


-- LOCK
UPDATE īī����ũ 
SET �ܾ� = 12345 
WHERE ���¹�ȣ = 'ASDASDAS668988';
-- COMMIT�� ���� �ʰ�, �ٸ� ����ڰ� COMMIT�� �Ϸ��� �ϸ� ���ѷε��� �ɸ���.!
-- �������� ������ ���� ���� ��ġ.