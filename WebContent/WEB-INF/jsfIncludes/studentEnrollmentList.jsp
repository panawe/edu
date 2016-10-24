<a4j:form>
<a4j:region>
		<a4j:outputPanel id="studentEnrollments">
			<rich:dataTable rows="5"
				value="#{studentEnrollmentBean.studentEnrollments}"
				var="studentEnrollment"
				rendered="#{studentEnrollmentBean.rowCount>0}" reRender="ds"
				rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.enrollments}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{studentEnrollment.school.name}"
					filterEvent="onkeyup" sortBy="#{studentEnrollment.school.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{studentEnrollment.school.name}" />
				</rich:column>
				
				<rich:column filterBy="#{studentEnrollment.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{studentEnrollment.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{studentEnrollment.schoolYear.year}" />
				</rich:column>

				<rich:column filterBy="#{studentEnrollment.levelClass.name}"
					filterEvent="onkeyup" sortBy="#{studentEnrollment.levelClass.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.classe}" />
					</f:facet>
					<h:outputText value="#{studentEnrollment.levelClass.name}" />
				</rich:column>

				<rich:column sortBy="#{studentEnrollment.enrollmentDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.enrollmentDate}" />
					</f:facet>
					<h:outputText value="#{studentEnrollment.enrollmentDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.comments}" />
					</f:facet>
					<h:outputText value="#{studentEnrollment.comments}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{studentEnrollmentBean.edit}"
						rendered="#{studentEnrollment.school.id == user.school.id &&studentBean.userHasWriteAccess}"
						reRender="gestionStudentEnrollment,studentEnrollmentPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{studentEnrollment.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						rendered="#{studentEnrollment.school.id == user.school.id &&studentBean.userHasWriteAccess}"
						action="#{studentEnrollmentBean.delete}"
						reRender="gestionStudentEnrollment, studentEnrollments">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{studentEnrollment.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

		</a4j:outputPanel>
	</a4j:region>
</a4j:form>