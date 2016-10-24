<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionCurriculum">
			<rich:panel id="CurriPanel"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.curriculum}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				
    				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.schoolYear}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="schoolYear"
							suggestionValues="#{schoolYearBean.allSchoolYears}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{curriculumBean.schoolYearName}" width="300px" /> <font
							color="#FF0000"><rich:message for="schoolYear" /></font></td>
					</tr>
					
					<tr>
						<td><h:outputText value="#{msg.level}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="level"
							suggestionValues="#{levelBean.allLevels}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{curriculumBean.levelName}" width="300px" /> <font
							color="#FF0000"><rich:message for="level" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.subject}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="subject"
							suggestionValues="#{subjectBean.allSubjects}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{curriculumBean.subjectName}" width="300px" /> <font
							color="#FF0000"><rich:message for="subject" /></font></td>
					</tr>
					
					<tr>
						<td><h:outputText value="#{msg.weekStartDate }" /><font
							color="#FF0000">*</font></td>
						<td><rich:calendar id="weekStartDate"
							value="#{curriculumBean.curriculum.weekStartDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							requiredMessage="#{msg.requiredMessage}" required="true"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="weekStartDate" /></font></td>
					</tr>
								
					<tr>
						<td><h:outputText value="#{msg.weekNumber}" /><font color="#FF0000">*</font></td>
						<td><h:inputText value="#{curriculumBean.curriculum.weekNumber}" /></td>
					</tr>

					<tr>
						<td colspan="2"><h:outputText
							value="#{msg.objective}" /><rich:editor
							value="#{curriculumBean.curriculum.objective}" plugins="save,paste" width="700">
						</rich:editor></td>
						<td><font color="#FF0000"><rich:message for="objective" /></font></td>
					</tr>
					
				
					
				</table>

				<a4j:commandButton value="#{msg.save}" rendered = "#{ (curriculumBean.userHasWriteAccess && link == 'school')||(studentBean.userHasWriteAccess &&link=='teacher')}"
					action="#{curriculumBean.insert}"
					reRender="curriculums, gestionCurriculum" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{curriculumBean.clear}" reRender="gestionCurriculum" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>