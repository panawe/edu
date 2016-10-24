<%@include file="/WEB-INF/includes/headerstatic.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
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
		<li><a href="index_feedback.faces">Donner mon feedback</a><br />
		Dites nous comment nous pouvons ameliorer iSchool. Votre avis compte.</li>
	</ul>
	</div>
	</div>
	<div class="clr"></div>
	</div>
	</div>

</f:view>
<%@include file="/WEB-INF/includes/footerstatic.jsp"%>