<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="newsPanel" selectedTab="#{newsBean.selectedTab}"
			immediate="true">

			<rich:tab id="newsList" label="#{msg.research}">
			 <a4j:support event="ontabenter" ajaxSingle="true"
					action="#{newsBean.getAll}" reRender="newss" />
				<%@include file="/WEB-INF/jsfIncludes/newsList.jsp"%>
			</rich:tab>

			<rich:tab id="newsDetail" label="#{msg.details}">
				<%@include file="/WEB-INF/jsfIncludes/newsDetails.jsp"%>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>