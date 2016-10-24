<a4j:form id="markListSearchCriteriaForm">
	<a4j:region>
		<table width="75%">
			<tr>
				<td><h:outputText value="#{msg.matricule }" /></td>
				<td>
					<h:inputText id="markListSearchMatricule" onkeyup="convertToUpperCase(this);"
						value="#{examBean.markSearch.matricule}" />
				</td>
				<td><h:outputText value="#{msg.lastName }" /></td>
				<td>
					<h:inputText id="markListSearchLastName" onkeyup="convertToUpperCase(this);"
						value="#{examBean.markSearch.lastName}" />
				</td>
				<td><h:outputText value="#{msg.firstName }" /></td>
				<td>
					<h:inputText id="markListSearchFirstName" onkeyup="convertToUpperCase(this);"
						value="#{examBean.markSearch.firstName}" />
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.year }" /></td>
				<td><rich:comboBox id="markListSearchSchoolYear" value="#{examBean.markSearch.year}"
					suggestionValues="#{schoolYearBean.allSchoolYears}">
				</rich:comboBox></td>
				
				<td><h:outputText value="#{msg.term}" /></td>
				<td><rich:comboBox id="markListSearchTerm" value="#{examBean.markSearch.termName}"
					suggestionValues="#{termBean.allTerms}" /></td>
				
				<td><h:outputText value="#{msg.classe }" /></td>
				<td><rich:comboBox id="markListSearchLevelClass"
						value="#{examBean.markSearch.className}"
						suggestionValues="#{levelClassBean.allLevelClasses}">
					</rich:comboBox></td>			
			</tr>
			<tr>
				<td><h:outputText value="#{msg.subject}" /></td>
				<td><rich:comboBox id="markListSearchSubject"
					suggestionValues="#{subjectBean.allSubjects}"
					value="#{examBean.markSearch.subjectName}" /></td>
			
				<td><h:outputText value="#{msg.examName }" /></td>
				<td>
					<h:inputText id="markListSearchExamName" onkeyup="convertToUpperCase(this);"
						value="#{examBean.markSearch.examName}" />
				</td>
				
				<td><h:outputText value="#{msg.examDate}" /></td>
				<td>
					<rich:calendar id="markListSearchExamDate"
						value="#{examBean.markSearch.examDate}" locale="fr" popup="true"
						datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						style="width:200px" enableManualInput="true">
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar>
				</td>

					<td><a4j:commandButton value="#{msg.search}"
							onclick="buttonClicked = true; "
							action="#{examBean.getSearchedMarks}" reRender="marks"
							/>
					</td>					
				</tr>
			</table>

		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('waitExamList')}.show()}"
			onstop="buttonClicked = false; #{rich:component('waitExamList')}.hide()" />
	</a4j:region>

</a4j:form>


