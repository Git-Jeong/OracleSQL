
-- ���̹� ȸ�� ���̺��� ������

CREATE TABLE ���̹�ȸ��(
    ID VARCHAR(15) PRIMARY KEY,
    �̸� VARCHAR(12) NOT NULL,
    ��й�ȣ VARCHAR(16),
    ������� DATE,
    ���� VARCHAR(3) CHECK(���� IN ('��', '��'))
);

INSERT INTO ���̹�ȸ�� VALUES ('JEONGJIN', '������', 'PWD1234', SYSDATE, '��');

SELECT *
FROM ���̹�ȸ��;

-- �������� ���� ���� �ڰ����� NULL���� ����.
-- �ٸ�. PRIMARY KEY�� NOT NULL�� ������ �ִ� Į���� ������ ���� �־���� �ȴ�.
INSERT INTO ���̹�ȸ��(�̸�, ��й�ȣ) VALUES ('TEST-NAME', 'TEST-PWD');
INSERT INTO ���̹�ȸ��(ID, �̸�, ��й�ȣ) VALUES ('TEST-ID', 'TEST-NAME', 'TEST-PWD'); 

ALTER TABLE ���̹�ȸ�� MODIFY ���� VARCHAR(10);
    
INSERT INTO ���̹�ȸ�� VALUES ('NEW_ID', '������', 'PWD1234', SYSDATE, '��');

UPDATE ���̹�ȸ�� 
SET �̸� = 'JeongJin'
WHERE ID = 'NEW_ID';

//������ �����ϴ� ��ɾ�, CTRL + 'Z' ����?
ROLLBACK;