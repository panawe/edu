<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="teacherMedicalVisits">
			<rich:dataTable rows="5" value="#{medicalVisitBean.medicalVisits}"
				var="medicalVisit" rendered="#{medicalVisitBean.rowCount>0}"
				reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">

				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.medicalVisits}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{medicalVisit.visitDate}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.visitDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.visitDate}" />
					</f:facet>
					<h:outputText value="#{medicalVisit.visitDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column sortBy="#{medicalVisit.disease.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.disease}" />
					</f:facet>
					<h:outputText value="#{medicalVisit.disease.name}" />
				</rich:column>
				<rich:column filterBy="#{medicalVisit.diagnosis}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.diagnosis}">
					<f:facet name="header">
						<h:outputText value="#{msg.diagnosis}" />
					</f:facet>
					<h:outputText escape="false" value="#{medicalVisit.diagnosis}" />
				</rich:column>
				<rich:column filterBy="#{medicalVisit.prescription}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.prescription}">
					<f:facet name="header">
						<h:outputText value="#{msg.prescription}" />
					</f:facet>
					<h:outputText escape="false" value="#{medicalVisit.prescription}" />
				</rich:column>

				<rich:column filterBy="#{medicalVisit.consultedBy}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.consultedBy}">
					<f:facet name="header">
						<h:outputText value="#{msg.consultedBy}" />
					</f:facet>
					<h:outputText value="#{medicalVisit.consultedBy}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

		</a4j:outputPanel>
	</a4j:region>
</a4j:form>