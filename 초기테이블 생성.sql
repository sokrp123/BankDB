DROP TABLE 거래내역;
DROP TABLE 카드;
DROP TABLE 예금계좌;
DROP TABLE 고객;

CREATE TABLE 고객(
고객주민번호 VARCHAR(30),
고객명 VARCHAR(30) UNIQUE NOT NULL,
고객전화번호 VARCHAR(30) UNIQUE NOT NULL,
고객이메일 VARCHAR(30) UNIQUE NOT NULL,
고객생년월일 VARCHAR(30),
고객주소 VARCHAR(50),
고객직업 VARCHAR(30),
CONSTRAINT CUSTOMER_PK PRIMARY KEY(고객주민번호)
);

CREATE TABLE 예금계좌(
예금계좌ID VARCHAR(30),
예금자이름 VARCHAR(30),
전화번호 VARCHAR(30),
이메일 VARCHAR(30),
고객주민번호 VARCHAR(30),
예금계좌종류 VARCHAR(30),
예금잔고 INTEGER,
카드신청여부 VARCHAR(30),
예금개설일자 VARCHAR(30),
CONSTRAINT ACCOUNT_PK PRIMARY KEY(예금계좌ID),
CONSTRAINT ACCOUNT_FK1 FOREIGN KEY(예금자이름) REFERENCES 고객(고객명),
CONSTRAINT ACCOUNT_FK2 FOREIGN KEY(전화번호) REFERENCES 고객(고객전화번호),
CONSTRAINT ACCOUNT_FK3 FOREIGN KEY(이메일) REFERENCES 고객(고객이메일),
CONSTRAINT ACCOUNT_FK4 FOREIGN KEY(고객주민번호) REFERENCES 고객(고객주민번호)
);

CREATE TABLE 카드(
카드ID VARCHAR(30),
고객주민번호 VARCHAR(30),
예금계좌ID VARCHAR(30),
카드신청일자 VARCHAR(30),
카드한도금액 INTEGER,
카드결제일자 VARCHAR(30),
카드종류 VARCHAR(30),
CONSTRAINT CARD_PK PRIMARY KEY(카드ID),
CONSTRAINT CARD_FK1 FOREIGN KEY(고객주민번호) REFERENCES 고객(고객주민번호),
CONSTRAINT CARD_FK2 FOREIGN KEY(예금계좌ID) REFERENCES 예금계좌(예금계좌ID)
);

CREATE TABLE 거래내역(
거래번호 INTEGER,
예금계좌ID VARCHAR(30),
입출금날짜 VARCHAR(30),
예금잔고 INTEGER,
예금구분 VARCHAR(30),
예금내용 VARCHAR(30),
거래금액 INTEGER,
CONSTRAINT TRANSACTION_FK1 FOREIGN KEY(예금계좌ID) REFERENCES 예금계좌(예금계좌ID),
CONSTRAINT TRANSACTION_PK PRIMARY KEY(거래번호, 예금계좌ID, 입출금날짜)
);

CREATE SEQUENCE ACCOUNT_ID
START WITH 333304000
MAXVALUE 999999999
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE TRANSACTIONID
START WITH 1
MAXVALUE 1000
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE CARDID
START WITH 1
MAXVALUE 1000
INCREMENT BY 1
NOCACHE;

COMMIT;