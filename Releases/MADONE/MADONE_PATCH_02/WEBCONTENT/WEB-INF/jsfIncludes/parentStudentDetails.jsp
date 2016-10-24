<a4j:form>
	<a4j:region>
		<table>
			<tr>
				<td><h:outputText value="#{msg.lastName}" /></td>
				<td><h:inputText
					onkeyup="convertToUpperCase(this);" value="#{parentBean.studentLastName}" /></td>
				<td><h:outputText value="#{msg.classe}" /></td>
				<td><rich:comboBox id="levelClass"
						value="#{parentBean.className}"
						suggestionValues="#{levelClassBean.allLevelClasses}"
						disabled="#{parentBean.boxChecked}">
					</rich:comboBox></td>
				<td><h:outputText value="#{msg.year }" /></td>
				<td><rich:comboBox id="schoolYear"
						value="#{parentBean.year}"
						suggestionValues="#{schoolYearBean.allSchoolYears}"
						disabled="#{parentBean.boxChecked}">
					</rich:comboBox></td>
				<td colspan="2"><h:outputText value="#{msg.allStudents }" /> <h:selectBooleanCheckbox
						id="selectAllStudents" value="#{parentBean.selectAllStudents}"
						title="#{msg.allStudents}">
						<a4j:support event="onchange" ajaxSingle="true"
							action="#{parentBean.updateStudentSelection}"
							reRender="levelClass, schoolYear" />
					</h:selectBooleanCheckbox></td>
				<td><a4j:commandButton value="#{msg.search}" id="searchButtom"
						action="#{parentBean.searchStudents}" onclick="buttonClicked = true; "
						reRender="studentShutle"
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
		<a4j:outputPanel id="gestionParentStudent">
			<rich:panel
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.parent}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
	
				<table class="table">
					<tr>
						<td>
							<table class="table">
								<tr>
									<td colspan="2"><rich:listShuttle id="studentShutle"
											sourceValue="#{parentBean.availableStudents}"
											targetValue="#{parentBean.selectedStudents}"
											var="student" converter="studentConverter"
											rendered="true"
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
											<rich:column width="100">
												<f:facet name="header">
													<h:outputText value="#{msg.parentType}" />
												</f:facet>
												<h:selectOneMenu 
													value="#{student.parentType}"
													binding="#{parentBean.myValue}">
													<f:selectItems value="#{parentBean.configurationsByGroupName}" />
													<f:attribute name="groupName" value="PARENT_TYPE" />
												</h:selectOneMenu>
											</rich:column>
										</rich:listShuttle></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}"
					rendered="#{parentBean.userHasWriteAccess}"
					action="#{parentBean.assign}"
					onclick="buttonClicked = true; "
					reRender="gestionParentStudent,assignStudentModalPanel"
					oncomplete="#{rich:component('assignStudentModalPanel')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50> <a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{parentBean.clear}" reRender="gestionParentStudent" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('parentStudentWait1')}.show()}"
			onstop="buttonClicked = false; #{rich:component('parentStudentWait1')}.hide()" />
	</a4j:region>
</a4j:form>

<a4j:form>
	<p>
		<a4j:commandButton value="Fermer"
			action="#{parentBean.doNothing}" reRender="levelClasses"
			oncomplete=" #{rich:component('parentStudentDetailsPanel')}.hide();" />
	</p>
</a4j:form>
	
<rich:modalPanel id="wait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>
<rich:modalPanel id="parentStudentWait1" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>
<rich:modalPanel id="assignStudentModalPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<br />

		<font color="#FF0000"> <error> <h:outputText
				value="#{parentBean.errorMessage}" /> </error>
		</font>
		<font color="#00FF00"> <success> <h:outputText
				value="#{parentBean.successMessage}" /> </success>
		</font>

		<br />
		<br />
		<a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('assignStudentModalPanel')}.hide();" />
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
				action="#{parentBean.doNothing}" reRender="gestionParentStudent"
				oncomplete=" #{rich:component('resultPanelStudent')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>
