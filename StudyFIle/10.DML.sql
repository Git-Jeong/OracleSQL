
-- ���̹� ȸ�� ���̺��� ������

CREATE TABLE ���̹�ȸ��(
    ID VARCHAR(15) PRIMARY KEY,
    �̸� VARCHAR(12) NOT NULL,
    ��й�ȣ VARCHAR(16),
    ������� DATE,
    ���� VARCHAR(3) CHECK(���� IN ('��', '��'))
);

INSERT INTO ���̹�ȸ�� 