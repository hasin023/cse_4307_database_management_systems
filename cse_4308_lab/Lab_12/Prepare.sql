DROP TABLE ACCOUNT CASCADE CONSTRAINTS;

DROP TABLE TRANSACTION CASCADE CONSTRAINTS;

DROP TABLE ACCOUNT_PROPERTY CASCADE CONSTRAINTS;

DROP TABLE BALANCE CASCADE CONSTRAINTS;

CREATE TABLE ACCOUNT(
    ID NUMBER,
    NAME VARCHAR2(20),
    ACC_CODE NUMBER,
    OPENING_DATE TIMESTAMP,
    LAST_DATE_INTEREST TIMESTAMP,
    CONSTRAINT ACCOUNT_PK PRIMARY KEY (ID),
    CONSTRAINT ACCOUNT_FK FOREIGN KEY (ACC_CODE) REFERENCES ACCOUNT_PROPERTY(ID)
);

CREATE TABLE TRANSACTION(
    T_ID NUMBER,
    ACC_NO NUMBER,
    AMOUNT NUMBER(10, 2),
    TRANSACTION_DATE TIMESTAMP,
    CONSTRAINT TRANSACTION_PK PRIMARY KEY (T_ID),
    CONSTRAINT TRANSACTION_FK FOREIGN KEY (ACC_NO) REFERENCES ACCOUNT(ID)
);

CREATE TABLE ACCOUNT_PROPERTY (
    ID NUMBER,
    NAME VARCHAR2(20),
    PROFIT_RATE NUMBER(10, 2),
    GRACE_PERIOD NUMBER CONSTRAINT ACCOUNT_PROPERTY_PK PRIMARY KEY (ID)
);

CREATE TABLE BALANCE (
    ACC_NO NUMBER,
    PRINCIPAL_AMOUNT NUMBER(10, 2),
    PROFIT_AMOUNT NUMBER(10, 2),
    CONSTRAINT BALANCE_PK PRIMARY KEY (ACC_NO),
    CONSTRAINT BALANCE_FK FOREIGN KEY (ACC_NO) REFERENCES ACCOUNT(ID)
);

-- Insert into ACCOUNT table
INSERT INTO ACCOUNT VALUES (
    430011,
    'Hasin',
    1001,
    TO_TIMESTAMP('2023-04-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2023-10-21 11:00:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO ACCOUNT VALUES (
    430012,
    'Mahtab',
    2002,
    TO_TIMESTAMP('2023-07-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2023-09-27 12:00:00', 'YYYY-MM-DD HH24:MI:SS')
);

-- Insert into TRANSACTION table
INSERT INTO TRANSACTION VALUES (
    1,
    430011,
    800.30,
    TO_TIMESTAMP('2023-03-10 04:00:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO TRANSACTION VALUES (
    2,
    430012,
    1500.70,
    TO_TIMESTAMP('2023-04-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS')
);

-- Insert into ACCOUNT_PROPERTY table
INSERT INTO ACCOUNT_PROPERTY VALUES (
    1001,
    'FirstProperty',
    0.15,
    30
);

INSERT INTO ACCOUNT_PROPERTY VALUES (
    2002,
    'SecondProperty',
    0.13,
    20
);

-- Insert into BALANCE table
INSERT INTO BALANCE VALUES (
    430011,
    7000.00,
    225.00
);

INSERT INTO BALANCE VALUES (
    430012,
    8500.00,
    325.50
);