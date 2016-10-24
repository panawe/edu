<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionMedicalVisit">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.medicalVisit}" />
					</h:outputFormat>
				</f:facet>
				<table class="table" cellspacing="10">
					<tr>
						<td valign="top">
						<table class="table" cellspacing="5">

							<tr>
								<td><h:outputText value="#{msg.visitDate}" /><font
									color="#FF0000">*</font></td>
								<td><rich:calendar id="visitDate"
									value="#{medicalVisitBean.medicalVisit.visitDate}" locale="fr"
									popup="true" datePattern="dd/MM/yyyy" showFooter="false"
									showApplyButton="false" cellWidth="24px"
									requiredMessage="#{msg.requiredMessage}" required="true"
									cellHeight="22px" style="width:200px">
									<f:convertDateTime pattern="dd/MM/yyyy" />
								</rich:calendar><rich:spacer width="20" height="10" title="" /><a4j:region>
									<a4j:commandButton value="#{msg.choosePatient}"
										action="#{medicalVisitBean.addPatient}"
										oncomplete="#{rich:component('resultPanelPatients')}.show()"
										reRender="resultPanelPatients,imageInfo,studentPhotoPanel,allergy1,allergy2" />
								</a4j:region></td>
								<td><font color="#FF0000"><rich:message
									for="visitDate" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.disease}:" /><font
									color="#FF0000">*</font></td>
								<td><rich:comboBox id="disease"
									suggestionValues="#{diseaseBean.allDiseases}"
									requiredMessage="#{msg.requiredMessage}" required="true"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{medicalVisitBean.diseaseName}" /></td>
								<td><font color="#FF0000"><rich:message
									for="disease" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.diagnosis}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputTextarea id="diagnosis"
									value="#{medicalVisitBean.medicalVisit.diagnosis}" rows="3"
									cols="60">
								</h:inputTextarea></td>
								<td><font color="#FF0000"><rich:message
									for="diagnosis" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.prescription}" /></td>
								<td><h:inputTextarea id="prescription"
									value="#{medicalVisitBean.medicalVisit.prescription}" rows="3"
									cols="60">
								</h:inputTextarea></td>
								<td><font color="#FF0000"><rich:message
									for="prescription" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.consultedBy}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="consultBy" size="60" maxlength="100"
									requiredMessage="#{msg.requiredMessage}" required="true"
									value="#{medicalVisitBean.medicalVisit.consultedBy}">
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="consultBy" /></font></td>
							</tr>
						</table>
						</td>

						<td valign="top"><rich:panel bodyClass="info"
							id="patientPanel"
							rendered="#{not empty medicalVisitBean.patient}">
							<f:facet name="header">
								<h:outputText value="#{msg.patient }" />
							</f:facet>
							<a4j:outputPanel ajaxRendered="true" id="studentPhotoPanel"
								rendered="#{not empty medicalVisitBean.patient.image}">
								<h:panelGroup id="studentPanelGrp">
									<a4j:mediaOutput id="studentMediaOut" element="img"
										mimeType="image/gif" createContent="#{medicalVisitBean.paint}"
										style="width:150px; height:150px;"
										value="#{medicalVisitBean.random}" cacheable="false">
									</a4j:mediaOutput>
								</h:panelGroup>
							</a4j:outputPanel>
							<br />

							<strong><h:inputHidden
								value="#{medicalVisitBean.patient.id}"
								requiredMessage="#{msg.requiredMessage}" required="true" /> <h:outputText
								value="#{msg.firstName}:" /> <font color="red"><h:outputText
								value="#{medicalVisitBean.patient.firstName}" /></font> <br />
							<h:outputText value="#{msg.lastName}:" /> <font color="red"><h:outputText
								value="#{medicalVisitBean.patient.lastName}" /></font> <br />
							<h:outputText value="#{msg.userName}:" /> <font color="red"><h:outputText
								value="#{medicalVisitBean.patient.userName}" /></font> <br />

							<h:outputText value="#{msg.allergy }:" /> <font color="red">
							<h:outputText id="allergy1"
								value="#{medicalVisitBean.patient.allergy }"
								rendered="#{not empty medicalVisitBean.patient.allergy}" /> <h:outputText
								id="allergy2" value="#{msg.none }"
								rendered="#{empty medicalVisitBean.patient.allergy}" /> </font> </strong>
						</rich:panel></td>

					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}"
					action="#{medicalVisitBean.insert}"
					rendered="#{medicalVisitBean.userHasWriteAccess}"
					reRender="medicalVisits, gestionMedicalVisit, medicalVisitResultPanel,patientPanel,resultPanelPatients,studentPhotoPanel,allergy1,allergy"
					oncomplete="#{rich:component('medicalVisitResultPanel')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{medicalVisitBean.clear}"
						rendered="#{medicalVisitBean.userHasWriteAccess}"
						reRender="gestionMedicalVisit, medicalVisitResultPanel,patientPanel,resultPanelPatients,studentPhotoPanel,allergy1,allerg" />
				</a4j:region>
				<br />
				<br />
				<br />
				<br />
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="resultPanelPatients" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink220"
				styleClass="hidelink" />
			<rich:componentControl for="resultPanelPatients"
				attachTo="hidelink220" operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<%@include file="/WEB-INF/jsfIncludes/userList.jsp"%>
</rich:modalPanel>


<rich:modalPanel id="medicalVisitResultPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>

		<font color="#FF0000"> <error> <h:outputText
			value="#{medicalVisitBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{medicalVisitBean.successMessage}" /> </success> </font>

		<br />

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('medicalVisitResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>