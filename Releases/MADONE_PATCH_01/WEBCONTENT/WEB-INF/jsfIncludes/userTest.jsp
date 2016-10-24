
	<table>

<tr>
<td><h:outputText value="#{msg.classe}" /></td>
<td><h:outputText value="#{msg.year }" /></td>
<td><h:outputText value="#{msg.allStudents }" /> </td>
<td></td>
</tr>
		<tr>
			
			<td><rich:comboBox id="levelClass"
				value="#{levelClassBean.className}"
				suggestionValues="#{levelClassBean.allLevelClasses}"
				disabled="#{levelClassBean.boxChecked}">
			</rich:comboBox></td>			
			
			<td><rich:comboBox id="schoolYear" value="#{levelClassBean.year}"
				suggestionValues="#{schoolYearBean.allSchoolYears}"
				disabled="#{levelClassBean.boxChecked}">
			</rich:comboBox></td>
			
			<td><h:selectBooleanCheckbox
				id="selectAllStudents" value="#{levelClassBean.selectAllStudents}"
				title="#{msg.allStudents}">
				<a4j:support event="onchange" ajaxSingle="true"
					action="#{levelClassBean.updateStudentSelection}"
					reRender="levelClass,schoolYear" />
			</h:selectBooleanCheckbox></td>
			
			<td><a4j:commandButton value="#{msg.search}" id="searchButton"
				action="#{levelClassBean.search}"
				reRender="onlineTestPanel"
				oncomplete="if (#{levelClassBean.rowCount <= 0}) #{rich:component('resultPanelStudent')}.show();" />
			</td>

		</tr>
	</table>


	<rich:modalPanel id="resultPanelStudent" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<p><h:outputText value="#{msg.noResultFound}" /></p>
		<p></p>
		<p><a4j:commandButton value="Fermer"
			action="#{levelClassBean.doNothing}" reRender="levelClasses"
			oncomplete=" #{rich:component('resultPanelStudent')}.hide();" /></p>
	</rich:modalPanel>


	<a4j:outputPanel id="gestionLevelClass">
		<rich:panel  style="overflow: hidden; width: 85%; white-space: nowrap;" >
			<f:facet name="header">
				<h:outputFormat value="#{testBean.test.title}">
					<f:param value=" | #{msg.select }  #{msg.students}" />
				</h:outputFormat>
			</f:facet>
			<a4j:outputPanel ajaxRendered="true">
				<h:messages />
			</a4j:outputPanel>. 
    	<table class="table">
				<tr>
					<td colspan="2"><rich:listShuttle id="studentShutle"
						sourceValue="#{levelClassBean.availableStudents}"
						targetValue="#{testBean.selectedStudents}" var="student"
						converter="studentConverter"
						rendered="#{!levelClassBean.selectAllTeachers}"
						copyControlLabel="#{msg.copy }"
						removeControlLabel="#{msg.remove }"
						copyAllControlLabel="#{msg.copyAll}"
						removeAllControlLabel="#{msg.removeAll }"
						upControlLabel="#{msg.moveUp }"
						downControlLabel="#{msg.moveDown }"
						bottomControlLabel="#{msg.moveToBottom }"
						topControlLabel="#{msg.moveToTop }" sourceListWidth="300"
						targetListWidth="300">
						<f:facet name="sourceCaption">
							<h:outputText value="#{msg.availableStudents}" />
						</f:facet>
						<f:facet name="targetCaption">
							<h:outputText value="#{msg.selectedStudents}" />
						</f:facet>
						<rich:column>
							<f:facet name="header">
								<h:outputText value="#{msg.matricule}" />
							</f:facet>
							<h:outputText value="#{student.matricule}" />
						</rich:column>
						<rich:column>
							<f:facet name="header">
								<h:outputText value="#{msg.firstName}" />
							</f:facet>
							<h:outputText value="#{student.firstName}" />
						</rich:column>
						<rich:column>
							<f:facet name="header">
								<h:outputText value="#{msg.lastName}" />
							</f:facet>
							<h:outputText value="#{student.lastName}" />
						</rich:column>

					</rich:listShuttle></td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{testBean.assignTest}"
				reRender="onlineTestPanel" 
				oncomplete=" #{rich:component('studentAssigned')}.show();" />
		</rich:panel>
	</a4j:outputPanel>
 
	<rich:modalPanel id="studentAssigned" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<p><h:outputText value="#{testBean.successMessage}" />
		<h:outputText value="#{testBean.errorMessage}" />
		</p>
		<p></p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{levelClassBean.doNothing}"
			oncomplete=" #{rich:component('studentAssigned')}.hide();" /></p>
	</rich:modalPanel>