<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr valign="top">
		<td valign="top">
	<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionStudentEnrollment">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.enrollment}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">

					<tr>
						<td><h:outputText value="#{msg.enrollmentDate}" /></td>
						<td><rich:calendar id="enrollmentDate"
							value="#{studentEnrollmentBean.studentEnrollment.enrollmentDate}"
							locale="fr" popup="true" datePattern="dd/MM/yyyy"
							showFooter="false" showApplyButton="false" cellWidth="24px"
							cellHeight="22px" style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="enrollmentDate" /></font></td>
					</tr>
					<!-- Level class Suggestion Box -->
					<tr>
						<a4j:region>
							<td><h:inputHidden
								value="#{studentEnrollmentBean.studentEnrollment.id}" /> <h:outputText
								value="#{msg.levelClass}" /></td>
							<td><rich:comboBox id="levelClass"
								value="#{studentEnrollmentBean.levelClassName}"
								defaultLabel="#{msg.enterListDefaultValue}"
								suggestionValues="#{levelClassBean.allLevelClasses}">

							</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
						</a4j:region>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.year }" /></td>
						<td><rich:comboBox id="schoolYear"
							value="#{studentEnrollmentBean.year}"
							suggestionValues="#{schoolYearBean.allSchoolYears}">
						</rich:comboBox></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.comments}" /></td>
						<td><h:inputTextarea id="enrollmentComments"
							value="#{studentEnrollmentBean.studentEnrollment.comments}"
							rows="5" cols="50">
						</h:inputTextarea></td>
						<td><font color="#FF0000"><rich:message
							for="enrollmentComments" /></font></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}"
					action="#{studentEnrollmentBean.insert}"
					reRender="studentEnrollments, gestionStudentEnrollment" />

				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{studentEnrollmentBean.clear}"
						reRender="gestionStudentEnrollment" />
				</a4j:region>
				<br />
				<br />
				<br />
				<br />
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>		

		 </td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>