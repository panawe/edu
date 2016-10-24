<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
				id="bulletinPanel">
				<rich:tab id="schoolDetail" label="#{msg.calculateTerm}">
					<%@include file="/WEB-INF/jsfIncludes/searchBulletin.jsp"%>
				</rich:tab>
				<rich:tab id="schoolDetail3" label="#{msg.calculateTermGroup}">
					<%@include file="/WEB-INF/jsfIncludes/calculateGroup.jsp"%>
				</rich:tab>
				<rich:tab id="schoolDetail2" label="#{msg.calculateYear}">
					<%@include file="/WEB-INF/jsfIncludes/calculateYear.jsp"%>
				</rich:tab>
			</rich:tabPanel>
			
				<rich:modalPanel id="waitStudent" autosized="true" width="200"
		height="120" moveable="false" resizeable="false">
		<f:facet name="header">
			<h:outputText value="#{msg.operationInProgress }" />
		</f:facet>
		<h:outputText value="#{msg.oneMomentPlease }" />
	</rich:modalPanel>
			</td>
	</tr>


	<a4j:status id="status1"
		onstart="if (buttonClicked) {#{rich:component('waitStudent')}.show()}"
		onstop="buttonClicked = false; #{rich:component('waitStudent')}.hide()" />

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>