<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr  valign="top">
		<td  valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="consultationPanel" selectedTab="#{medicalVisitBean.selectedTab }">
			<rich:tab id="medicalVisitList" label="#{msg.search}">
				<%@include file="/WEB-INF/jsfIncludes/medicalVisitList.jsp"%>
			</rich:tab>
			<rich:tab id="medicalVisitDetails" label="#{msg.medicalVisit }">
				<%@include file="/WEB-INF/jsfIncludes/medicalVisitDetails.jsp"%>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>