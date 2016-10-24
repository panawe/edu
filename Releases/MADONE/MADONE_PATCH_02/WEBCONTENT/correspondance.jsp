<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top">
			<rich:tabPanel switchType="ajax" width="100%"
				id="correspondanceTabPanel"
				selectedTab="#{correspondenceBean.selectedTab}">

				<rich:tab id="correspondanceDetails" label="#{msg.writeCorrespondance}">
				
					<%@include file="/WEB-INF/jsfIncludes/correspondenceDetails.jsp"%>
				 
				</rich:tab>
				
				<rich:tab id="correspondanceList" label="#{msg.readCorrespondance}">
					<%@include file="/WEB-INF/jsfIncludes/correspondenceList.jsp"%>
				</rich:tab>

			</rich:tabPanel>

		</td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>