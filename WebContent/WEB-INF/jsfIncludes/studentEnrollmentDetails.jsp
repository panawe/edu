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
						<td><h:outputText value="#{msg.enrollmentDate}" /><font
											color="#FF0000">*</font></td>
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
								value="#{msg.levelClass}" /><font color="#FF0000">*</font></td>
							<td><rich:comboBox id="levelClass"
								value="#{studentEnrollmentBean.levelClassName}"
								defaultLabel="#{msg.enterListDefaultValue}"
								suggestionValues="#{levelClassBean.allLevelClasses}">

							</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
						</a4j:region>
					</tr>
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
							<td><rich:comboBox id="schoolYear"
								value="#{studentEnrollmentBean.year}"
								suggestionValues="#{schoolYearBean.allSchoolYears}">
							</rich:comboBox></td>
						</a4j:region>
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
					rendered="#{studentBean.student.school.id == user.school.id && studentBean.userHasWriteAccess }"
					action="#{studentEnrollmentBean.insert}"
					reRender="studentEnrollments, gestionStudentEnrollment,studentEnrollmentResultPanel"
					oncomplete="#{rich:component('studentEnrollmentResultPanel')}.show();"  />

				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						rendered="#{studentBean.student.school.id == user.school.id && studentBean.userHasWriteAccess }"
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

<rich:modalPanel id="studentEnrollmentResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>

			<font color="#FF0000"> <error> <h:outputText
				value="#{studentEnrollmentBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{studentEnrollmentBean.successMessage}" /> </success> </font>

			<br />

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('studentEnrollmentResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>