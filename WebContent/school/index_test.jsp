<%@ page contentType="text/html; charset=iso-8859-1" language="java"
	import="com.edu.bean.*" import="com.edu.model.*" import="java.util.*"
	import="com.edu.security.model.*" errorPage="index.jsp"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>Academic Education | Portfolio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="scripts/jquery.tabs.setup.js"></script>
</head>
<body id="top">
<div class="wrapper row1">
  <div id="header" class="clear">
    <div class="fl_left">
      <h1><a href="index.html">Academic Education</a></h1>
      <p>Free CSS Website Template</p>
    </div>
    <div class="fl_right">
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">A - Z Index</a></li>
        <li><a href="#">Student Login</a></li>
        <li class="last"><a href="#">Staff Login</a></li>
      </ul>
      <form action="#" method="post" id="sitesearch">
        <fieldset>
          <strong>Search:</strong>
          <input type="text" value="Search Our Website&hellip;" onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
          <input type="image" src="images/search.gif" id="search" alt="Search" />
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
        <li><a href="index.html">Home</a></li>
        <li><a href="style-demo.html">Style Demo</a></li>
        <li><a href="full-width.html">Full Width</a></li>
        <li><a href="3-columns.html">3 Columns</a></li>
        <li class="active"><a href="portfolio.html">Portfolio</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="#">This a very long link</a></li>
        <li class="last"><a href="#">This is the last</a></li>
      </ul>
    </div>
    <!-- ###### -->
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row3">
  <div class="rnd">
    <div id="container" class="clear">
      <!-- ####################################################################################################### -->
      <div id="portfolio">
        <ul>
          <li><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
          <li class="last"><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
          <li><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
          <li class="last"><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
          <li><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
          <li class="last"><img src="images/demo/420x190.gif" alt="" />
            <h2>Metridiculis conseque quis</h2>
            <p>Orciinterdum condimenterdum nullamcorper elit nam curabitur laoreet met praesenean et iaculum. Metridiculis conseque quis iaculum aenean nunc aenean quis nam nis dui.</p>
            <p class="readmore"><a href="#">Read More Here &raquo;</a></p>
          </li>
        </ul>
      </div>
      <!-- ####################################################################################################### -->
      <div class="pagination">
        <ul>
          <li class="prev"><a href="#">&laquo; Previous</a></li>
          <li><a href="#">1</a></li>
          <li><a href="#">2</a></li>
          <li class="splitter">&hellip;</li>
          <li><a href="#">6</a></li>
          <li class="current">7</li>
          <li><a href="#">8</a></li>
          <li><a href="#">9</a></li>
          <li class="splitter">&hellip;</li>
          <li><a href="#">14</a></li>
          <li><a href="#">15</a></li>
          <li class="next"><a href="#">Next &raquo;</a></li>
        </ul>
      </div>
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper row4">
  <div class="rnd">
    <div id="footer" class="clear">
      <!-- ####################################################################################################### -->
      <div class="fl_left clear">
        <div class="fl_left center"><img src="images/demo/worldmap.gif" alt="" /><br />
          <a href="#">Find Us With Google Maps &raquo;</a></div>
        <address>
        Address Line 1<br />
        Address Line 2<br />
        Town/City<br />
        Postcode/Zip<br />
        <br />
        Tel: xxxx xxxx xxxxxx<br />
        Email: <a href="#">contact@domain.com</a>
        </address>
      </div>
      <div class="fl_right">
        <div id="social" class="clear">
          <p>Stay Up to Date With Whats Happening</p>
          <ul>
            <li><a style="background-position:0 0;" href="#">Twitter</a></li>
            <li><a style="background-position:-72px 0;" href="#">LinkedIn</a></li>
            <li><a style="background-position:-142px 0;" href="#">Facebook</a></li>
            <li><a style="background-position:-212px 0;" href="#">Flickr</a></li>
            <li><a style="background-position:-282px 0;" href="#">RSS</a></li>
          </ul>
        </div>
        <div id="newsletter">
          <form action="#" method="post">
            <fieldset>
              <legend>Subscribe To Our Newsletter:</legend>
              <input type="text" value="Enter Email Here&hellip;" onfocus="this.value=(this.value=='Enter Email Here&hellip;')? '' : this.value ;" />
              <input type="text" id="subscribe" value="Submit" />
            </fieldset>
          </form>
        </div>
      </div>
      <!-- ####################################################################################################### -->
    </div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
  </div>
</div>
</body>
</html>