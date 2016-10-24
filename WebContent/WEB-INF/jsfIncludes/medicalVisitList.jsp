<a4j:form>
	<a4j:region>
		<table width="50%">
			<tr>
				<td colspan="2" nowrap><h:outputText value="#{msg.beginDate}" /><font
					color="#FF0000">*</font> <rich:calendar id="beginVisitDate"
					value="#{medicalVisitBean.beginVisitDate}" locale="fr" popup="true"
					datePattern="dd/MM/yyyy"
					disabled="#{medicalVisitBean.selectAllMedicalVisits}"
					showFooter="false" showApplyButton="false" cellWidth="24px"
					cellHeight="22px" style="width:200px">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</rich:calendar></td>

				<td colspan="2" nowrap><h:outputText value="#{msg.endDate}" /><font
					color="#FF0000">*</font> <rich:calendar id="endVisitDate"
					value="#{medicalVisitBean.endVisitDate}" locale="fr" popup="true"
					datePattern="dd/MM/yyyy"
					disabled="#{medicalVisitBean.selectAllMedicalVisits}"
					showFooter="false" showApplyButton="false" cellWidth="24px"
					cellHeight="22px" style="width:200px">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</rich:calendar></td>

				<td colspan="2"><h:outputText value="#{msg.allMedicalVisits }" />
				<h:selectBooleanCheckbox id="selectAllMedicalVisits"
					value="#{medicalVisitBean.selectAllMedicalVisits}"
					title="#{msg.allMedicalVisits}">
					<a4j:support event="onchange" ajaxSingle="true"
						action="#{medicalVisitBean.updateSearchCriteria}"
						reRender="beginVisitDate, endVisitDate" />
				</h:selectBooleanCheckbox></td>

				<td><a4j:commandButton value="#{msg.search}"
					action="#{medicalVisitBean.searchMedicalVisits}"
					reRender="medicalVisits"
					oncomplete="if (#{medicalVisitBean.rowCount <= 0}) #{rich:component('resultPanelMedicalVisit')}.show();" />
				</td>

			</tr>
		</table>
	</a4j:region>

</a4j:form>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="medicalVisits">
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

				<rich:column filterBy="#{medicalVisit.patient.lastName}"
					filterEvent="onkeyup"
					sortBy="#{medicalVisit.patient.lastName} #{medicalVisit.patient.firstName}">
					<f:facet name="header">
						<h:outputText value="#{msg.patient}" />
					</f:facet>
					<h:outputText
						value="#{medicalVisit.patient.lastName} #{medicalVisit.patient.firstName}" />
				</rich:column>

				<rich:column filterBy="#{medicalVisit.prescription}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.prescription}">
					<f:facet name="header">
						<h:outputText value="#{msg.prescription}" />
					</f:facet>
					<h:outputText escape="false" value="#{medicalVisit.prescription}" />
				</rich:column>

				<rich:column filterBy="#{medicalVisit.diagnosis}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.diagnosis}">
					<f:facet name="header">
						<h:outputText value="#{msg.diagnosis}" />
					</f:facet>
					<h:outputText escape="false" value="#{medicalVisit.diagnosis}" />
				</rich:column>

				<rich:column filterBy="#{medicalVisit.consultedBy}"
					filterEvent="onkeyup" sortBy="#{medicalVisit.consultedBy}">
					<f:facet name="header">
						<h:outputText value="#{msg.consultedBy}" />
					</f:facet>
					<h:outputText value="#{medicalVisit.consultedBy}" />
				</rich:column>

				<rich:column sortBy="#{medicalVisit.disease.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.disease}" />
					</f:facet>
					<h:outputText value="#{medicalVisit.disease.name}" />
				</rich:column>

				<%
					if ("consultation".equals(request.getSession()
											.getAttribute("link"))) {
				%>
				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{medicalVisitBean.edit}"
						reRender="gestionMedicalVisit, consultationPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{medicalVisit.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{medicalVisitBean.delete}"
						reRender="gestionMedicalVisit, medicalVisits">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{medicalVisit.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>
				<%
					}
				%>
				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="resultPanelMedicalVisit" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<a4j:region>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="#{msg.close }"
				oncomplete=" #{rich:component('resultPanelMedicalVisit')}.hide();" /></p>
		</a4j:region>
	</a4j:form>
</rich:modalPanel>