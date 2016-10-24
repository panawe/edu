<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr  valign="top">
		<td  valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="medicalConfigPanel">
			   <rich:tab id="disease" label="#{msg.disease}">
					<a4j:form>
						<%@include file="/WEB-INF/jsfIncludes/diseaseList.jsp"%>
						<br />
						<%@include file="/WEB-INF/jsfIncludes/diseaseDetails.jsp"%>
					</a4j:form>
				</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>