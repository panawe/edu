ALTER TABLE SCHOOL DROP BAREM;
ALTER TABLE SCHOOL ADD BAREM_PRIMAIRE  INT NULL DEFAULT 10;
ALTER TABLE SCHOOL ADD BAREM_COLLEGE  INT NULL DEFAULT 20;

DELETE FROM ROLES_MENU;
DELETE FROM MENU;

INSERT INTO `MENU` (`MENU_ID`, `SCHOOL_ID`, `PARENT_MENU_ID`, `NAME`, `SECURITY_CODE`, `DESCRIPTION`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `URL`) VALUES
(1, 1, NULL, 'Dossiers', 1, 'Dossiers', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(2, 1, NULL, 'Tests En Ligne', 2, 'Tests En Ligne', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(3, 1, NULL, 'Notes', 3, 'Notes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(4, 1, NULL, 'Stocks', 4, 'Stocks', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(5, 1, NULL, 'Suivi', 5, 'Suivi', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(6, 1, NULL, 'Etat', 6, 'Etat', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(7, 1, NULL, 'Configuration', 7, 'Configuration', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(8, 1, NULL, 'Infirmerie', 8, 'Infirmerie', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(9, 1, 1, 'Eleve', 9, 'Eleve', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=student'),
(10, 1, 1, 'Professeur', 10, 'Professeur', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=teacher'),
(11, 1, 1, 'Correspondance', 11, 'Correspondance', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=correspondance'),
(12, 1, 1, 'Inscriptions', 12, 'Inscriptions', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=inscriptions'),
(13, 1, 2, 'Questions', 13, 'Questions', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=question'),
(14, 1, 2, 'Tests', 14, 'Tests', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=onlineTest'),
(15, 1, 3, 'Saisie de notes', 15, 'Saisie de notes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=exam'),
(16, 1, 3, 'Calcul des Moyennes', 16, 'Calcul des Moyennes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=imprimerBulletin'),
(17, 1, 3, 'Visualiser les resultats', 17, 'Visualiser les resultats', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=classementEnLigne'),
(18, 1, 4, 'Commandes', 18, 'Commandes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=commandes'),
(19, 1, 4, 'Produits', 19, 'Produits', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=produits'),
(20, 1, 4, 'Demandes', 20, 'Demandes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=demandes'),
(21, 1, 4, 'Configuration', 21, 'Configuration', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=configStock'),
(22, 1, 5, 'Retards de payment', 22, 'Retards de payment', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=paymentDue'),
(23, 1, 5, 'Configurer les Alerts', 23, 'Configurer les Alerts', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=alerts'),
(24, 1, 7, 'Tranche de payment', 24, 'Tranche de payment', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=tuition'),
(25, 1, 7, 'Mon Etablissement', 25, 'Mon Etablissement', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=school'),
(27, 1, 7, 'Cours', 27, 'Cours', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=course'),
(28, 1, 7, 'Securite', 28, 'Securite', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=security'),
(29, 1, 7, 'Configurer les Etablissements', 29, 'Configurer les Etablissements', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=autre'),
(30, 1, 7, 'Creer un Etablissement', 30, 'Creer un Etablissement', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=createSchool'),
(31, 1, 500, 'Documentation', 31, 'Documentation', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=documentation'),
(32, 1, 500, 'A Propos', 32, 'A Propos', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=apropos'),
(500, 1, NULL, 'Aide', 500, 'Aide', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(44, 1, 8, 'Consultation', 44, 'Consultation', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=consultation'),
(45, 1, 8, 'Configuration', 45, 'Configuration', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=configMed'),
(46, 1, 3, 'Verrouiler/Publier les resultats', 46, 'Verrouiler/Publier les resultats', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=impressionBulletin'),
(50, 1, 1, 'Parent', 50, 'Parent', '2013-04-23 04:15:21', '2013-04-23 04:15:21', 1, 'dispatch?link=parent'),

(40, 1,6, 'Inventaire des Stocks', 40, 'Inventaire des Stock', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=Inventaire'),
(41, 1, 6, 'Etat des Demandes', 41, 'Etat des Demandes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=EtatDemandes'),
(42, 1, 6, 'Etat des Commandes', 42, 'Etat des Commandes', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=EtatCommandes'),
(51, 1, 6, 'Etat Financier Classe', 51, 'Etat Financier Classe', '2013-12-02 02:41:22', '2013-12-02 02:41:22', 1, 'dispatch?link=report&reportName=etatFinancierClasseFrais'),
(52, 1, 6, 'Etat Financier Global', 52, 'Etat Financier Global', '2013-05-04 04:10:59', '2013-05-04 04:26:14', 2, 'dispatch?link=report&reportName=etatFinancierSchool'),

(300, 1, NULL, 'Primaire', 300, 'Primaire', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(301, 1, 300, 'Bulletin Mensuel Classe', 301, 'Bulletin Mensuel Classe', '2013-10-20 06:11:52', '2013-10-20 06:11:52', 1, 'dispatch?link=report&reportName=bulletinMensuelClasse'),
(302, 1, 300, 'Bulletin Mensuel Eleve', 302, 'Bulletin Mensuel Eleve', '2013-10-20 06:11:52', '2013-10-20 06:11:52', 1, 'dispatch?link=report&reportName=bulletinMensuelStudent'),
(303, 1, 300, 'Bulletin Trimestriel Classe', 303, 'Bulletin Trimestriel Classe', '2013-10-14 02:42:44', '2013-10-14 02:42:44', 1, 'dispatch?link=report&reportName=bulletinTrimestrielClasse'),
(304, 1, 300, 'Bulletin Trimestriel Eleve', 304, 'Bulletin Trimestriel Eleve', '2013-10-14 02:42:44', '2013-10-14 02:42:44', 1, 'dispatch?link=report&reportName=bulletinTrimestrielStudent'),
(305, 1, 300, 'Bulletin Annuel Classe', 305, 'Bulletin Annuel Classe', '2013-10-14 02:42:44', '2013-10-14 02:42:44', 1, 'dispatch?link=report&reportName=bulletinAnnuelClasse'),
(306, 1, 300, 'Bulletin Annuel Eleve', 306, 'Bulletin Annuel Eleve', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=bulletinAnnuel'),
(307, 1, 300, 'Classement Mensuel', 307, 'Classement Mensuel', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=classementMensuel'),
(308, 1, 300, 'Classement Trimestriel', 308, 'Classement Trimestriel', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=classementTrimestriel'),
(309, 1, 300, 'Classement Annuel', 309, 'Classement Annuel', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=classementAnnuel'),
(310, 1, 300, 'Statistiques Annuelles Matiere', 310, 'Statistiques Annuelles Matiere', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=StatistiquesParEcoleParMatiere'),
(311, 1, 300, 'Statistiques Annuelles Eleve', 311, 'Statistiques Annuelles Eleve', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=StatistiquesAnnuellesStudent'),
(312, 1, 300, 'Statistiques Annuelles Classe', 312, 'Statistiques Annuelles Classe', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=StatistiquesAnnuellesClasse'),

(400, 1, NULL, 'College/Lycee', 400, 'College/Lycee', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, '#'),
(401, 1, 400, 'Bulletin Trimestriel Classe Format1', 401, 'Bulletin Trimestriel Classe Format1', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=bulletinClasse1'),
(402, 1, 400, 'Bulletin Trimestriel Eleve Format1', 402, 'Bulletin Trimestriel Eleve Format1', '2013-05-10 04:50:17', '2013-05-10 04:45:51', 1, 'dispatch?link=report&reportName=bulletinStudent1'),
(403, 1, 400, 'Bulletin Trimestriel Classe Format2', 403, 'Bulletin Trimestriel Classe Format2', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=bulletinClasse2'),
(404, 1, 400, 'Bulletin Trimestriel Eleve Format2', 404, 'Bulletin Trimestriel Eleve Format2', '2013-05-10 04:50:17', '2013-05-10 04:45:51', 1, 'dispatch?link=report&reportName=bulletinStudent2'),
(405, 1, 400, 'Classement Trimestriel', 405, 'Classement Trimestriel', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=classementMensuelCollege'),
(406, 1, 400, 'Statistiques Annuelles Matiere', 406, 'Statistiques par Matiere', '2013-04-20 05:31:08', '2013-04-20 05:31:08', 1, 'dispatch?link=report&reportName=StatistiquesParEcoleParMatiereCollege'),
(407, 1, 400, 'Statistiques Annuelles Eleve', 407, 'Statistiques Annuelles Eleve', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=StatistiquesAnnuellesStudentCollege'),
(408, 1, 400, 'Statistiques Annuelles Classe', 408, 'Statistiques Annuelles Classe', '2013-11-04 00:40:21', '2013-11-04 00:40:21', 1, 'dispatch?link=report&reportName=StatistiquesAnnuellesClasseCollege');

INSERT INTO `ROLES_MENU` (`SCHOOL_ID`, `ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) 
SELECT 1,1,MENU_ID, NOW(), NOW(),1,1 FROM MENU;

INSERT INTO `ROLES_MENU` (`SCHOOL_ID`, `ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) 
SELECT 1,2,MENU_ID, NOW(), NOW(),1,1 FROM MENU WHERE MENU_ID NOT IN (29,30);

INSERT INTO `ROLES_MENU` (`SCHOOL_ID`, `ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) 
SELECT 1,3,MENU_ID, NOW(), NOW(),1,1 FROM MENU WHERE MENU_ID  IN (9,17);

INSERT INTO `ROLES_MENU` (`SCHOOL_ID`, `ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) 
SELECT 1,4,MENU_ID, NOW(), NOW(),1,1 FROM MENU WHERE MENU_ID  NOT IN (28,29,30,8);

INSERT INTO `ROLES_MENU` (`SCHOOL_ID`, `ROLE_ID`, `MENU_ID`, `CREATE_DATE`, `MOD_DATE`, `MOD_BY`, `ACCESS_LEVEL`) 
SELECT 1,5,MENU_ID, NOW(), NOW(),1,1 FROM MENU WHERE MENU_ID  IN (8);
COMMIT;

UPDATE PARAMETER SET DISPLAY_NAME = 'Mois/Trimestre' WHERE DISPLAY_NAME ='Mois';

COMMIT;