<a4j:form>
	<a4j:region>

		<a4j:outputPanel id="marks">
			<rich:dataTable value="#{examBean.marks}" var="mark" rows="15" 
				rendered="#{examBean.rowCount > 0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.marks}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{mark.matricule}" filterEvent="onkeyup" sortBy="#{mark.matricule}">
					<f:facet name="header">
						<h:outputText value="#{msg.matricule}" />
					</f:facet>
					<h:outputText value="#{mark.matricule}" />
				</rich:column>
				
				<rich:column filterBy="#{mark.studentLastName}" filterEvent="onkeyup" sortBy="#{mark.studentLastName}">
					<f:facet name="header">
						<h:outputText value="#{msg.lastName}" />
					</f:facet>
					<h:outputText value="#{mark.studentLastName}" />
				</rich:column>

				<rich:column filterBy="#{mark.studentFirstName}" filterEvent="onkeyup" sortBy="#{mark.studentFirstName}">
					<f:facet name="header">
						<h:outputText value="#{msg.firstName}" />
					</f:facet>
					<h:outputText value="#{mark.studentFirstName}" />
				</rich:column>


				<rich:column filterBy="#{mark.examName}" filterEvent="onkeyup" sortBy="#{mark.examName}">
					<f:facet name="header">
						<h:outputText value="#{msg.examName}" />
					</f:facet>
					<h:outputText value="#{mark.examName}" />
				</rich:column>

				<rich:column filterBy="#{mark.termName}" filterEvent="onkeyup" sortBy="#{mark.termName}">
					<f:facet name="header">
						<h:outputText value="#{msg.term}" />
					</f:facet>
					<h:outputText value="#{mark.termName}" />
				</rich:column>

				<rich:column filterBy="#{mark.schoolYear}" filterEvent="onkeyup" sortBy="#{mark.schoolYear}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{mark.schoolYear}" />
				</rich:column>

				<rich:column filterBy="#{mark.examType}" filterEvent="onkeyup" sortBy="#{mark.examType}">
					<f:facet name="header">
						<h:outputText value="#{msg.examType}" />
					</f:facet>
					<h:outputText value="#{mark.examType}" />
				</rich:column>

				<rich:column filterBy="#{mark.subject}" filterEvent="onkeyup" sortBy="#{mark.subject}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{mark.subject}" />
				</rich:column>

				<rich:column filterBy="#{mark.className}" filterEvent="onkeyup" sortBy="#{mark.className}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{mark.className}" />
				</rich:column>

				<rich:column   sortBy="#{mark.examDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.examDate}" />
					</f:facet>
					<h:outputText value="#{mark.examDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column  sortBy="#{mark.mark}">
					<f:facet name="header">
						<h:outputText value="#{msg.mark}" />
					</f:facet>
					<h:outputText value="#{mark.mark}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.maxMarkForEntry}" />
					</f:facet>
					<h:outputText value="#{mark.maxMark}" />
				</rich:column>

				<rich:column filterBy="#{mark.grade}" filterEvent="onkeyup" sortBy="#{mark.grade}">
					<f:facet name="header">
						<h:outputText value="#{msg.grade}" />
					</f:facet>
					<h:outputText value="#{mark.grade}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{msg.approved}"
						rendered="#{mark.approvedBy>0 }" />
					<h:outputText value="#{msg.pendingApproval}"
						rendered="#{mark.approvedBy==0 }" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{examBean.loadMark}" reRender="notesPannel"
						rendered="#{mark.approvedBy == 0}"
						oncomplete="#{rich:component('marksPannel')}.show()">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{mark.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="approve"
						rendered="#{mark.approvedBy == 0}"
						action="#{examBean.approveThisMark}"
						reRender="markResultApproval"
						oncomplete="#{rich:component('markResultApproval')}.show()">
						<h:graphicImage value="images/approve.gif" style="border:0" />
						<f:param name="id" value="#{mark.id}" />
					</a4j:commandLink>


					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="approve" value="#{msg.approve}" />
				</rich:column>
				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<rich:messages />
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>

<rich:modalPanel id="markResultApproval" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{examBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{examBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			reRender="marks"
			oncomplete="#{rich:component('markResultApproval')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="marksPannel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<h:panelGrid columns="1">

			<a4j:outputPanel ajaxRendered="true">
					<h:inputHidden value="#{examBean.mark.id}" />

				<h:panelGrid columns="2">
					<h:outputText value="#{msg.lastName} " />
					<h:outputText value="#{examBean.mark.studentEnrollment.student.lastName}" />
					<h:outputText value="#{msg.firstName} " />
					<h:outputText value="#{examBean.mark.studentEnrollment.student.firstName}" />

					<h:outputText value="#{msg.mark}" />
					<h:inputText value="#{examBean.mark.mark}" />

				</h:panelGrid>

				<rich:message showSummary="true" showDetail="false" for="couleur" />
			</a4j:outputPanel>

			<h:panelGrid columns="2">
				<a4j:commandButton value="#{msg.save}" action="#{examBean.saveMark}"
					reRender="marks"
					oncomplete="if (#{facesContext.maximumSeverity==null}) #{rich:component('marksPannel')}.hide();" />
				
				<a4j:commandButton value="#{msg.close}" reRender="marks"
					oncomplete="if (#{facesContext.maximumSeverity==null}) #{rich:component('marksPannel')}.hide();" />
			</h:panelGrid>
		</h:panelGrid>
	</a4j:form>
</rich:modalPanel>



