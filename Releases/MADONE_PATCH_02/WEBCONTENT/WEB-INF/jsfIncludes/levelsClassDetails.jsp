<a4j:form>
	<a4j:region>
		<table>
			<tr>
				<td><h:outputText value="#{msg.classe}" /></td>
				<td><rich:comboBox id="levelClass"
						value="#{levelClassBean.className}"
						suggestionValues="#{levelClassBean.allLevelClasses}"
						disabled="#{levelClassBean.boxChecked}">
					</rich:comboBox></td>
				<td><h:outputText value="#{msg.year }" /></td>
				<td><rich:comboBox id="schoolYear"
						value="#{levelClassBean.year}"
						suggestionValues="#{schoolYearBean.allSchoolYears}"
						disabled="#{levelClassBean.boxChecked}">
					</rich:comboBox></td>
				<td colspan="2"><h:outputText value="#{msg.allStudents }" /> <h:selectBooleanCheckbox
						id="selectAllStudents" value="#{levelClassBean.selectAllStudents}"
						title="#{msg.allStudents}">
						<a4j:support event="onchange" ajaxSingle="true"
							action="#{levelClassBean.updateStudentSelection}"
							reRender="levelClass,schoolYear" />
					</h:selectBooleanCheckbox></td>
				<td><a4j:commandButton value="#{msg.search}" id="searchButtom"
						action="#{levelClassBean.search}" onclick="buttonClicked = true; "
						reRender="studentShutle,tuitionShutle"
						oncomplete="if (#{levelClassBean.searchRowCount <= 0}) #{rich:component('resultPanelStudent')}.show();" />
				</td>

			</tr>
		</table>

		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
	</a4j:region>
</a4j:form>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionLevelClass">
			<rich:panel
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.classe}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>. 
    	<table class="table">

					<tr>
						<td><h:outputText value="#{msg.tuitionOnly }" /></td>
					<td> <h:selectBooleanCheckbox
						id="selectAllStudents" value="#{levelClassBean.assignTuition}"
						title="#{msg.tuitionOnly}">
						<a4j:support event="onchange" ajaxSingle="true"
							action="#{levelClassBean.updateAssignTuition}"
							reRender="levelClass,enrollmentDate,schoolYear" />
					</h:selectBooleanCheckbox></td>
						<td><font color="#FF0000"><rich:message
									for="enrollmentDate" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.enrollmentDate}" /><font
							color="#FF0000">*</font></td>
						<td><rich:calendar id="enrollmentDate"
								value="#{levelClassBean.enrollmentDate}" locale="fr"
								popup="true" datePattern="dd/MM/yyyy" showFooter="false"
								disabled="#{levelClassBean.assignTuition}"
								showApplyButton="false" cellWidth="24px" cellHeight="22px"
								style="width:200px">
								<f:convertDateTime pattern="dd/MM/yyyy" />
							</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
									for="enrollmentDate" /></font></td>
					</tr>
					<!-- Level class Suggestion Box -->
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.levelClass}" /><font
								color="#FF0000">*</font></td>
							<td><rich:comboBox id="levelClass"
									value="#{levelClassBean.levelClassName}"
									disabled="#{levelClassBean.assignTuition}"
									defaultLabel="#{msg.enterListDefaultValue}"
									suggestionValues="#{levelClassBean.allLevelClasses}">

								</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
						</a4j:region>
					</tr>
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.year }" /><font
								color="#FF0000">*</font></td>
							<td><rich:comboBox id="schoolYear"
							disabled="#{levelClassBean.assignTuition}"
									value="#{levelClassBean.schoolYearName}"
									suggestionValues="#{schoolYearBean.allSchoolYears}">
								</rich:comboBox></td>
						</a4j:region>
					</tr>

					<tr>
						<td colspan="2"><rich:listShuttle id="studentShutle"
								sourceValue="#{levelClassBean.availableStudents}"
								targetValue="#{levelClassBean.selectedStudents}" var="student"
								converter="studentConverter"
								rendered="#{!levelClassBean.selectAllTeachers}"
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
						<td colspan="2"><rich:listShuttle id="tuitionShutle"
								sourceValue="#{levelClassBean.availableTuitions}"
								targetValue="#{levelClassBean.selectedTuitions}" var="tuition"
								converter="tuitionConverter"
								rendered="#{!levelClassBean.selectAllTeachers }"
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
									<h:outputText value="#{msg.availableTuitions}" />
								</f:facet>
								<f:facet name="targetCaption">
									<h:outputText value="#{msg.selectedTuitions}" />
								</f:facet>
								<rich:column width="100">
									<f:facet name="header">
										<h:outputText value="#{msg.year}" />
									</f:facet>
									<h:outputText value="#{tuition.schoolYear.year}" />
								</rich:column>
								<rich:column width="250">
									<f:facet name="header">
										<h:outputText value="#{msg.description}" />
									</f:facet>
									<h:outputText value="#{tuition.description}" />
								</rich:column>

								<rich:column width="100">
									<f:facet name="header">
										<h:outputText value="#{msg.amount}" />
									</f:facet>
									<h:outputText value="#{tuition.amount}" />
								</rich:column>
							</rich:listShuttle></td>
					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}"
					rendered="#{levelClassBean.userHasWriteAccess}"
					action="#{levelClassBean.inscrire}"
					onclick="buttonClicked = true; "
					reRender="gestionLevelClass,inscriptionModalPanel"
					oncomplete="#{rich:component('inscriptionModalPanel')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50> 
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{levelClassBean.clear}" reRender="gestionLevelClass" />
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
<rich:modalPanel id="inscriptionModalPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<br />

		<font color="#FF0000"> <error> <h:outputText
				value="#{levelClassBean.errorMessage}" /> </error>
		</font>
		<font color="#00FF00"> <success> <h:outputText
				value="#{levelClassBean.successMessage}" /> </success>
		</font>

		<br />
		<br />
		<a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('inscriptionModalPanel')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="resultPanelStudent" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p>
			<h:outputText value="#{msg.noResultFound}" />
		</p>
		<p></p>
		<p>
			<a4j:commandButton value="Fermer"
				action="#{levelClassBean.doNothing}" reRender="levelClasses"
				oncomplete=" #{rich:component('resultPanelStudent')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>
