<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="schoolings">
			<rich:dataTable rows="5" value="#{schoolingBean.schoolings}"
				var="schooling" rendered="#{schoolingBean.rowCount>0}" reRender="ds"
				rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.schoolings}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{schooling.school.name}"
					filterEvent="onkeyup" sortBy="#{schooling.school.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{schooling.school.name}" />
				</rich:column>
				<rich:column filterBy="#{schooling.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{schooling.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{schooling.schoolYear.year}" />
				</rich:column>
				<rich:column filterBy="#{schooling.term.name}"
					filterEvent="onkeyup" sortBy="#{schooling.term.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.term}" />
					</f:facet>
					<h:outputText value="#{schooling.term.name}" />
				</rich:column>
				<rich:column filterBy="#{schooling.eventType.name}"
					filterEvent="onkeyup" sortBy="#{schooling.eventType.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.type}" />
					</f:facet>
					<h:outputText value="#{schooling.eventType.name}" />
				</rich:column>

				<rich:column sortBy="#{schooling.eventDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.date}" />
					</f:facet>
					<h:outputText value="#{schooling.eventDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{schooling.description}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{user.school.id == schooling.school.id &&schoolingBean.userHasWriteAccess}"
						action="#{schoolingBean.edit}" reRender="studentPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{schooling.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{schoolingBean.delete}"
						rendered="#{user.school.id == schooling.school.id &&schoolingBean.userHasWriteAccess}"
						reRender="gestionSchooling, schoolings">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{schooling.id}" />
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