CREATE SEQUENCE SERIAL_GENERATOR
    MINVALUE 1
    MAXVALUE 9999999
    START WITH 100000
    INCREMENT BY 1
    CACHE 20;

CREATE OR REPLACE FUNCTION GET_ACCOUNT_ID(
    NAME IN VARCHAR2(20),
    ACC_CODE IN NUMBER,
    OPENING_DATE IN TIMESTAMP
) RETURNS VARCHAR(30) IS
    NAMESTR         VARCHAR(3);
    ACC_CODESTR     VARCHAR(3);
    OPENING_DATESTR VARCHAR(8);
    SERIAL_NO       NUMBER;
    SERIAL_NOSTR    VARCHAR(6);
    ACCOUNT_ID      VARCHAR(30);
BEGIN
    NAMESTR := UPPER(SUBSTR(NAME, 1, 3));
    ACC_CODESTR := TO_CHAR(ACC_CODE);
    OPENING_DATESTR := TO_CHAR(OPENING_DATE, 'YYYYMMDD');
    SELECT
        SERIAL_GENERATOR.NEXTVAL INTO SERIAL_NO
    FROM
        DUAL;
    SERIAL_NOSTR := TO_CHAR(SERIAL_NO);
    ACCOUNT_ID := ACC_CODESTR
                  || OPENING_DATESTR
                  || '.'
                  || NAMESTR
                  || '.'
                  || SERIAL_NOSTR;
    RETURN ACCOUNT_ID;
END;
/