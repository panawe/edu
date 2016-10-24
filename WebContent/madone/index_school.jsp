<%@include file="/madone/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper">
	<div id="featured_slide" class="clear"><!-- ###### -->
	<div class="overlay_left"></div>
	<div id="featured_content">
	<div class="featured_box" id="fc1"><img src="images/1.jpg" alt="" />
	<div class="floater">
	<h2>Ecole moderne</h2>
	<p>Situee en plein coeur du centre des affaires, pres de la Lonato,
	nous sommes leader en matier de l'education primaire....</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc2"><img src="images/2.jpg" alt="" />
	<div class="floater">
	<h2>Excellence avant tout</h2>
	<p>Nous avons le meilleur taux de reussite au CEPD au Togo. les
	eleves benefient d'un cadre adequat a leur epanouissement...</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc3"><img src="images/3.jpg" alt="" />
	<div class="floater">
	<h2>Il n'ya pas que les etudes</h2>
	<p>Nous organisons regulierement des activites recreatives pour
	l'epanouissement des eleves: Piscine, Karate, ....</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc4"><img src="images/4.jpg" alt="" />
	<div class="floater">
	<h2>Le dossier complet en Ligne</h2>
	<p>Nous disposant de la solution iSchool vous permettant de
	consulter le dossier complet de vos enfants en ligne.</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc5"><img src="images/5.jpg" alt="" />
	<div class="floater">
	<h2>Fetes de fin d'annee!</h2>
	<p>Dans le cadre de la proclamation des resultats, nous vous
	invitons ce vendredi 4 Juin a 17h...</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	</div>
	<ul id="featured_tabs">
		<li><a href="#fc1">A Propos de la Madone</a></li>
		<li><a href="#fc2">Pourquoi Choisir la Madone</a></li>
		<li><a href="#fc3">Education et vie des eleves</a></li>
		<li><a href="#fc4">Consulter mon dossier</a></li>
		<li class="last"><a href="#fc5">Dernieres Nouvelles &amp;
		Evenements </a></li>
	</ul>
	<div class="overlay_right"></div>
	<!-- ###### --></div>
	</div>
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear"><!-- ####################################################################################################### -->
	<div id="homepage" class="clear"><!-- ###### -->
	<div id="left_column">
	<h2>Futurs Eleves</h2>
	<div class="imgholder"><a href="index_inscription.faces"><img
		src="images/register_online.jpg" alt="" /></a></div>
	<h2>Eleves Inscrits - Connectez-vous</h2>
	<div class="connexion"><a4j:form>
		<font color="blue">
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
				<td></td>
				<td align="right"><font color="yellow"><h:outputText
					value="#{userBean.errorMessage}" /></font></td>
			</tr>
		</table>
		</font>
	</a4j:form></div>
	</div>
	<!-- ###### -->
	<div id="latestnews">
	<h2>Nouvelles &amp; Evenements</h2>
	<ul>
		<li class="clear">
		<div class="imgl"><img src="images/news1.jpg" alt="" /></div>
		<div class="latestnews">
		<p><a href="#">Fetes de fin d'annee!</a></p>
		<p>Enfin venu le temps de savourer le fruit de votre dur labeur.
		Veuillez vous presenter a l'ecole la madone pour la proclamation des
		resultats de fin d'annee...</p>
		</div>
		</li>
		<li class="clear">
		<div class="imgl"><img src="images/news2.jpg" alt="" /></div>
		<div class="latestnews">
		<p><a href="#">Femme de l'annee.</a></p>
		<p>La directrice de l'ecole la Madone elue femme de l'annee 2012.
		Cela temoigne du succes de l'ecole et le credit va egalement a tous le
		personnel devoue...</p>
		</div>
		</li>
	</ul>
	<p class="readmore"><a href="#">Cliquez ici pour voir toutes
	les nouvelles &raquo;</a></p>
	</div>
	<!-- ###### -->
	<div id="right_column">
	<div class="holder">
	<h2>Mot de la directrice</h2>
	<a href="#"><img src="images/demo/video.gif" alt="" /></a></div>
	<div class="holder">
	<h2>Faire le tour de l'ecole</h2>
	<div class="apply"><a href="#"><img src="images/tour.jpg"
		alt="" /> <strong>Visite Virtuelle</strong></a></div>
	</div>
	</div>
	<!-- ###### --></div>

	<!-- ####################################################################################################### -->
	</div>
	</div>
	</div>

</f:view>
<%@include file="/madone/includes/footer.jsp"%>