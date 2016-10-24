<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="alerts">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{alertBean.alerts}" var="alert"
				rendered="#{alertBean.rowCount>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.alerts}" />
					</h:outputFormat>
				</f:facet>
	
				<rich:column filterBy="#{alert.subject}" filterEvent="onkeyup"
					sortBy="#{alertType.subject}">
					<f:facet name="header">
						<h:outputText value="#{msg.alertType}" />
					</f:facet>
					<h:outputText value="#{alert.subject}" />
				</rich:column>
	
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.message}" />
					</f:facet>
					<h:outputText value="#{alert.message}" escape="false" />
				</rich:column>
	
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.numberOfDays}" />
					</f:facet>
					<h:outputText value="#{alert.numberOfDays}" />
				</rich:column>
	
				<rich:column sortBy="#{alert.firstRunTime}">
					<f:facet name="header">
						<h:outputText value="#{msg.firstRunTime}" />
					</f:facet>
					<h:outputText value="#{alert.firstRunTime}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
	
				<rich:column sortBy="#{alert.lastRunTime}">
					<f:facet name="header">
						<h:outputText value="#{msg.lastRunTime}" />
					</f:facet>
					<h:outputText value="#{alert.lastRunTime}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
	
				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions}" />
					</f:facet>
	
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{alertBean.edit}" reRender="alertConfigPanel, gestionAlert">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{alert.id}" />
					</a4j:commandLink>
	
					<rich:spacer width="20" height="10" title="" />
	
					<a4j:commandLink ajaxSingle="true" id="delete"
						oncomplete="#{rich:component('alertListResultPanel')}.show();"
						action="#{alertBean.delete}" reRender="gestionAlert, alerts, alertListResultPanel">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{alert.id}" />
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

<rich:modalPanel id="alertListResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p>
			<font color="#FF0000"> 
				<error> 
					<h:outputText value="#{alertBean.errorMessage}" /> 
				</error> 
			</font> 
			<font color="#00FF00">
				<success> 
					<h:outputText value="#{alertBean.successMessage}" />
				</success> 
			</font>
		</p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('alertListResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>