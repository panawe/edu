
<%@include file="/WEB-INF/includes/headerandjq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/topmenustatic_nopic.jsp"%>
	<div class="menu_nav">
	<ul>
		<li><a href="index.faces"><span>Accueil</span></a></li>
		<li><a href="index_ischool.faces"><span>iSCHOOL</span></a></li>
		<li><a href="index_enseignants.faces"><span>ENSEIGNANTS</span></a></li>
		<li><a href="index_parents.faces"><span>PARENTS</span></a></li>
		<li class="active"><a href="index_eleves.faces"><span>ELEVES</span></a></li>
	</ul>
	</div>
	</div>
	</div>
	<div class="content">
	<div class="content_resize">
	<div class="mainbar">
	<div class="article">
	<h2><span>Meilleur Acces</span> a votre Dossier Scolaire</h2>
	<div class="clr"></div>
	<div class="img"><img src="images/img2.jpg" width="236"
		height="245" alt="" class="fl" /></div>
	<div class="post_content">
	<p>Votre <strong>dossier complet est disponible en ligne</strong>
	et consultable par vous-meme que par vos parents. Ce dossier inclu les
	notes et moyennes, les informations disciplinaires telles que les
	retards, absenses ou punitions, les recompenses et reconnaissances,
	l'emploi du temps, les examptions et informations medicales, pour ne
	citer que ceux-la.
	<p>Les parents ainsi que le corps medical de l'etablissent on a
	leur disposition une interface pour mettre a jour le <strong>dossier
	medical de l'eleve</strong> facilitant ainsi l'acces rapide aux soins adequat et
	evitant d'eventuelles erreurs medicales.</p>
	<p>Les <strong>correspondances</strong> entre l'etablissement,
	l'eleves et ses parents sont maintenues dans le dossier de l'eleve. Les
	parents et eleves ont acces a une breve description des <strong>qualites
	du corps enseignant</strong>.</p>
	<a4j:form>
		<a4j:region>
			<p class="spec"><a4j:commandLink ajaxSingle="true" id="student"
				action="#{userBean.validate}" reRender="MenuBar">
				<h:graphicImage value="/images/demo.jpg" style="border:0" />
				<f:param name="demo" value="3" />
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
		<li><a href="index_inscription.faces">M'inscrire en ligne</a><br />
		Soumettez votre demande d'inscription a une ecole</li>
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