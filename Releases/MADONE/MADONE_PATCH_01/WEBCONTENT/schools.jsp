<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="schoolConfigPanel" immediate="true" selectedTab="#{schoolBean.selectedTab }">
			<rich:tab id="schoolsList" label="#{msg.schoolList}">
				<%@include file="/WEB-INF/jsfIncludes/schoolList.jsp"%>
			</rich:tab>

			<rich:tab id="schoolsDetail" label="#{msg.school}">

				<%@include file="/WEB-INF/jsfIncludes/schoolSuperDetails.jsp"%>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>