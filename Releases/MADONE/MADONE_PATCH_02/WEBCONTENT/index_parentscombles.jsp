<%@include file="/WEB-INF/includes/headerstatic.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Les Parents et Eleves</span> Seront Combles</h2>
          <div class="clr"></div>
          <div class="img"><img src="images/img2.jpg" width="236" height="245" alt="" class="fl" /></div>
          <div class="post_content">
            <p>Le <strong>dossier complet de l'eleve est disponible en ligne</strong>
             et consultable par aussi les parents que par l'eleve lui-meme. Ce dossier inclu les notes et moyennes, les informations disciplinaires telles que les retards, absenses ou punitions,
             les recompenses et reconnaissances, l'emploi du temps, les examptions et informations medicales, pour ne citer que ceux-la.
             <p>
             Les parents ainsi que le corps medical de l'etablissent on a leur disposition une interface pour mettre a jour le <strong>dossier medical de l'eleve</strong> facilitant ainsi l'acces rapide aux soins adequat et evitant d'eventuelles erreurs medicales.
              </p>
              <p>
              Les <strong>correspondances</strong> entre l'etablissement, l'eleves et ses parents sont maintenues dans le dossier de l'eleve.
              Les parents et eleves ont acces a une breve description des <strong>qualites du corps enseignant</strong>.
              </p>
           </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Connexion</span> </h2>
          <div class="clr"></div>
          <a4j:form> <font color="white">
          							<table width="240">
								<tr>
									<td><h:outputText value="#{msg.userName}" /></td>
									<td><h:inputText value="#{userBean.user.userName}"
										id="connectUsername" /></td>
								</tr>
								<tr>
									<td><h:outputText value="#{msg.password}" /></td>
									<td><h:inputSecret value="#{userBean.user.password}"
										id="connectPassword" /> </td>
								</tr>
								<tr>
									<td><a4j:commandButton value="#{msg.signin}"
										action="#{userBean.validate}" reRender="MenuBar">
									</a4j:commandButton></td>
									<td><h:outputText value="#{reportBean.dummie}"/> </td>
								</tr>
								<tr>
									<td colspan="2" align="right"><font color="yellow"><h:outputText value="#{userBean.errorMessage}" /></font></td>
								</tr>								
									 
							</table>
							</font>
							</a4j:form>
        </div>
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