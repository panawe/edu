<a4j:region>
	<a4j:outputPanel id="schoolYears">
		<rich:dataTable
			style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
			value="#{schoolYearBean.schoolYears}" var="schoolYear"
			rendered="#{schoolYearBean.rowCount>0}" reRender="ds" rowKeyVar="row">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
					<f:param value="#{msg.schoolYears}" />
				</h:outputFormat>
			</f:facet>

			<rich:column  filterBy="#{schoolYear.year}"
				filterEvent="onkeyup" sortBy="#{schoolYear.year}">
				<f:facet name="header">
					<h:outputText value="#{msg.name}" />
				</f:facet>
				<h:outputText value="#{schoolYear.year}" />
			</rich:column>
			
			<rich:column  filterBy="#{schoolYear.description}"
				filterEvent="onkeyup" sortBy="#{schoolYear.description}">
				<f:facet name="header">
					<h:outputText value="#{msg.description}" />
				</f:facet>
				<h:outputText value="#{schoolYear.description}" />
			</rich:column>
			
			<rich:column filterBy="#{schoolYear.beginDate}" filterEvent="onkeyup"
					sortBy="#{schoolYear.beginDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.beginDate}" />
					</f:facet>
					<h:outputText value="#{schoolYear.beginDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
			</rich:column>

			<rich:column filterBy="#{schoolYear.endDate}" filterEvent="onkeyup"
					sortBy="#{schoolYear.endDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.endDate}" />
					</f:facet>
					<h:outputText value="#{schoolYear.endDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
			</rich:column>
			
			
			<rich:column width="60">
				<f:facet name="header">
					<h:outputText value="#{msg.actions}" />
				</f:facet>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{schoolYearBean.edit}" reRender="gestionSchoolYear,">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{schoolYear.id}" />
				</a4j:commandLink>

				<rich:spacer width="20" height="10" title="" />

				<a4j:commandLink ajaxSingle="true" id="delete"
					action="#{schoolYearBean.delete}"
					reRender="gestionSchoolYear, schoolYears">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{schoolYear.id}" />
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
			value="#{schoolYearBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{schoolYearBean.successMessage}" /> </success> </font>

		<br />
	</a4j:outputPanel>
</a4j:region>
