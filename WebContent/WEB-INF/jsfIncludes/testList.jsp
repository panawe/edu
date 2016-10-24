<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="tests">
			<rich:dataTable rows="15" value="#{testBean.tests}" var="test"
				rendered="#{testBean.rowCount>0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.tests}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{test.school.name}" filterEvent="onkeyup"
					sortBy="#{test.school.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{test.school.name}" />
				</rich:column>

				<rich:column filterBy="#{test.title}" filterEvent="onkeyup"
					sortBy="#{test.title}">
					<f:facet name="header">
						<h:outputText value="#{msg.title}" />
					</f:facet>
					<h:outputText value="#{test.title}" />
				</rich:column>

				<rich:column filterBy="#{test.subject.name}" filterEvent="onkeyup"
					sortBy="#{test.subject.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{test.subject.name}" />
				</rich:column>

				<rich:column filterBy="#{test.level.name}" filterEvent="onkeyup"
					sortBy="#{test.level.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{test.level.name}" />
				</rich:column>

				<rich:column filterBy="#{test.dueDate}" filterEvent="onkeyup"
					sortBy="#{test.dueDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.dueDate}" />
					</f:facet>
					<h:outputText value="#{test.dueDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{testBean.edit}"
						reRender="onlineTestPanel,selectedTestSummary">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{test.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="importExamMark"
						action="#{examBean.importExamMark}" reRender="examMarkImportPanel"
						rendered="#{link == 'exam' }"
						oncomplete="#{rich:component('examMarkImportPanelResult')}.show();">
						<h:graphicImage value="images/import.png" style="border:0" />
						<f:param name="id" value="#{test.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{testBean.delete}" reRender="testDetails,tests">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{test.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
					<rich:toolTip for="importExamMark" value="#{msg.importMarks}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
<a4j:status onstart="#{rich:component('wait')}.show()"
	onstop="#{rich:component('wait')}.hide()" />
<rich:modalPanel id="wait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<rich:modalPanel id="examMarkImportPanelResult" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{examBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{examBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			reRender="students"
			oncomplete="#{rich:component('examMarkImportPanelResult')}.hide();#{rich:component('examMarkImportPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>