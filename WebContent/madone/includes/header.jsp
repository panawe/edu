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
<head profile="http://gmpg.org/xfn/11">
<title>Ecole La Madone</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="SHORTCUT ICON"  href="images/logo_icone.gif"/>
<link rel="stylesheet" href="madone/styles/layout.css" type="text/css" />
<!-- Homepage Specific Elements -->
<script type="text/javascript" src="madone/scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="madone/scripts/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="madone/scripts/jquery.tabs.setup.js"></script>
<!-- End Homepage Specific Elements -->
<script>
 	var buttonClicked = false;
</script>
</head>
<body id="top">
<div class="wrapper row1">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="index.faces"><font size="28px">Ecole du Siecle 21</font></a></h1>
      <p>Travail - Discipline - Amitie - Epanouissement</p>
    </div>
    <div class="fl_right">
      <ul>
        <li><a href="index.faces">Accueil</a></li>
        <li><a href="index_md_inscription.faces">Inscription En Ligne</a></li>
        <li><a href="index_md_contact.faces">Contact</a></li>
        <li class="last"><a href="index.faces#middle">Connexion</a></li>
      </ul>
      <form action="#" method="post" id="sitesearch">
        <fieldset>
          <strong></strong>
          <input type="text" value="Rechercher&hellip;" onfocus="this.value=(this.value=='Rechercher&hellip;')? '' : this.value ;" />
          <input type="image" src="madone/images/search.gif" id="search" alt="Search" />
        </fieldset>
      </form>
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row2">
  <div class="rnd">
    <!-- ###### -->
    <div id="topnav">
      <ul>
        <li class="active"><a href="index.faces">Accueil</a></li>
        <li><a href="index_md_fourniture.faces">Fournitures</a></li>
        <li><a href="index_md_program.faces">Programmes</a></li>
        <li><a href="index_md_personnel.faces">Personnel</a></li>
        <li><a href="index_md_results.faces">Resultats</a></li>
        <li class="last"><a href="index_md_fees.faces">Frais</a></li>
      </ul>
    </div>
    <!-- ###### -->
  </div>
</div>