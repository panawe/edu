<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionCurriculumProgress">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.curriculumProgress}" />
					</h:outputFormat>
				</f:facet>

				
				<a4j:outputPanel id="resultCurriculum">
							<table>
								<tr>
									<td><h:inputHidden
										value="#{curriculumProgressBean.curriculumProgress.curriculum.id}" /> <h:outputText
										value="#{msg.level}:" /></td>
									<td><h:outputText value="#{curriculumProgressBean.curriculumProgress.curriculum.level.name}" />
									</td>
									<td> <h:outputText value="#{msg.schoolYear}:" /></td>
									<td><h:outputText value="#{curriculumProgressBean.curriculumProgress.curriculum.schoolYear.year}" />
									</td><td><h:outputText value="#{msg.subject}:" /></td>
									<td><h:outputText value="#{curriculumProgressBean.curriculumProgress.curriculum.subject.name}" />
									</td><td><h:outputText value="#{msg.weekNumber}:" /></td>
									<td><h:outputText value="#{curriculumProgressBean.curriculumProgress.curriculum.weekNumber}" />
									</td>
									<td><a4j:region>
										<a4j:commandButton value="#{msg.chooseCurriculum}" rendered="#{link == 'school'}"
											action="#{curriculumProgressBean.selectCurriculum}"
											oncomplete="#{rich:component('resultPanelCurriculums')}.show()"
											reRender="resultPanelCurriculums" />
									</a4j:region></td>
								</tr>
							</table>
						</a4j:outputPanel>
						
    				<table class="table">
    				<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.teacher }"/></td>
							<td><rich:comboBox id="teacher"
								value="#{curriculumProgressBean.teacherName}"
								suggestionValues="#{teacherBean.teacherMLF}">
							</rich:comboBox> <font color="#FF0000"><rich:message for="teacher" /></font></td>
						</a4j:region>
					</tr>
    				
					<tr>
						<td><h:outputText value="#{msg.classe}" /></td>
						<td><rich:comboBox id="levelClass"
							value="#{curriculumProgressBean.levelClassName}"
							suggestionValues="#{levelClassBean.allLevelClasses}">
							</rich:comboBox></td>
					</tr>
					
					<tr> <td colspan="3">
						
					</td></tr>
					<tr>
						<td><h:outputText value="#{msg.status}:" /></td>
						<td><h:selectOneMenu id="status"
							value="#{curriculumProgressBean.curriculumProgress.status}"
							binding="#{curriculumProgressBean.myValue}">
							<f:selectItems value="#{curriculumProgressBean.configurationsByGroupName}" />
							<f:attribute name="groupName" value="CURRICULUM_PROGRESS_STATUS" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message for="status" /></font>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><h:outputText
							value="#{msg.comment}" /><rich:editor
							value="#{curriculumProgressBean.curriculumProgress.comment}" plugins="save,paste" width="700">
						</rich:editor></td>
						<td><font color="#FF0000"><rich:message for="comment" /></font></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}" rendered = "#{ schoolBean.userHasWriteAccess && link == 'school'}"
					action="#{curriculumProgressBean.insert}"
					reRender="curriculumProgresses, gestionCurriculumProgress" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{curriculumProgressBean.clear}" reRender="gestionCurriculumProgress" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="resultPanelCurriculums" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink221"
					styleClass="hidelink" />
				<rich:componentControl for="resultPanelCurriculums" attachTo="hidelink221"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>

</rich:modalPanel>