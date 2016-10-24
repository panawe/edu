<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top">
				<rich:modalPanel id="tabLoading" autosized="true" width="100"
			height="40" moveable="false" resizeable="false">
			<f:facet name="header">
				<h:outputText value="#{msg.operationInProgress }" />
			</f:facet>
			<h:outputText value="#{msg.oneMomentPlease }" />
		</rich:modalPanel> <a4j:status id="status" forceId="true"
			onstart="#{rich:component('tabLoading')}.show()"
			onstop="#{rich:component('tabLoading')}.hide()" />
		<rich:tabPanel switchType="ajax" width="100%" id="resultSummaryConfigPanel" immediate="true">
			<rich:tab id="resultSummaryTerm" label="#{msg.termResult}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/resultSummaryTerm.jsp"%>
			</rich:tab>

			<rich:tab id="resultSummaryTermGroup" label="#{msg.termGroupResult}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/resultSummaryTermGroup.jsp"%>
			</rich:tab>
			
			<rich:tab id="resultSummaryAnnual" label="#{msg.annualResult}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/resultSummaryAnnual.jsp"%>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>