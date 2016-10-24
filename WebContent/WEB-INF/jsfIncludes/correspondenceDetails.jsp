<a4j:form>
	<a4j:region>
		<table>
			<tr>
				<td><h:outputText value="#{msg.classe}" /></td>
				<td><rich:comboBox id="levelClass"
					value="#{correspondenceBean.className}"
					suggestionValues="#{levelClassBean.allLevelClasses}"
					disabled="#{correspondenceBean.boxChecked}">
				</rich:comboBox></td>
				<td><h:outputText value="#{msg.year }" /></td>
				<td><rich:comboBox id="schoolYear"
					value="#{correspondenceBean.year}"
					suggestionValues="#{schoolYearBean.allSchoolYears}"
					disabled="#{correspondenceBean.boxChecked}">
				</rich:comboBox></td>
				<td colspan="2"><h:outputText value="#{msg.allTeachers }" /> <h:selectBooleanCheckbox
					id="selectAllTeachers"
					value="#{correspondenceBean.selectAllTeachers}"
					title="#{msg.allTeachers }">

					<a4j:support event="onchange" ajaxSingle="true"
						action="#{correspondenceBean.updateTeacherSelection}"
						reRender="levelClass,schoolYear,selectAllStudents" />
				</h:selectBooleanCheckbox></td>
				<td colspan="2"><h:outputText value="#{msg.allStudents }" /> <h:selectBooleanCheckbox
					id="selectAllStudents"
					value="#{correspondenceBean.selectAllStudents}"
					title="#{msg.allStudents}">
					<a4j:support event="onchange" ajaxSingle="true"
						action="#{correspondenceBean.updateStudentSelection}"
						reRender="levelClass,schoolYear,selectAllTeachers" />
				</h:selectBooleanCheckbox></td>
				<td><a4j:commandButton value="#{msg.search}" id="searchButtom"
					action="#{correspondenceBean.search}"
					onclick="buttonClicked = true; "
					reRender="teacherShutle,studentShutle,correspondanceTabPanel"
					oncomplete="if (#{correspondenceBean.rowCount <= 0}) #{rich:component('resultPanelStudent')}.show();" />
				</td>

			</tr>
		</table>
							<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
	</a4j:region>
</a4j:form>

<a4j:region>
	<rich:modalPanel id="resultPanelStudent" autosized="true" width="300">
		<a4j:form>
			<f:facet name="header">
				<h:outputText value="#{msg.result}" />
			</f:facet>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="Fermer"
				action="#{correspondenceBean.doNothing}" reRender="correspondences"
				oncomplete=" #{rich:component('resultPanelStudent')}.hide();" /></p>
		</a4j:form>
	</rich:modalPanel>
