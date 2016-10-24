<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionExamTimeTable">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.examTimeTable}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				
    				<table class="table">
    				
	    				<tr>
	    					<h:inputHidden value="#{examTimeTableBean.timeTable.id}" />
							<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
							<td><rich:comboBox id="schoolYear"
								value="#{examTimeTableBean.schoolYearName}"
								suggestionValues="#{schoolYearBean.allSchoolYears}">
							</rich:comboBox></td>
						</tr>
	    				
	    				<tr>
							<td><h:outputText value="#{msg.term }" /><font color="#FF0000"></font></td>
							<td><rich:comboBox id="term"
								value="#{examTimeTableBean.termName}"
								suggestionValues="#{termBean.allTerms}">
							</rich:comboBox></td>
						</tr>
						
						<tr>
							<a4j:region>
								<td><h:outputText value="#{msg.subject}" /><font color="#FF0000">*</font></td>
								<td><rich:comboBox id="subject"
									value="#{examTimeTableBean.subjectName}"
									suggestionValues="#{subjectBean.allSubjects}">
								</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>
							</a4j:region>
						</tr>
	
						<tr>
							<a4j:region>
								<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
								<td><rich:comboBox id="levelClass"
									value="#{examTimeTableBean.levelClassName}"
									suggestionValues="#{levelClassBean.allLevelClasses}">
								</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
							</a4j:region>
						</tr>
	
						<tr>
							<td><h:outputText value="#{msg.examDate }" /><font
								color="#FF0000">*</font></td>
							<td><rich:calendar id="examDate"
								value="#{examTimeTableBean.timeTable.examDate}" locale="fr"
								popup="true" datePattern="dd/MM/yyyy" showFooter="false"
								requiredMessage="#{msg.requiredMessage}" required="true"
								showApplyButton="false" cellWidth="24px" cellHeight="22px"
								style="width:200px, border-color : blue;">
								<f:convertDateTime pattern="dd/MM/yyyy" />
							</rich:calendar></td>
							<td><font color="#FF0000"><rich:message
								for="examDate" /></font></td>
						</tr>
						
						<tr>
							<td><h:outputText value="#{msg.beginTime}" /><font color="#FF0000">*</font></td>
							<td><h:inputText
								value="#{examTimeTableBean.timeTable.beginTime}" /></td>
						</tr>
	
						<tr>
							<td><h:outputText value="#{msg.endTime}" /><font color="#FF0000">*</font></td>
							<td><h:inputText
								value="#{examTimeTableBean.timeTable.endTime}" /></td>
						</tr>
	
					</table>

				<a4j:commandButton value="#{msg.save}" rendered = "#{ schoolBean.userHasWriteAccess }"
					action="#{examTimeTableBean.insert}"
					reRender="examTimeTables, gestionExamTimeTable" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{examTimeTableBean.clear}" reRender="gestionExamTimeTable" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>