alter table PARENT add CITY VARCHAR(150);
alter table PARENT add PROFESSION VARCHAR(100);
alter table PARENT add WORKPLACE VARCHAR(100);
alter table STUDENT drop FATHER_FULL_NAME;
alter table STUDENT drop MOTHER_FULL_NAME;
alter table STUDENT drop TUTOR_FULL_NAME;
alter table STUDENT drop FATHER_ADDRESS;
alter table STUDENT drop FATHER_CITY;
alter table STUDENT drop FATHER_E_MAIL;
alter table STUDENT drop MOTHER_ADDRESS;
alter table STUDENT drop MOTHER_CITY;
alter table STUDENT drop MOTHER_E_MAIL;
alter table STUDENT drop TUTOR_ADDRESS;
alter table STUDENT drop TUTOR_CITY;
alter table STUDENT drop TUTOR_E_MAIL;
alter table STUDENT drop FATHER_PHONE;
alter table STUDENT drop MOTHER_PHONE;
alter table STUDENT drop TUTOR_PHONE;
alter table STUDENT drop FATHER_COUNTRY;
alter table STUDENT drop MOTHER_COUNTRY;
alter table STUDENT drop TUTOR_COUNTRY;
alter table STUDENT drop MOTHER_WORK_PLACE;
alter table STUDENT drop FATHER_WORK_PLACE;
alter table STUDENT drop FATHER_PROFESSION;
alter table STUDENT drop MOTHER_PROFESSION;
alter table PARENT modify COUNTRY_ID BIGINT NULL;
ALTER TABLE PARENT_STUDENT ADD CONSTRAINT FK_PARENT_STUDENT_1 FOREIGN KEY (PARENT_ID)
REFERENCES PARENT (PARENT_ID);
ALTER TABLE PARENT_STUDENT ADD CONSTRAINT FK_PARENT_STUDENT_2 FOREIGN KEY (STUDENT_ID)
REFERENCES STUDENT (STUDENT_ID);
alter table SCHOOL add BAREM INT NULL DEFAULT 20;
ALTER TABLE SCHOOL ADD DISPLAY_RANG TINYINT NULL DEFAULT 0;
UPDATE SCHOOL SET BAREM=10;
UPDATE TERM SET NAME ='1-Octobre EV' WHERE TERM_ID =1;
UPDATE TERM SET NAME ='2-Novembre EV' WHERE TERM_ID =2;
UPDATE TERM SET NAME ='3-Decembre Composition' WHERE TERM_ID =3;
UPDATE TERM SET NAME ='4-Janvier EV' WHERE TERM_ID =4;
UPDATE TERM SET NAME ='5-Fevrier EV' WHERE TERM_ID =5;
UPDATE TERM SET NAME ='6-Mars Composition' WHERE TERM_ID =6;
UPDATE TERM SET NAME ='7-Avril EV' WHERE TERM_ID =7;
UPDATE TERM SET NAME ='8-Mai EV' WHERE TERM_ID =8;
UPDATE TERM SET NAME ='9-Juin Passage' WHERE TERM_ID =9;
UPDATE SCHOOL SET DIRECTOR ='G. N. TOMEGAH';

INSERT INTO MENU (SCHOOL_ID,SECURITY_CODE,MENU_ID,`PARENT_MENU_ID`, `NAME`, `DESCRIPTION`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `URL`)
VALUES 
(1,58,58,6,'Statistiques Annuelles Eleve','Statistiques Annuelles Eleve',now(),now(),1,'dispatch?link=report&reportName=StatistiquesAnnuellesStudent'),
(1,59,59,6,'Statistiques Annuelles Classe','Statistiques Annuelles Classe',now(),now(),1,'dispatch?link=report&reportName=StatistiquesAnnuellesClasse'),
(1,60,60,6,'Classement Mensuel','Classement Mensuel',now(),now(),1,'dispatch?link=report&reportName=classementMensuel'),
(1,61,61,6,'Classement Trimestriel','Classement Trimestriel',now(),now(),1,'dispatch?link=report&reportName=classementTrimestriel'),
(1,62,62,6,'Classement Annuel','Classement Annuel',now(),now(),1,'dispatch?link=report&reportName=classementAnnuel');

INSERT INTO ROLES_MENU (SCHOOL_ID,`ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) VALUES
(1,1,58,now(),now(),1,1),(1,1,59,now(),now(),1,1),(1,1,60,now(),now(),1,1),(1,1,61,now(),now(),1,1),(1,1,62,now(),now(),1,1);

INSERT INTO ROLES_MENU (SCHOOL_ID,`ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) VALUES
(1,2,58,now(),now(),1,1),(1,2,59,now(),now(),1,1),(1,2,60,now(),now(),1,1),(1,2,61,now(),now(),1,1),(1,2,62,now(),now(),1,1);

INSERT INTO ROLES_MENU (SCHOOL_ID,`ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) VALUES
(1,4,58,now(),now(),1,1),(1,4,59,now(),now(),1,1),(1,4,60,now(),now(),1,1),(1,4,61,now(),now(),1,1),(1,4,62,now(),now(),1,1);

COMMIT;


