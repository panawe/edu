
<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>

	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->

	<tr>
		<td valign="top">
			<rich:tabPanel id="questionPanel" switchType="ajax" width="100%"
				selectedTab="#{questionBean.selectedTab}">

				<rich:tab id="questionListPanel" label="#{msg.questions }">
					<%@include file="/WEB-INF/jsfIncludes/questionList.jsp"%>
				</rich:tab>

				<rich:tab id="questionDetailPanel" label="#{msg.details}">
					<%@include file="/WEB-INF/jsfIncludes/questionDetails.jsp"%>
				</rich:tab>

				<rich:tab id="answersPannel" label="#{msg.answers }"
					rendered="#{questionBean.showAnswerTab }">
					<%@include file="/WEB-INF/jsfIncludes/answers.jsp"%>
				</rich:tab>

			</rich:tabPanel>
		 </td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>


</f:view>
