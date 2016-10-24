<a4j:form>
	<a4j:region>
		<table width="50%">
			<tr>
				<td>
					<h:outputText value="#{msg.clientCode }:"/>
					<h:inputText value="#{clientBean.clientCode}" />
				</td>

				<td>
					<h:outputText value="#{msg.name }:"/>
					<h:inputText value="#{clientBean.name}" />
				</td>
				
				<td>
					<a4j:commandButton value="#{msg.search}"
					onclick="buttonClicked = true; "
					action="#{clientBean.search}" reRender="clients"/>
				</td>
			</tr>
		</table>
	</a4j:region>
</a4j:form>

<br/>
<br/>
<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="clients">
			<rich:dataTable rows="5" value="#{clientBean.clients}"
				var="client" rendered="#{clientBean.rowCount > 0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.clients}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{client.clientCode}"
					filterEvent="onkeyup" sortBy="#{client.clientCode}">
					<f:facet name="header">
						<h:outputText value="#{msg.clientCode}" />
					</f:facet>
					<h:outputText value="#{client.clientCode}" />
				</rich:column>
				
				<rich:column filterBy="#{client.name}"
					filterEvent="onkeyup" sortBy="#{client.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.name}" />
					</f:facet>
					<h:outputText value="#{client.name}" />
				</rich:column>

				<rich:column filterBy="#{client.contactName}"
					filterEvent="onkeyup" sortBy="#{client.contactName}">
					<f:facet name="header">
						<h:outputText value="#{msg.contactName}" />
					</f:facet>
					<h:outputText value="#{client.contactName}" />
				</rich:column>
				
				<rich:column filterBy="#{client.phone}"
					filterEvent="onkeyup" sortBy="#{client.phone}">
					<f:facet name="header">
						<h:outputText value="#{msg.phone}" />
					</f:facet>
					<h:outputText value="#{client.phone}" />
				</rich:column>
				
				<rich:column filterBy="#{client.fax}"
					filterEvent="onkeyup" sortBy="#{client.fax}">
					<f:facet name="header">
						<h:outputText value="#{msg.fax}" />
					</f:facet>
					<h:outputText value="#{client.fax}" />
				</rich:column>
				
				<rich:column filterBy="#{client.email}"
					filterEvent="onkeyup" sortBy="#{client.email}">
					<f:facet name="header">
						<h:outputText value="#{msg.email}" />
					</f:facet>
					<h:outputText value="#{client.email}" />
				</rich:column>
				
				<rich:column filterBy="#{client.website}"
					filterEvent="onkeyup" sortBy="#{client.website}">
					<f:facet name="header">
						<h:outputText value="#{msg.website}" />
					</f:facet>
					<h:outputText value="#{client.website}" />
				</rich:column>
				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{user.school.id == client.school.id }"
						action="#{clientBean.edit}" reRender="clientPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{client.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{clientBean.delete}"
						rendered="#{user.school.id == client.school.id }"
						reRender="gestionClient, clients">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{client.id}" />
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