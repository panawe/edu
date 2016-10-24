
<a4j:form>
	<a4j:outputPanel id="resultList">
		<rich:scrollableDataTable width="100%" height="300px"
			value="#{testBean.testResults}" var="result" sortMode="single"
			rowKeyVar="id" selection="#{testBean.selectedResults}">

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.userName}" />
				</f:facet>
				<h:outputText value="#{result.user.userName}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.lastName}" />
				</f:facet>
				<h:outputText value="#{result.user.lastName}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.firstName}" />
				</f:facet>
				<h:outputText value="#{result.user.firstName}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.beginDate}" />
				</f:facet>
				<h:outputText value="#{result.beginDate}">
					<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.endDate}" />
				</f:facet>
				<h:outputText value="#{result.endDate}">
					<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.duration}  (#{msg.minute })" />
				</f:facet>
				<h:outputText value="#{result.duration}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.rightAnswers}" />
				</f:facet>
				<h:outputText value="#{result.right}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.wrongAnswers}" />
				</f:facet>
				<h:outputText value="#{result.wrong}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.score}" />
				</f:facet>
				<h:outputText value="#{result.score}">
				</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.completed}" />
				</f:facet>
				<h:selectBooleanCheckbox id="completed" disabled="true"
					value="#{result.completed}">
				</h:selectBooleanCheckbox>
			</rich:column>

			<rich:column>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{testBean.getSelectedResultId}"
					oncomplete="#{rich:component('printTestDetails')}.show();">
					<h:graphicImage value="images/view.gif" style="border:0" />
					<f:param name="id" value="#{result.id}" />
				</a4j:commandLink>
			</rich:column>
		</rich:scrollableDataTable>

	</a4j:outputPanel>
</a4j:form>
<rich:modalPanel id="printTestDetails" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.print}" />
	</f:facet>
	<a4j:form>
		<p><h:commandButton id="view" value="#{msg.viewDetailsPdf }"
			action="#{testBean.showUserTestDetails}" /></p>
		<p></p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{testBean.doNothing}" reRender="printTestDetails"
			oncomplete="#{rich:component('printTestDetails')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
