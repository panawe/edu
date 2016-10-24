<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="subProjects">
			<rich:dataTable rows="5" value="#{subProjectBean.subProjects}"
				var="subProject" rendered="#{subProjectBean.rowCount > 0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.subProjects}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{subProject.subProjectCode}"
					filterEvent="onkeyup" sortBy="#{subProject.subProjectCode}">
					<f:facet name="header">
						<h:outputText value="#{msg.subProjectCode}" />
					</f:facet>
					<h:outputText value="#{subProject.subProjectCode}" />
				</rich:column>
				
				<rich:column filterBy="#{subProject.project.projectCode}"
					filterEvent="onkeyup" sortBy="#{subProject.project.projectCode}">
					<f:facet name="header">
						<h:outputText value="#{msg.projectCode}" />
					</f:facet>
					<h:outputText value="#{subProject.project.projectCode}" />
				</rich:column>
				
				<rich:column filterBy="#{subProject.description}"
					filterEvent="onkeyup" sortBy="#{subProject.description}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{subProject.description}" />
				</rich:column>
				
				<rich:column filterBy="#{subProject.actualStartDate}"
					filterEvent="onkeyup" sortBy="#{subProject.actualStartDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.actualStartDate}" />
					</f:facet>
					<h:outputText value="#{subProject.actualStartDate}" >
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
		
				<rich:column filterBy="#{subProject.actualEndDate}"
					filterEvent="onkeyup" sortBy="#{subProject.actualEndDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.actualEndDate}" />
					</f:facet>
					<h:outputText value="#{subProject.actualEndDate}" >
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{subProject.budget}"
					filterEvent="onkeyup" sortBy="#{subProject.budget}">
					<f:facet name="header">
						<h:outputText value="#{msg.budget}" />
					</f:facet>
					<h:outputText value="#{subProject.budget}" >
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{subProject.billHours}"
					filterEvent="onkeyup" sortBy="#{subProject.billHours}">
					<f:facet name="header">
						<h:outputText value="#{msg.billHours}" />
					</f:facet>
					<h:outputText value="#{subProject.billHours}" >
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{subProject.nonBillHours}"
					filterEvent="onkeyup" sortBy="#{subProject.nonBillHours}">
					<f:facet name="header">
						<h:outputText value="#{msg.nonBillHours}" />
					</f:facet>
					<h:outputText value="#{subProject.nonBillHours}" >
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{subProject.status}"
					filterEvent="onkeyup" sortBy="#{subProject.status}">
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{subProject.statusDescription}" />
				</rich:column>
				
				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{user.school.id == subProject.school.id }"
						action="#{subProjectBean.edit}" reRender="clientSubProjectPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{subProject.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{subProjectBean.delete}"
						rendered="#{user.school.id == subProject.school.id }"
						reRender="gestionSubProject, subProjects">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{subProject.id}" />
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