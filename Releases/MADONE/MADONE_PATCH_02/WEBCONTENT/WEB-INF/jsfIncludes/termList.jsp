<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="terms">
			<rich:dataTable rows="5" value="#{termBean.terms}" var="term"
				rendered="#{termBean.rowCount>0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.terms}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{term.name}" filterEvent="onkeyup"
					sortBy="#{term.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.name}" />
					</f:facet>
					<h:outputText value="#{term.name}" />
				</rich:column>

				<rich:column filterBy="#{term.termGroup.name}" filterEvent="onkeyup"
					sortBy="#{term.termGroup.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.termGroup}" />
					</f:facet>
					<h:outputText value="#{term.termGroup.name}" />
				</rich:column>

				<rich:column filterBy="#{term.showFinalRank}" filterEvent="onkeyup"
					sortBy="#{term.showFinalRank}" width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.showFinalRank}" />
					</f:facet>
					<h:outputText rendered="#{term.showFinalRank == '1'}" value="#{msg.yes}" />
					<h:outputText rendered="#{term.showFinalRank == '0'}" value="#{msg.no}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{termBean.edit}" reRender="gestionTerm">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{term.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{termBean.delete}" reRender="gestionTerm, terms">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{term.id}" />
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
				value="#{termBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{termBean.successMessage}" /> </success> </font>

			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>