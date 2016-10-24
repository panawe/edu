<a4j:form>
	<table>
		<tr>
			<td><h:outputText value="#{msg.name }" /></td>
			<td><h:inputText id="teacherAssignmentFileName" onkeyup="convertToUpperCase(this);" value="#{assignmentFileBean.fileSearch.fileName}" /></td>
			<a4j:region>
				<td><h:outputText value="#{msg.year}" /></td>
				<td><rich:comboBox id="teacherAssignmentFileListSchoolYear" value="#{assignmentFileBean.fileSearch.yearName}"
					suggestionValues="#{schoolYearBean.allSchoolYears}"> 
					<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
				</rich:comboBox></td>
			</a4j:region>
			<a4j:region>
				<td><h:outputText value="#{msg.subject}" /></td>
				<td><rich:comboBox id="teacherAssignmentFileListSubject"
					value="#{assignmentFileBean.fileSearch.subjectName}"
					suggestionValues="#{subjectBean.allSubjects}">
					<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
				</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>
			</a4j:region>
			<a4j:region>
				<td><h:outputText value="#{msg.classe}" /></td>
				<td><rich:comboBox id="teacherAssignmentFileListLevelClass"
					value="#{assignmentFileBean.fileSearch.className}"
					suggestionValues="#{levelClassBean.allLevelClasses}">
					<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
				</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
			</a4j:region>
			
			<td>
				<a4j:commandButton value="#{msg.search}"
					onclick="buttonClicked = true; "
					action="#{assignmentFileBean.searchedFiles}" reRender="assignmentFiles"/>
			</td>
		</tr>
	</table>
</a4j:form>


<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="assignmentFiles">
			<h:outputText value="#{msg.noFileFound }" rendered="#{assignmentFileBean.rowCount == 0}" />
			<rich:dataTable rows="10" value="#{assignmentFileBean.assignmentFiles}"
				var="assignmentFile" rendered="#{assignmentFileBean.rowCount > 0}"
				reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.assignmentFile}" />
					</h:outputFormat>
				</f:facet>

				<rich:column width="10" filterBy="#{assignmentFile.createDate}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.createDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.createDate}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.createDate}">
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
						<h:graphicImage value="#{assignmentFile.fileTypeImagePath}" width="20"
							height="20" />
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
						rendered="#{user.school.id == assignmentFile.school.id }"
						action="#{assignmentFileBean.edit}" reRender="assignmentFilePanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{assignmentFileBean.delete}"
						rendered="#{user.school.id == assignmentFile.school.id}"
						reRender="assignmentFileDetails, assignmentFiles">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</a4j:commandLink>

 					<a4j:commandLink ajaxSingle="true" id="choose" 
				        action="#{assignmentFileBean.pickFile('teacher', assignmentFile.id)}" 
				        rendered="true" 
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