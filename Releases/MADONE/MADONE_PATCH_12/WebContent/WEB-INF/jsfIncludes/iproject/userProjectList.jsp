<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="userProjects">
			<rich:dataTable rows="5" value="#{userProjectBean.userProjects}"
				var="userProject" rendered="#{userProjectBean.rowCount > 0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.resources}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{userProject.project.projectCode}"
					filterEvent="onkeyup" sortBy="#{userProject.project.projectCode}">
					<f:facet name="header">
						<h:outputText value="#{msg.projectCode}" />
					</f:facet>
					<h:outputText value="#{userProject.project.projectCode}" />
				</rich:column>
				
				<rich:column filterBy="#{userProject.user.firstName}"
					filterEvent="onkeyup" sortBy="#{userProject.user.firstName}">
					<f:facet name="header">
						<h:outputText value="#{msg.firstName}" />
					</f:facet>
					<h:outputText value="#{userProject.user.firstName}" />
				</rich:column>
				
				<rich:column filterBy="#{userProject.user.lastName}"
					filterEvent="onkeyup" sortBy="#{userProject.user.lastName}">
					<f:facet name="header">
						<h:outputText value="#{msg.lastName}" />
					</f:facet>
					<h:outputText value="#{userProject.user.lastName}" />
				</rich:column>

				<rich:column filterBy="#{userProject.position.name}"
					filterEvent="onkeyup" sortBy="#{userProject.position.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.position}" />
					</f:facet>
					<h:outputText value="#{userProject.position.name}" />
				</rich:column>
				
				<rich:column filterBy="#{userProject.hourlyRate}"
					filterEvent="onkeyup" sortBy="#{userProject.hourlyRate}">
					<f:facet name="header">
						<h:outputText value="#{msg.hourlyRate}" />
					</f:facet>
					<h:outputText value="#{userProject.hourlyRate}" >
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{user.school.id == userProject.school.id }"
						action="#{userProjectBean.edit}" reRender="clientUserProjectPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{userProject.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{userProjectBean.delete}"
						rendered="#{user.school.id == userProject.school.id }"
						reRender="gestionUserProject, userProjects">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{userProject.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>