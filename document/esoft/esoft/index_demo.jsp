<%@include file="/WEB-INF/includes/headerandjq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/topmenustatic_nopic.jsp"%>
	<div class="menu_nav">
	<ul>
		<li class="active"><a href="index.faces"><span>Accueil</span></a></li>
		<li><a href="index_ischool.faces"><span>iSCHOOL</span></a></li>
		<li><a href="index_enseignants.faces"><span>ENSEIGNANTS</span></a></li>
		<li><a href="index_parents.faces"><span>PARENTS</span></a></li>
		<li><a href="index_eleves.faces"><span>ELEVES</span></a></li>
	</ul>
	</div>
	</div>
	</div>
	<div class="content">
	<div class="content_resize">
	<div class="fullmainbar"><a4j:form>
		<a4j:region>
			<table width="100%" border="0" cellspacing="10">

				<tr>
					<td><a4j:commandLink ajaxSingle="true" id="admin"
						action="#{userBean.validate}" reRender="MenuBar">
						<h:graphicImage value="/images/demoAdmin.jpg" style="border:0" />
						<f:param name="demo" value="2" />
					</a4j:commandLink></td>
				</tr>
				<tr>
					<td><a4j:commandLink ajaxSingle="true" id="student"
						action="#{userBean.validate}" reRender="MenuBar">
						<h:graphicImage value="/images/demoStudent.jpg" style="border:0" />
						<f:param name="demo" value="3" />
					</a4j:commandLink></td>
				</tr>
				<tr>
					<td><a4j:commandLink ajaxSingle="true" id="teacher"
						action="#{userBean.validate}" reRender="MenuBar">
						<h:graphicImage value="/images/demoTeacher.jpg" style="border:0" />
						<f:param name="demo" value="4" />
					</a4j:commandLink></td>
				</tr>
				<tr>
					<td><a4j:commandLink ajaxSingle="true" id="infirmier"
						action="#{userBean.validate}" reRender="MenuBar">
						<h:graphicImage value="/images/demoInfirmier.jpg" style="border:0" />
						<f:param name="demo" value="5" />
					</a4j:commandLink></td>
				</tr>

			</table>

		</a4j:region>
	</a4j:form></div>

	<div class="clr"></div>
	</div>
	</div>
</f:view>
	<%@include file="/WEB-INF/includes/footerstatic.jsp"%>
