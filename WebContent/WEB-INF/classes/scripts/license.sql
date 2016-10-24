CREATE TABLE USERS (
       USER_ID SMALLINT NOT NULL AUTO_INCREMENT
     , USER_NAME VARCHAR(15) NOT NULL
     , PASSWORD VARCHAR(15) NOT NULL
     , FIRST_NAME VARCHAR(50) NOT NULL
     , LAST_NAME VARCHAR(50) NOT NULL
     , E_MAIL VARCHAR(50)
     , CREATE_DATE TIMESTAMP NOT NULL
     , MOD_DATE TIMESTAMP NOT NULL
     , MOD_BY SMALLINT NOT NULL
     , PRIMARY KEY (USER_ID)
);

CREATE TABLE CLIENT_LICENSE (
       LICENSE_ID BIGINT NOT NULL AUTO_INCREMENT
     , CLIENT_NAME VARCHAR(250) NOT NULL
     , DATA VARCHAR(1000) NOT NULL
     , MAC VARCHAR(100) NOT NULL
     , EXPIRATION_DATE DATE NOT NULL
     , CREATE_DATE TIMESTAMP NOT NULL
     , MOD_DATE TIMESTAMP NOT NULL
     , MOD_BY SMALLINT NOT NULL
     , PRIMARY KEY (LICENSE_ID)
     , INDEX (MOD_BY)
     , CONSTRAINT FK_CATEGORIE_1 FOREIGN KEY (MOD_BY)
                  REFERENCES USERS (USER_ID)
);

