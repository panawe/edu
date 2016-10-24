<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="termGroups">
			<rich:dataTable rows="5" value="#{termGroupBean.termGroups}" var="termGroup"
				rendered="#{termGroupBean.rowCount>0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.termGroups}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{termGroup.name}" filterEvent="onkeyup"
					sortBy="#{termGroup.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.name}" />
					</f:facet>
					<h:outputText value="#{termGroup.name}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{termGroupBean.edit}" reRender="gestionTermGroup">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{termGroup.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{termGroupBean.delete}" reRender="gestionTermGroup, termGroups">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{termGroup.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

			<font color="#FF0000"> <error> <h:outputText
				value="#{termGroupBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{termGroupBean.successMessage}" /> </success> </font>

			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>