</a4j:region>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionCorrespondence">
			<rich:panel>
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.correspondence}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>. 
    	<table class="table">
					<tr>
						<td colspan="2"><rich:listShuttle id="studentShutle"
							sourceValue="#{correspondenceBean.availableStudents}"
							targetValue="#{correspondenceBean.selectedStudents}"
							var="student" converter="studentConverter"
							rendered="#{!correspondenceBean.selectAllTeachers}"
							copyControlLabel="#{msg.copy }"
							removeControlLabel="#{msg.remove }"
							copyAllControlLabel="#{msg.copyAll}"
							removeAllControlLabel="#{msg.removeAll }"
							upControlLabel="#{msg.moveUp }"
							downControlLabel="#{msg.moveDown }"
							bottomControlLabel="#{msg.moveToBottom }"
							topControlLabel="#{msg.moveToTop }" sourceListWidth="450"
							targetListWidth="450">
							<f:facet name="sourceCaption">
								<h:outputText value="#{msg.availableStudents}" />
							</f:facet>
							<f:facet name="targetCaption">
								<h:outputText value="#{msg.selectedStudents}" />
							</f:facet>
							<rich:column width="150">
								<f:facet name="header">
									<h:outputText value="#{msg.matricule}" />
								</f:facet>
								<h:outputText value="#{student.matricule}" />
							</rich:column>
							<rich:column width="150">
								<f:facet name="header">
									<h:outputText value="#{msg.firstName}" />
								</f:facet>
								<h:outputText value="#{student.firstName}" />
							</rich:column>
							<rich:column width="150">
								<f:facet name="header">
									<h:outputText value="#{msg.lastName}" />
								</f:facet>
								<h:outputText value="#{student.lastName}" />
							</rich:column>

						</rich:listShuttle></td>
					</tr>

					<tr>
						<td colspan="2"><rich:listShuttle id="teacherShutle"
							sourceValue="#{correspondenceBean.availableTeachers}"
							targetValue="#{correspondenceBean.selectedTeachers}"
							var="teacher" converter="teacherConverter"
							rendered="#{correspondenceBean.selectAllTeachers}"
							copyControlLabel="#{msg.copy }"
							removeControlLabel="#{msg.remove }"
							copyAllControlLabel="#{msg.copyAll}"
							removeAllControlLabel="#{msg.removeAll }"
							upControlLabel="#{msg.moveUp }"
							downControlLabel="#{msg.moveDown }"
							bottomControlLabel="#{msg.moveToBottom }"
							topControlLabel="#{msg.moveToTop }" sourceListWidth="450"
							targetListWidth="450">
							<f:facet name="sourceCaption">
								<h:outputText value="#{msg.availableTeachers}" />
							</f:facet>
							<f:facet name="targetCaption">
								<h:outputText value="#{msg.selectedTeachers}" />
							</f:facet>
							<f:facet name="topControl">
								<h:outputText value="#{msg.moveToTop }" />
							</f:facet>
							<f:facet name="upControl">
								<h:outputText value="#{msg.moveUp }" />
							</f:facet>
							<f:facet name="downControl">
								<h:outputText value="#{msg.moveDown }" />
							</f:facet>
							<f:facet name="bottomControl">
								<h:outputText value="#{msg.moveToBottom }" />
							</f:facet>
							<rich:column width="150">
								<f:facet name="header">
									<h:outputText value="#{msg.matricule}" />
								</f:facet>
								<h:outputText value="#{teacher.matricule}" />
							</rich:column>
							<rich:column width="150">
								<h:inputHidden value="#{teacher.matricule}" />
								<f:facet name="header">
									<h:outputText value="#{msg.firstName}" />
								</f:facet>
								<h:outputText value="#{teacher.firstName}" />
							</rich:column>
							<rich:column width="150">
								<f:facet name="header">
									<h:outputText value="#{msg.lastName}" />
								</f:facet>
								<h:outputText value="#{teacher.lastName}" />
							</rich:column>
						</rich:listShuttle></td>
					</tr>


					<tr>
						<td><h:outputText value="#{msg.mailSubject}" /></td>
						<td><h:inputText id="mailSubject"
							value="#{correspondenceBean.correspondence.subject}" size="60"
							maxlength="250">
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="mailSubject" /></font></td>
					</tr>
					<tr>
						<td colspan="2"><h:inputHidden
							value="#{correspondenceBean.correspondence.id}" /> <h:outputText
							value="#{msg.message}" /><rich:editor
							value="#{correspondenceBean.correspondence.description}"
							theme="advanced" plugins="save,paste" width="700">

							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline, cut,copy,paste,pasteword" />

							<f:param name="theme_advanced_toolbar_location" value="top" />

							<f:param name="theme_advanced_toolbar_align" value="left" />

						</rich:editor></td>
						<td><font color="#FF0000"><rich:message
							for="description" /></font></td>
					</tr>
					<tr>
						<td colspan="2"><h:selectBooleanCheckbox id="sendEmail"
							value="#{correspondenceBean.sendEmail}" title="#{msg.sendEmail}">
						</h:selectBooleanCheckbox> <h:outputText value="#{msg.sendEmail}" /></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}"
					rendered="#{correspondenceBean.userHasWriteAccess}"
					action="#{correspondenceBean.insert}"
					onclick="buttonClicked = true; "
					reRender="correspondences, gestionCorrespondence,allCorrespondenceResultPanel,correspondanceTabPanel"
					oncomplete="#{rich:component('allCorrespondenceResultPanel')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{correspondenceBean.clear}"
						reRender="gestionCorrespondence" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
					<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait1')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait1')}.hide()" />
	</a4j:region>
</a4j:form>
<rich:modalPanel id="wait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>
<rich:modalPanel id="wait1" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>
<rich:modalPanel id="allCorrespondenceResultPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{correspondenceBean.errorMessage}" /> </error> </font> <font
			color="#00FF00"> <success> <h:outputText
			value="#{correspondenceBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('allCorrespondenceResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>