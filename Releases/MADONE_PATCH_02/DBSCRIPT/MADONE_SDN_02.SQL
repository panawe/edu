INSERT INTO MENU (SCHOOL_ID,SECURITY_CODE,MENU_ID,`PARENT_MENU_ID`, `NAME`, `DESCRIPTION`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `URL`)
VALUES 
(1,53,53,6,'Bulletin Annuel Classe','Bulletin Annuel Classe',now(),now(),1,'dispatch?link=report&reportName=bulletinAnnuelClasse'),
(1,54,54,6,'Bulletin Trimestriel Individuel','Bulletin Trimestriel Individuel',now(),now(),1,'dispatch?link=report&reportName=bulletinTrimestrielStudent'),
(1,55,55,6,'Bulletin Trimestriel Classe','Bulletin Trimestriel Classe',now(),now(),1,'dispatch?link=report&reportName=bulletinTrimestrielClasse');

INSERT INTO ROLES_MENU (SCHOOL_ID,`ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) VALUES
(1,1,53,now(),now(),1,1),(1,1,54,now(),now(),1,1),(1,1,55,now(),now(),1,1);

INSERT INTO ROLES_MENU (SCHOOL_ID,`ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) VALUES
(1,2,53,now(),now(),1,1),(1,2,54,now(),now(),1,1),(1,2,55,now(),now(),1,1);

INSERT INTO ROLES_MENU (SCHOOL_ID,`ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) VALUES
(1,4,53,now(),now(),1,1),(1,4,54,now(),now(),1,1),(1,4,55,now(),now(),1,1);

INSERT INTO PARAMETER (SCHOOL_ID, NAME, DISPLAY_NAME,DATA_TYPE, INPUT_TYPE, 
PARAMETER_SQL, PARAMETER_VALUES,MAX_LENGTH, SIZE, CREATE_DATE, MOD_DATE, MOD_BY)
VALUES 
(1,'termGroupId','Trimestre','Long', 'List','SELECT CAST(TERM_GROUP_ID AS CHAR), NAME FROM TERM_GROUP ORDER BY TERM_GROUP_ID',null,null,null, NOW(), NOW(),1);

COMMIT;