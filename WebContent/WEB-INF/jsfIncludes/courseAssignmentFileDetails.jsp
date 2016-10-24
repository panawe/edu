<style type="text/css">
	a.button {
	    display: inline-block;
	    background: lightblue;
	    border: 2px outset lightgray;
	    cursor: default;
	}
	a.button:active {
	    border-style: inset;
	}
</style>


<a4j:form>
 
		<a4j:outputPanel id="courseAssignmentFileDetails">
			<rich:panel  style="overflow: hidden; width: 100%; white-space: nowrap;" >
				<f:facet name="header">
		        	<h:outputFormat value="#{msg.detailsHeader}">
		        		 <f:param value="#{msg.document}"/>
		        	</h:outputFormat>
			    </f:facet>
				<table class="table">
					<tr>
						
							<td><h:outputText value="#{msg.year}" /><font color="#FF0000">* </font></td>
							<td><a4j:region><rich:comboBox id="teacherAssignmentFileDetailsSchoolYear" value="#{assignmentFileBean.examFile.yearName}"
								suggestionValues="#{schoolYearBean.allSchoolYears}"> 
								<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
							</rich:comboBox></a4j:region></td>
						
					</tr>
					<tr>
						
							<td><h:outputText value="#{msg.subject}" /><font color="#FF0000">* </font></td>
							<td><a4j:region><rich:comboBox id="teacherAssignmentFileDetailsSubject"
								value="#{assignmentFileBean.examFile.subjectName}"
								suggestionValues="#{subjectBean.allSubjects}">
								<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
							</rich:comboBox> <font color="#FF0000"><rich:message for="teacherAssignmentFileDetailsSubject" /></font></a4j:region></td>
						
					</tr>	
					<tr>
						
							<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">* </font></td>
							<td><a4j:region><rich:comboBox id="teacherAssignmentFileDetailsLevelClass"
								value="#{assignmentFileBean.examFile.className}"
								suggestionValues="#{levelClassBean.allLevelClasses}">
								<a4j:support event="onchange" ajaxSingle="true" action = "#{assignmentFileBean.findCourseAssignedFiles}" reRender="currentAssignedFile" />
							</rich:comboBox> <font color="#FF0000"><rich:message for="teacherAssignmentFileDetailsLevelClass" /></font></a4j:region></td>
						
					</tr>
					<tr>
						<td><h:outputText value="#{msg.examType}" /></td>
						<td><rich:comboBox id="teacherAssignmentFileDetailsExamType"
							value="#{assignmentFileBean.examFile.examTypeName}"
							suggestionValues="#{examTypeBean.allExamTypes}" /> <font
							color="#FF0000"><rich:message for="teacherAssignmentFileDetailsExamType" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.examDate}" /></td>
						<td><rich:calendar id="teacherAssignmentFileDetailsExamDate"
							value="#{assignmentFileBean.examFile.examDate}" locale="fr" popup="true"
							datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.dateRemise}" /></td>
						<td><rich:calendar id="teacherAssignmentFileDetailsReturnDate"
							value="#{assignmentFileBean.examFile.returnDate}" locale="fr" popup="true"
							datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					</tr>
					<tr>
						
							<td valign="top" colspan="2">
							<a4j:region>
								<a4j:commandButton
									value="#{msg.existingFile}" action="#{assignmentFileBean.doNothing}"
									onclick="buttonClicked = true;"
									oncomplete="#{rich:component('existingAssignmentFile')}.show();" /> 
									<rich:spacer width="40" height="10" title="" /> 
								<a4j:commandButton
									value="#{msg.newFile}" action="#{assignmentFileBean.doNothing}"
									onclick="buttonClicked = true;" reRender="newAssignmentFile"
									oncomplete="#{rich:component('newAssignmentFile')}.show();" />
								</a4j:region>
								</td>
					
					</tr>
					<tr>
						<td colspan="2">
							<a4j:outputPanel id="currentAssignedFile">
								<br />
								<%@include file="/WEB-INF/jsfIncludes/selectedFileList.jsp"%>
							</a4j:outputPanel>
						</td>
					</tr>
				</table>
	
				<a4j:commandButton value="#{msg.save}" action="#{assignmentFileBean.addCourseAssignmentFiles}"
					reRender="courseAssignmentFileDetails, courseAssignmentFileResultPanel1" oncomplete="#{rich:component('courseAssignmentFileResultPanel1')}.show();"/>
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{assignmentFileBean.clearCourseAssignment}" reRender="courseAssignmentFileDetails" />
				</a4j:region>
						
			</rich:panel>
		</a4j:outputPanel>
	 
</a4j:form>

<rich:modalPanel id="courseAssignmentFileResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{assignmentFileBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{assignmentFileBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('courseAssignmentFileResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="newAssignmentFile" autosized="true" width="500">
	<%@include file="/WEB-INF/jsfIncludes/assignmentFileDetails.jsp"%>
	<p>
		<a4j:form>
			<a4j:commandButton value="#{msg.save }" immediate="true" action="#{assignmentFileBean.saveDescription}"
			oncomplete="#{rich:component('newAssignmentFile')}.hide();" reRender="selectedFiles" />
		</a4j:form>
	</p>
</rich:modalPanel>

<rich:modalPanel id="existingAssignmentFile" autosized="true" width="500">
	<%@include file="/WEB-INF/jsfIncludes/assignmentFileList.jsp"%>
	<p>
		<a4j:form>
			<a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('existingAssignmentFile')}.hide();" reRender="selectedFiles" />
		</a4j:form>
	</p>
</rich:modalPanel>
