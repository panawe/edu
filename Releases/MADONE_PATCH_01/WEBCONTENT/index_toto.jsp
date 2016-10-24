<%@ page contentType="text/html; ccharset=iso-8859-1" language="java"
	import="com.edu.bean.*" import="com.edu.model.*" import="java.util.*"
	import="com.edu.security.model.*" errorPage="index.jsp"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>iSchool</title>
<link rel="SHORTCUT ICON"  href="images/logo_icone.gif"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/coin-slider.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/droid_sans_400-droid_sans_700.font.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
</head>
<body>

<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Chercher:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="logo">
        <h1><img src="images/logo.jpg" width="200" height="50" alt="" /></h1>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.faces"><span>Accueil</span></a></li>
          <li><a href="index_ischool.faces"><span>iSCHOOL</span></a></li>
          <li><a href="index_enseignants.faces"><span>ENSEIGNANTS</span></a></li>
          <li><a href="index_parents.faces"><span>PARENTS</span></a></li>
          <li><a href="index_eleves.faces"><span>ELEVES</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> 
        <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" />        
        <span>
        	<big>TOGO</big>: Inscription en ligne, Renouvellement d'inscription, Impression de fiches d'inscription<br />
           	<big>Evaluation en ligne </big>: Generation et notification des eleves des examens/tests en ligne, Revue des resultats en ligne
        </span></a> 
        
        <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" />
        <span>
            <big>Gestion des Bulletins</big>: Interface de saisie de notes, Calcul automatique des moyennes et mentions, Impression des bulletins  <br />
        	<big>Gestion de payement de frais scolaire</big>:Suivi des tranches de payement, Alertes automatiques de rappel

          </span></a> 
        
        <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" />
        <span>
        	<big>Dossier Medical</big>: Maintient du dossier medical, Statistiques passage infirmerie et frequence des maladies<br />
       		<big>Gestion des stocks</big>: Gestion des E/S de produits, Gestion des reservations, notamment de bibliotheque<br />

          </span></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>

	<div class="content">
	<div class="content_resize">
	<div class="mainbar">
	<div class="article">
	<h2><span>Solution Complete</span> Pour Votre Etablissement</h2>
	<div class="clr"></div>
	<div class="img"><img src="images/img1.jpg" width="236"
		height="245" alt="" class="fl" /></div>
	<div class="post_content">
	<p>La gestion de votre etablissement n'aura jamais ete aussi
	facile. <strong>L'impression des bulletins et le calcul des
	moyennes</strong> se fait automatiquement apres la saisie des notes a travers
	une interface conviviale. Grace au <strong>module complet de
	gestion de stocks</strong>, vous pouvez suivre les commandes de l'etablissement,
	mettre a jour les stocks de l'etablissement, suivre les emprunts des
	livres de la bibliotheque ou encore donner la possibilite aux eleves et
	professeurs de soumettre des demandes d'emprunt des livres. Le
	processus de l'inscription est simplifie avec un module de demande d'<strong><a
		href="index_inscription.faces">inscription en ligne</a> </strong>et un module
	de renouvellement d'inscription des anciens eleves simple d'usage. Les
	eleves et leurs parents seront davantage proche avec un <strong>gestionnaire
	des correspondances</strong> integre au systeme.
	<p>Un module complet d'<strong>examens en ligne</strong> permet de
	aux eleves de reviser leur lecons ou de passer des examens en ligne</p>
	<p class="spec"><a href="index_completesolution.faces" class="rm">Lire
	la suite</a></p>
	</div>
	<div class="clr"></div>
	</div>
	<div class="article">
	<h2><span>Les Parents et Eleves</span> Seront Combles</h2>
	<div class="clr"></div>
	<div class="img"><img src="images/img2.jpg" width="236"
		height="245" alt="" class="fl" /></div>
	<div class="post_content">
	<p>Le <strong>dossier complet de l'eleve est disponible en
	ligne</strong> et consultable par aussi les parents que par l'eleve lui-meme. Ce
	dossier inclu les notes et moyennes, les informations disciplinaires
	telles que les retards, absenses ou punitions, les recompenses et
	reconnaissances, l'emploi du temps, les examptions et informations
	medicales, pour ne citer que ceux-la.
	<p>Les parents ainsi que le corps medical de l'etablissent on a
	leur disposition une interface pour mettre a jour le <strong>dossier
	medical de l'eleve</strong> facilitant ainsi l'acces rapide aux soins adequat et
	evitant d'eventuelles erreurs medicales.</p>
	<p class="spec"><a href="index_parentscombles.faces" class="rm">Lire
	la suite</a></p>
	</div>
	<div class="clr"></div>
	</div>
	</div>
	<div class="sidebar">
	<div class="gadget">
	<h2 class="star"><span>Connexion</span></h2>
	<div class="clr"></div>
</div>
	<div class="gadget">
	<h2 class="star"><span>Je veux...</span></h2>
	<div class="clr"></div>
	<ul class="ex_menu">
		<li><a href="index_inscription.faces">M'inscrire en ligne</a><br />
		Soumettez votre demande d'inscription a une ecole</li>
		<li><a href="index_demo.faces">Essayer iSchool</a><br />
		Un compte d'essai vous permet d'acceder au systeme demo</li>
		<li><a href="index_feedback.faces">Donner mon feedback</a><br />
		Dites nous comment nous pouvons ameliorer iSchool. Votre avis compte.</li>
	</ul>
	</div>
	</div>
	<div class="clr"></div>
	</div>
	</div>


<div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Quelques</span> Images</h2>
        <a href="files/img_94.jpg"><img src="files/img_94.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="files/img_3.jpg"><img src="files/img_3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="files/img_56.jpg"><img src="files/img_56.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="files/img_36.jpg"><img src="files/img_36.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="files/img_79.jpg"><img src="files/img_79.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="files/img_91.jpg"><img src="files/img_91.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2><span>Les </span> Fonctionnalites</h2>
        <p>iSchool est une application riche de fonctionalites vous permettant de gerer electroniquement votre etablissement. </p>
        <ul class="fbg_ul">
          <li>Inscription en ligne.</li>
          <li>Impression de bulletins et classement en ligne.</li>
          <li>Gestion de la bibliotheque, infirmerie, et des stocks.</li>
          <li>Gestion des payements, Courrier, et alertes.</li>
        </ul>
      </div> 
      <div class="col c3">
        <h2><span>Nous</span> Contacter</h2>
        <p>Nous avons une equipe dediee pour repondre a vos questions et vous porter assistance.</p>
        <p class="contact_info"> <span>USA:</span> 925 WHITLOCK AVE, Atlanta, GA<br />
          <span>Telephone:</span> +1 678-314-5397<br />
          <span>TOGO:</span> Tour IPNET, Lossossime, Lomé <br />
          <span>Telephone:</span>+228 2253 57 55<br />
          <span>E-mail:</span> <a href="#">esoftsystemsinc@gmail.com</a> </p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
</div>

</body>
</html>
