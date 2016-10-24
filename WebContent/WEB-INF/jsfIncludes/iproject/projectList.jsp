<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="projects">
			<rich:dataTable rows="5" value="#{projectBean.projects}"
				var="project" rendered="#{projectBean.rowCount > 0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.projects}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{project.projectCode}"
					filterEvent="onkeyup" sortBy="#{project.projectCode}">
					<f:facet name="header">
						<h:outputText value="#{msg.projectCode}" />
					</f:facet>
					<h:outputText value="#{project.projectCode}" />
				</rich:column>
				
				<rich:column filterBy="#{project.client.name}"
					filterEvent="onkeyup" sortBy="#{project.client.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.client}" />
					</f:facet>
					<h:outputText value="#{project.client.name}" />
				</rich:column>
				
				<rich:column filterBy="#{project.description}"
					filterEvent="onkeyup" sortBy="#{project.description}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{project.description}" />
				</rich:column>
				
				<rich:column filterBy="#{project.actualStartDate}"
					filterEvent="onkeyup" sortBy="#{project.actualStartDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.actualStartDate}" />
					</f:facet>
					<h:outputText value="#{project.actualStartDate}" >
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
		
				<rich:column filterBy="#{project.actualEndDate}"
					filterEvent="onkeyup" sortBy="#{project.actualEndDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.actualEndDate}" />
					</f:facet>
					<h:outputText value="#{project.actualEndDate}" >
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{project.budget}"
					filterEvent="onkeyup" sortBy="#{project.budget}">
					<f:facet name="header">
						<h:outputText value="#{msg.budget}" />
					</f:facet>
					<h:outputText value="#{project.budget}" >
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{project.billHours}"
					filterEvent="onkeyup" sortBy="#{project.billHours}">
					<f:facet name="header">
						<h:outputText value="#{msg.billHours}" />
					</f:facet>
					<h:outputText value="#{project.billHours}" >
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{project.nonBillHours}"
					filterEvent="onkeyup" sortBy="#{project.nonBillHours}">
					<f:facet name="header">
						<h:outputText value="#{msg.nonBillHours}" />
					</f:facet>
					<h:outputText value="#{project.nonBillHours}" >
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{project.status}"
					filterEvent="onkeyup" sortBy="#{project.status}">
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{project.statusDescription}" />
				</rich:column>
				
				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{user.school.id == project.school.id }"
						action="#{projectBean.edit}" reRender="clientProjectPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{project.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{projectBean.delete}"
						rendered="#{user.school.id == project.school.id }"
						reRender="gestionProject, projects">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{project.id}" />
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