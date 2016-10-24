<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="com.edu.bean.*" import="com.edu.model.*" import="java.util.*"
	import="com.edu.security.model.*" errorPage="index.jsp"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>iSchool</title>
<LINK REL="SHORTCUT ICON"  HREF="images/logo_icone.gif">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
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
        	<big>Gestion des Inscriptions</big>: Inscription en ligne, Renouvellement d'inscription, Impression de fiches d'inscription<br />
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