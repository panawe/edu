
<%@include file="/WEB-INF/includes/headerandjq.jsp"%>

<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/topmenustatic_nopic.jsp"%>
	<div class="menu_nav">
	<ul>
		<li><a href="index.faces"><span>Accueil</span></a></li>
		<li class="active"><a href="index_ischool.faces"><span>iSCHOOL</span></a></li>
		<li><a href="index_enseignants.faces"><span>ENSEIGNANTS</span></a></li>
		<li><a href="index_parents.faces"><span>PARENTS</span></a></li>
		<li><a href="index_eleves.faces"><span>ELEVES</span></a></li>
	</ul>
	</div>
	</div>
	</div>
	<div class="content">
	<div class="content_resize">
	<div class="fullmainbar">
	<img alt="iSchool" src="images/flyer_small.jpg">
	
	</div>

	<div class="clr"></div>
	</div>
	</div>
</f:view>
	<%@include file="/WEB-INF/includes/footerstatic.jsp"%>
