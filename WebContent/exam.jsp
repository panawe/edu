
<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>

	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->

	<tr>
		<td valign="top"><rich:tabPanel id="examPanel" switchType="ajax"
				width="100%" selectedTab="#{examBean.selectedTab}">

				<rich:tab id="examList" label="#{msg.examSearch }">
					<%@include file="/WEB-INF/jsfIncludes/examList.jsp"%>
				</rich:tab>

				<rich:tab id="examDetail" label="Evaluation">
					<%@include file="/WEB-INF/jsfIncludes/examDetails.jsp"%>
				</rich:tab>

				<rich:tab id="notes" label="Notes"
					rendered="#{not empty examBean.exam }">
					<%@include file="/WEB-INF/jsfIncludes/examNotes.jsp"%>
				</rich:tab>

				<rich:tab id="markList" label="#{msg.markSearch }">
					<%@include file="/WEB-INF/jsfIncludes/examNotesSearch.jsp"%>
				</rich:tab>

			</rich:tabPanel> <rich:modalPanel id="waitExamList" autosized="true" width="200"
				height="120" moveable="false" resizeable="false">
				<f:facet name="header">
					<h:outputText value="#{msg.operationInProgress }" />
				</f:facet>
				<h:outputText value="#{msg.oneMomentPlease }" />
			</rich:modalPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>


</f:view>
