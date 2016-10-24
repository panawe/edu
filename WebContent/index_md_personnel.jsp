<%@include file="school/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear"><!-- ####################################################################################################### -->
	<h1>Un personnel qualifie au service des eleves</h1>
	<a4j:form>
		<rich:dataGrid value="#{teacherBean.teachers}" var="teacher"
			rendered="#{teacherBean.rowCount>0}" id="personnelGrid" columns="4"
			elements="8" width="100%">
			<a4j:mediaOutput id="TeacherPhotoHeader2" element="img"
				mimeType="image/gif" style="width:220px; height:190px;"
				createContent="#{teacherBean.paintTeacherById}"
				value="#{teacher.id}" cacheable="false">
			</a4j:mediaOutput>
			<h2>
			<h:outputText value="#{teacher.firstName } #{teacher.lastName }" />
			<h:outputText rendered="#{not empty teacher.nickName }" value=" - #{teacher.nickName } " />
			</h2>
			<h:outputText rendered="#{not empty teacher.position }"
				value="#{teacher.position} - " />
			<h:outputText value="#{teacher.resume}" />
			<f:facet name="footer">
				<rich:datascroller></rich:datascroller>
			</f:facet>
		</rich:dataGrid>

	</a4j:form></div>
	</div>
	</div>

	<!-- ####################################################################################################### -->
</f:view>
<%@include file="school/includes/footer.jsp"%>