<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="tuitions">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{tuitionBean.tuitions}" var="tuition"
				rendered="#{tuitionBean.rowCount>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.tuitions}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{tuition.description}" filterEvent="onkeyup"
					sortBy="#{tuition.description}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{tuition.description}" />
				</rich:column>

				<rich:column filterBy="#{tuition.tuitionType.name}" filterEvent="onkeyup"
					sortBy="#{tuition.tuitionType.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.tuitionType}" />
					</f:facet>
					<h:outputText value="#{tuition.tuitionType.name}" />
				</rich:column>
				<rich:column filterBy="#{tuition.remindDate}" filterEvent="onkeyup"
					sortBy="#{tuition.remindDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.remindDate}" />
					</f:facet>
					<h:outputText value="#{tuition.remindDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>				
				<rich:column filterBy="#{tuition.dueDate}" filterEvent="onkeyup"
					sortBy="#{tuition.dueDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.dueDate}" />
					</f:facet>
					<h:outputText value="#{tuition.dueDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.amount}" />
					</f:facet>
					<h:outputText value="#{tuition.amount}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column filterBy="#{tuition.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{tuition.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{tuition.schoolYear.year}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{tuitionBean.edit}" reRender="gestionTuition,Tuitions">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{tuition.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{tuitionBean.delete}"
						reRender="gestionTuition, tuitions,actionResultPanel"
						oncomplete="#{rich:component('actionResultPanel')}.show();">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{tuition.id}" />
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

<rich:modalPanel id="actionResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>

	<br />

	<font color="#FF0000"> <error> <h:outputText
		value="#{tuitionBean.errorMessage}" /> </error> </font>
	<font color="#00FF00"> <success> <h:outputText
		value="#{tuitionBean.successMessage}" /> </success> </font>

	<a4j:form>
		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('actionResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
