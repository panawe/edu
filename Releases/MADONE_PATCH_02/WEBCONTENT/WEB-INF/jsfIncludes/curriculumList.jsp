<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="curriculums">
			<rich:dataTable
				style="overflow: hidden; width: 100%; white-space: wrap;" rows="3"
				value="#{curriculumBean.curriculums}" var="curriculum"
				rendered="#{curriculumBean.rowCount>0}" reRender="ds"
				rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.curriculums}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{curriculum.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{curriculum.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.schoolYear}" />
					</f:facet>
					<h:outputText value="#{curriculum.schoolYear.year}" />
				</rich:column>

				<rich:column filterBy="#{curriculum.level.name}"
					filterEvent="onkeyup" sortBy="#{curriculum.level.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{curriculum.level.name}" />
				</rich:column>

				<rich:column filterBy="#{curriculum.subject.name}"
					filterEvent="onkeyup" sortBy="#{curriculum.subject.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{curriculum.subject.name}" />
				</rich:column>

				<rich:column filterBy="#{curriculum.weekStartDate}"
					filterEvent="onkeyup" sortBy="#{curriculum.weekStartDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.weekStartDate}" />
					</f:facet>
					<h:outputText value="#{curriculum.weekStartDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column filterBy="#{curriculum.weekNumber}"
					filterEvent="onkeyup" sortBy="#{curriculum.weekNumber}">
					<f:facet name="header">
						<h:outputText value="#{msg.weekNumber}" />
					</f:facet>
					<h:outputText value="#{curriculum.weekNumber}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.objective}" />
					</f:facet>
					<h:outputText escape="false" value="#{curriculum.shortObjective}" />

					<a4j:commandLink ajaxSingle="true" id="readMore"
						rendered="#{curriculum.showObjectiveLink}"
						action="#{curriculumBean.edit}"
						oncomplete="#{rich:component('cObjectivePanel')}.show();"
						reRender="cObjectivePanel" value="#{msg.readMore}">

						<f:param name="id" value="#{curriculum.id}" />
					</a4j:commandLink>
				</rich:column>

				<rich:column width="100" rendered="#{ link == 'school' }">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{curriculumBean.edit}" rendered="#{link == 'school' }"
						reRender="gestionCurriculum, curriculumPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{curriculum.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="addProgress"
						oncomplete="#{rich:component('cObjectiveResultPanel')}.show()"
						reRender="cObjectiveResultPanel" rendered="#{link == 'teacher' || link == 'school' }"
						action="#{curriculumProgressBean.addCurriculum}">
						<h:graphicImage value="/images/progress.gif" style="border:0" />
						<f:param name="id" value="#{curriculum.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{curriculumBean.delete}" rendered="#{link == 'school' }"
						reRender="gestionCurriculum, curriculums">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{curriculum.id}" />
					</a4j:commandLink>


					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
					<rich:toolTip for="addProgress" value="#{msg.curriculumProgresses}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

			<font color="#FF0000"> <error> <h:outputText
				value="#{curriculumBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{curriculumBean.successMessage}" /> </success> </font>

			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="cObjectiveResultPanel" autosized="true" width="700">
	<f:facet name="header">
		<h:outputText value="#{msg.objective}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink227"
				styleClass="hidelink" />
			<rich:componentControl for="cObjectiveResultPanel"
				attachTo="hidelink227" operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<a4j:form>
	<a4j:outputPanel id="curriculumProgressDetails">
		<table>
			<tr>
				<td><h:outputText value="#{msg.schoolYear}" /></td>
				<td><h:outputText
					value="#{curriculumProgressBean.curriculumProgress.curriculum.schoolYear.year}" /></td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.level}" /></td>
				<td><h:outputText
					value="#{curriculumProgressBean.curriculumProgress.curriculum.level.name}" /></td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.subject}" /></td>
				<td><h:outputText
					value="#{curriculumProgressBean.curriculumProgress.curriculum.subject.name}" /></td>
			</tr>

			<tr>
				<td><h:outputText value="#{msg.weekStartDate}" /></td>
				<td><h:outputText
					value="#{curriculumProgressBean.curriculumProgress.curriculum.weekStartDate}">
					<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
				</h:outputText></td>
			</tr>


			<tr>
				<td><h:outputText value="#{msg.weekNumber}" /></td>
				<td><h:outputText
					value="#{curriculumProgressBean.curriculumProgress.curriculum.weekNumber}" /></td>
			</tr>
			<tr>

				<td colspan="2"><h:outputText escape="false"
					value="#{curriculumProgressBean.curriculumProgress.curriculum.objective}" /></td>
			</tr>

			<tr>
				<td><h:outputText value="#{msg.classe}" /></td>
				<td><rich:comboBox id="levelClass"
					value="#{curriculumProgressBean.levelClassName}"
					suggestionValues="#{link == 'teacher' ? courseBean.allTeacherClasses : levelClassBean.allLevelClasses}">
					<a4j:support event="onchange" ajaxSingle="true"
								action="#{curriculumProgressBean.levelClassChanged}" reRender="curriculumProgressDetails" />
				</rich:comboBox></td>
			</tr>

			<tr>
				<td><h:outputText value="#{msg.status}" /></td>
				<td><h:selectOneMenu id="status"
					value="#{curriculumProgressBean.curriculumProgress.status}"
					binding="#{curriculumBean.myValue}">
					<f:selectItems value="#{curriculumProgressBean.configurationsByGroupName}" />
					<f:attribute name="groupName" value="CURRICULUM_PROGRESS_STATUS" />
				</h:selectOneMenu></td>

			</tr>
			<tr>
				<td><h:outputText value="#{msg.comment}" /></td>
				<td><h:inputTextarea id="CommentCuri"
					value="#{curriculumProgressBean.curriculumProgress.comment}"
					rows="5" cols="50" /></td>
			</tr>

			<tr>
				<td><a4j:commandButton value="#{msg.save}"
					rendered="#{ schoolBean.userHasWriteAccess && (link == 'school' || link == 'teacher')}"
					action="#{curriculumProgressBean.insert}"
					oncomplete="#{rich:component('cObjectiveResultPanel')}.hide()"
					reRender="CurriculumTab,curriculumProgresses, gestionCurriculumProgress" /></td>
				<td><a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{curriculumProgressBean.clear}"
						reRender="curriculumProgressDetails" />
				</a4j:region></td>
			</tr>
		</table>
	</a4j:outputPanel>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="cObjectivePanel" autosized="true" width="500">
	<f:facet name="header">
		<h:outputText value="#{msg.objective}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink222"
				styleClass="hidelink" />
			<rich:componentControl for="cObjectivePanel" attachTo="hidelink222"
				operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<a4j:form>
		<h:outputText escape="false"
			value="#{curriculumBean.curriculum.objective}" />
		</td>

	</a4j:form>
</rich:modalPanel>