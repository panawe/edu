<a4j:form>
<a4j:region>
	<a4j:outputPanel id="schools">
		<rich:dataTable
			style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
			value="#{schoolBean.schools}" var="school"
			rendered="#{schoolBean.rowCount>0}" reRender="ds" rowKeyVar="row">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
					<f:param value="#{msg.schools}" />
				</h:outputFormat>
			</f:facet>

			<rich:column width="300px" filterBy="#{school.name}"
				filterEvent="onkeyup" sortBy="#{school.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.name}" />
				</f:facet>
				<h:outputText value="#{school.name}" />
			</rich:column>
			
			<rich:column width="300px" filterBy="#{school.shortName}"
				filterEvent="onkeyup" sortBy="#{school.shortName}">
				<f:facet name="header">
					<h:outputText value="#{msg.shortName}" />
				</f:facet>
				<h:outputText value="#{school.shortName}" />
			</rich:column>

			<rich:column width="40px">
				<f:facet name="header">
					<h:outputText value="#{msg.phone}" />
				</f:facet>
				<h:outputText value="#{school.phone}" />
			</rich:column>

			<rich:column width="300px">
				<f:facet name="header">
					<h:outputText value="#{msg.address}" />
				</f:facet>
				<h:outputText value="#{school.address}" />
			</rich:column>

			<rich:column width="200px">
				<f:facet name="header">
					<h:outputText value="#{msg.city}" />
				</f:facet>
				<h:outputText value="#{school.city}" />
			</rich:column>


			<rich:column width="60">
				<f:facet name="header">
					<h:outputText value="#{msg.actions }" />
				</f:facet>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{schoolBean.edit}" reRender="schoolConfigPanel,gestionSchool">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{school.id}" />
				</a4j:commandLink>

				<rich:spacer width="20" height="10" title="" />

				<a4j:commandLink ajaxSingle="true" id="delete"
					action="#{schoolBean.delete}" 
					oncomplete="#{rich:component('schoolListResultPanel')}.show();"
					reRender="gestionSchool, schools,schoolListResultPanel">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{school.id}" />
				</a4j:commandLink>

				<rich:toolTip for="modify" value="#{msg.modify}" />
				<rich:toolTip for="delete" value="#{msg.delete}" />
			</rich:column>

			<f:facet name="footer">
				<rich:datascroller id="ds"></rich:datascroller>
			</f:facet>
		</rich:dataTable>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>

<rich:modalPanel id="schoolListResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{schoolBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{schoolBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('schoolListResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>