<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top">
			<rich:tabPanel switchType="ajax" width="100%" id="Tuitions"
			selectedTab="#{tuitionBean.selectedTab}" immediate="true">
				<rich:tab id="tuitionList" label="#{msg.tuition}">
					<%@include file="/WEB-INF/jsfIncludes/tuitionList.jsp"%>
				</rich:tab>
				
				<rich:tab id="tuitionDetail" label="#{msg.details}">
					<%@include file="/WEB-INF/jsfIncludes/tuitionDetails.jsp"%>
				</rich:tab>
			</rich:tabPanel>
		</td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>