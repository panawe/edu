<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"> 
			<rich:tabPanel switchType="ajax" width="100%" id="bulletinPanel">
				<rich:tab id="schoolDetail" label="#{msg.printAndCalculate}">
					<%@include file="/WEB-INF/jsfIncludes/printBulletin.jsp"%>
				</rich:tab>
			</rich:tabPanel>
		</td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>