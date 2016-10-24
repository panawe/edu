<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top">
			<rich:tabPanel switchType="ajax" width="100%" id="alertConfigPanel" immediate="true" selectedTab="#{alertBean.selectedTab}">
				<rich:tab id="alertList" label="#{msg.alert}" >
					<%@include file="/WEB-INF/jsfIncludes/alertList.jsp"%>
				</rich:tab>
				<rich:tab id="alertDetail" label="#{msg.details}">
					<%@include file="/WEB-INF/jsfIncludes/alertDetails.jsp"%>
				</rich:tab>
			</rich:tabPanel>
		</td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>
</f:view>