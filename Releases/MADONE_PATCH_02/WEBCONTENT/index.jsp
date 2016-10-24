<%@include file="madone/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper">
	<div id="featured_slide" class="clear"><!-- ###### -->
	<div class="overlay_left"></div>
	<div id="featured_content">
	<div class="featured_box" id="fc1"><img src="madone/images/1.jpg"
		alt="" />
	<div class="floater">
	<h2>Ecole moderne</h2>
	<p>Situee en plein coeur du centre des affaires, pres de la Lonato,
	nous sommes leader en matier de l'education primaire....</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc2"><img src="madone/images/2.jpg"
		alt="" />
	<div class="floater">
	<h2>Excellence avant tout</h2>
	<p>Nous avons le meilleur taux de reussite au CEPD au Togo. les
	eleves benefient d'un cadre adequat a leur epanouissement...</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc3"><img src="madone/images/3.jpg"
		alt="" />
	<div class="floater">
	<h2>Il n'ya pas que les etudes</h2>
	<p>Nous organisons regulierement des activites recreatives pour
	l'epanouissement des eleves: Piscine, Karate, ....</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc4"><img src="madone/images/4.jpg"
		alt="" />
	<div class="floater">
	<h2>Le dossier complet en Ligne</h2>
	<p>Nous disposant de la solution iSchool vous permettant de
	consulter le dossier complet de vos enfants en ligne.</p>
	<p class="readmore"><a href="#">Lire la suite &raquo;</a></p>
	</div>
	</div>
	<div class="featured_box" id="fc5"><img src="madone/images/5.jpg"
		alt="" />
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

	<h2>Je suis inscrit</h2>
	<div class="connexion"><a4j:form>
		<font color="black">
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
				<td align="right"><font color="red"><h:outputText
					value="#{userBean.errorMessage}" /></font></td>
			</tr>
		</table>
		</font>
	</a4j:form></div>
		<h2>Futurs Eleves</h2>
	<div class="imgholder"><a href="index_md_inscription.faces"><img
		src="madone/images/register_online.jpg" alt="" /></a></div>
	</div>
	<!-- ###### -->
	<div id="latestnews">
	<h2>Dernieres Nouvelles</h2>
	<ul>
		<li class="clear">
		<div class="imgl"><a4j:mediaOutput id="newsPic" element="img"
			mimeType="image/gif" style="width:125px; height:125px;"
			createContent="#{newsBean.paintNewsPic}" value="#{newsBean.news1.id}"
			cacheable="false">
		</a4j:mediaOutput></div>
		<div class="latestnews">
		<p> 
		<h3><a href="index_md_topnews.faces"><h:outputText value="#{newsBean.news1.title}"/></a></h3>
		 </p>
		<p><a href="index_md_topnews.faces"><h:outputText escape="false"
			value="#{newsBean.news1.shortMessage}" /> <h:outputText
			value="#{newsBean.news1.newsDate}">
			<f:convertDateTime pattern="dd/MM/yyyy" />
		</h:outputText></a>
		<h3><h:outputText value="#{newsBean.news1.author}" /></h3>
		</p>
		</div>
		</li>
		<li class="clear">
		<div class="imgl"><a4j:mediaOutput id="newsPic2" element="img"
			mimeType="image/gif" style="width:125px; height:125px;"
			createContent="#{newsBean.paintNewsPic}" value="#{newsBean.news2.id}"
			cacheable="false">
		</a4j:mediaOutput></div>
		<div class="latestnews">
		<p>
		<h3><a href="index_md_topnews.faces"><h:outputText value="#{newsBean.news2.title}"/></a></h3>
		 
		</p>
		<p><a href="index_md_topnews.faces"><h:outputText escape="false"
			value="#{newsBean.news2.shortMessage}" /> <h:outputText
			value="#{newsBean.news2.newsDate}">
			<f:convertDateTime pattern="dd/MM/yyyy" />
		</h:outputText></a>
		<h3><h:outputText value="#{newsBean.news2.author}" /></h3>
		</p>
		</div>
		</li>
	</ul>
	<p class="readmore"><a href="index_md_news.faces">Cliquez
	ici pour voir toutes les nouvelles &raquo;</a></p>
	</div>
	<!-- ###### -->
	<div id="right_column">
	<div class="holder">
	<h2>Mot de la directrice</h2>
	<iframe width="230" height="236"
		src="http://www.youtube.com/embed/XGSy3_Czz8k"> </iframe></div>
	<div class="holder">
	<h2>Faire le tour de l'ecole</h2>
	<div class="apply"><a href="#"><img
		src="madone/images/tour.jpg" alt="" /> <strong>Visite
	Virtuelle</strong></a></div>
	</div>
	</div>
	<!-- ###### --></div>

	<!-- ####################################################################################################### -->
	</div>
	</div>
	</div>
</f:view>
<%@include file="madone/includes/footer.jsp"%>