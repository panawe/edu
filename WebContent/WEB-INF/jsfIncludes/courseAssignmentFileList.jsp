<a4j:form>
	<table>
		<tr>
			<td><h:outputText value="#{msg.name }" /></td>
			<td><h:inputText id="courseAssignmentFileName" onkeyup="convertToUpperCase(this);" value="#{assignmentFileBean.fileSearch.fileName}" /></td>
			
				<td><h:outputText value="#{msg.year}" /></td>
				<td><a4j:region><rich:comboBox id="courseAssignmentFileListSchoolYear" value="#{assignmentFileBean.fileSearch.yearName}"
					suggestionValues="#{schoolYearBean.allSchoolYears}"> 
					<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
				</rich:comboBox></a4j:region></td>
			
			
				<td><h:outputText value="#{msg.subject}" /></td>
				<td><a4j:region><rich:comboBox id="courseAssignmentFileListSubject"
					value="#{assignmentFileBean.fileSearch.subjectName}"
					suggestionValues="#{subjectBean.allSubjects}">
					<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
				</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></a4j:region></td>
			
			
				<td><h:outputText value="#{msg.classe}" /></td>
				<td><a4j:region><rich:comboBox id="courseAssignmentFileListLevelClass"
					value="#{assignmentFileBean.fileSearch.className}"
					suggestionValues="#{levelClassBean.allLevelClasses}">
				</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></a4j:region></td>
			
		</tr>
		<tr>
			
				<td><h:outputText value="#{msg.examType}" /></td>
				<td><a4j:region><rich:comboBox id="courseAssignmentFileListExamType"
					value="#{assignmentFileBean.fileSearch.examTypeName}"
					suggestionValues="#{examTypeBean.allExamTypes}">
				</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></a4j:region></td>
			
		
				<td><h:outputText value="#{msg.examDate}" /></td>
				<td><rich:calendar id="courseAssignmentFileDetailsExamDate"
					value="#{assignmentFileBean.fileSearch.examDate}" locale="fr" popup="true"
					datePattern="dd/MM/yyyy" showFooter="false"
					showApplyButton="false" cellWidth="24px" cellHeight="22px"
					style="width:200px">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</rich:calendar></td>
				<td><h:outputText value="#{msg.dateRemise}" /></td>
				<td><rich:calendar id="courseAssignmentFileDetailsReturnDate"
					value="#{assignmentFileBean.fileSearch.returnDate}" locale="fr" popup="true"
					datePattern="dd/MM/yyyy" showFooter="false"
					showApplyButton="false" cellWidth="24px" cellHeight="22px"
					style="width:200px">
					<f:convertDateTime pattern="dd/MM/yyyy" />
				</rich:calendar>
						
			<td>
				<a4j:commandButton value="#{msg.search}"
					onclick="buttonClicked = true; "
					action="#{assignmentFileBean.searchedCourseFiles}" reRender="courseAssignmentFiles"/>
			</td>
		</tr>
	</table>
</a4j:form>


<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="courseAssignmentFiles">
			<h:outputText value="#{msg.noFileFound}" rendered="#{assignmentFileBean.rowCount == 0}" />
			<rich:dataTable rows="10" value="#{assignmentFileBean.assignmentFiles}"
				var="assignmentFile" rendered="#{assignmentFileBean.rowCount > 0}"
				reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.assignmentFile}" />
					</h:outputFormat>
				</f:facet>

				<rich:column width="10" filterBy="#{assignmentFile.yearName}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.yearName}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.yearName}" />
				</rich:column>

				<rich:column width="10" filterBy="#{assignmentFile.className}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.className}">
					<f:facet name="header">
						<h:outputText value="#{msg.levelClass}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.className}" />
				</rich:column>

				<rich:column width="10" filterBy="#{assignmentFile.subjectName}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.subjectName}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.subjectName}" />
				</rich:column>

				<rich:column width="10" filterBy="#{assignmentFile.examTypeName}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.examTypeName}">
					<f:facet name="header">
						<h:outputText value="#{msg.examType}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.examTypeName}" />
				</rich:column>

				<rich:column width="10" filterBy="#{assignmentFile.examDate}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.examDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.examDate}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.examDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column width="10" filterBy="#{assignmentFile.returnDate}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.returnDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.returnDate}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.returnDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column width="10" filterBy="#{assignmentFile.name}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.fileName}" />
					</f:facet>
					<h:commandLink action="#{assignmentFileBean.openFile}">
						<h:outputText value="#{assignmentFile.name}" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</h:commandLink>
				</rich:column>
				<rich:column width="10" style="white-space:normal;">
					<f:facet name="header">
						<h:outputText value="#{msg.fileType}" />
					</f:facet>
					<h:commandLink action="#{assignmentFileBean.openFile}">
						<h:graphicImage value="#{assignmentFile.fileTypeImagePath}" width="20" height="20" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</h:commandLink>
				</rich:column>
				<rich:column width="10" filterBy="#{assignmentFile.description}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.description}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.description}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{assignmentFileBean.selectedTab == 'list'}"
						action="#{assignmentFileBean.edit}" reRender="assignmentFilePanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{assignmentFileBean.delete}"
						rendered="#{assignmentFileBean.selectedTab == 'list'}"
						reRender="assignmentFileDetails, assignmentFiles">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</a4j:commandLink>

 					<a4j:commandLink ajaxSingle="true" id="choose" 
				        action="#{assignmentFileBean.pickFile('teacher', assignmentFile.id)}" 
				        rendered="#{assignmentFileBean.selectedTab == 'details'}" 
				        reRender="currentAssignedFile"
						oncomplete="#{rich:component('existingAssignmentFile')}.hide()">
			            <h:graphicImage value="images/addtobasket.gif" style="border:0"/>
			            <f:param name="id" value="#{assignmentFile.id}"/>
			        </a4j:commandLink>  
			        
					<rich:toolTip for="modify" value="#{msg.select}" />
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