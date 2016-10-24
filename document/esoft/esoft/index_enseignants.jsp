
<%@include file="/WEB-INF/includes/headerandjq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/topmenustatic_nopic.jsp"%>
	<div class="menu_nav">
	<ul>
		<li><a href="index.faces"><span>Accueil</span></a></li>
		<li><a href="index_ischool.faces"><span>iSCHOOL</span></a></li>
		<li class="active"><a href="index_enseignants.faces"><span>ENSEIGNANTS</span></a></li>
		<li><a href="index_parents.faces"><span>PARENTS</span></a></li>
		<li><a href="index_eleves.faces"><span>ELEVES</span></a></li>
	</ul>
	</div>
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
		href="#">inscription en ligne</a> </strong>et un module de renouvellement
	d'inscription des anciens eleves simple d'usage. Les eleves et leurs
	parents seront davantage proche avec un <strong>gestionnaire
	des correspondances</strong> integre au systeme.
	<p>Un module complet d'<strong>examens en ligne</strong> permet de
	aux eleves de reviser leur lecons ou de passer des examens en ligne.</p>

	<p>Un <strong>systeme d'alerte</strong> permet de rappeler aux
	parents, eleves et a la tresorerie d'un retard de payement de tranche
	d'ecolage. Le meme systeme d'alerte envoi un courrier electronique aux
	eleves ayant acuse un retard d'un retour d'emprunt de livre de la
	bibliotheque. Il permet egalement d'informer l'administration d'un
	eventuel rupture de stock.</p>
	<a4j:form>
		<a4j:region>
			<p class="spec"><a4j:commandLink ajaxSingle="true" id="Admin"
				action="#{userBean.validate}" reRender="MenuBar">
				<h:graphicImage value="/images/demoAdm.jpg" style="border:0" />
				<f:param name="demo" value="2" />
			</a4j:commandLink></p>
			<p class="spec"><a4j:commandLink ajaxSingle="true" id="Teacher"
				action="#{userBean.validate}" reRender="MenuBar">
				<h:graphicImage value="/images/demoEns.jpg" style="border:0" />
				<f:param name="demo" value="4" />
			</a4j:commandLink></p>
		</a4j:region>
	</a4j:form></div>
	<div class="clr"></div>
	</div>
	</div>
	<div class="sidebar">
	<div class="gadget">
	<h2 class="star"><span>Connexion</span></h2>
	<div class="clr"></div>
	<a4j:form>
		<font color="white">
		<table width="240">
			<tr>
				<td><h:outputText value="#{msg.userName}" /></td>
				<td><h:inputText value="#{userBean.user.userName}"
					id="connectUsername" /></td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.password}" /></td>
				<td><h:inputSecret value="#{userBean.user.password}"
					id="connectPassword" /></td>
			</tr>
			<tr>
				<td><a4j:commandButton value="#{msg.signin}"
					action="#{userBean.validate}" reRender="MenuBar">
				</a4j:commandButton></td>
				<td><h:outputText value="#{reportBean.dummie}" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><font color="yellow"><h:outputText
					value="#{userBean.errorMessage}" /></font></td>
			</tr>

		</table>
		</font>
	</a4j:form></div>
	<div class="gadget">
	<h2 class="star"><span>Je veux...</span></h2>
	<div class="clr"></div>
	<ul class="ex_menu">
		<li><a href="index_demo.faces">Essayer iSchool</a><br />
		Un compte d'essai vous permet d'acceder au systeme demo</li>
		<li><a href="index_feedback.faces">Donner un feedback</a><br />
		Dites nous comment nous pouvons ameliorer iSchool. Votre avis compte.</li>
	</ul>
	</div>
	</div>
	<div class="clr"></div>
	</div>
	</div>
 
</f:view>
<%@include file="/WEB-INF/includes/footerstatic.jsp"%>