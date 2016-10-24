<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionRoleUser">
			<rich:panel
				style="overflow: hidden; width: 85%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.roleUserDetails}">
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>. 
		    	<table class="table">
					<tr>
						<td><h:outputText value="#{msg.roleName}" /></td>
						<td><h:selectOneMenu id="roleUserRole"
							value="#{roleBean.roleId}">
							<a4j:support event="onchange" ajaxSingle="true"
								action="#{roleBean.populateUsers}" reRender="userShutle" />
							<f:selectItems value="#{roleBean.selectedRoles}" />
						</h:selectOneMenu></td>
					</tr>
				</table>

				<a4j:region>
					<rich:panel
						style="overflow: hidden; width: 85%; white-space: nowrap;">
						<f:facet name="header">
							<h:outputFormat value="#{msg.selectedUsers}" />
						</f:facet>
						<a4j:region>
							<table>
								<tr>
									<td colspan="2"><a4j:region>
										<h:outputText value="#{msg.allUsers }" />
										<h:selectBooleanCheckbox
											disabled="#{roleBean.selectAllTeachers || roleBean.selectAllStudents }"
											id="selectAllUsers" value="#{roleBean.selectAllUsers}"
											title="#{msg.allUsers}" immediate="true">
											<a4j:support ajaxSingle="true" event="onclick"
												action="#{roleBean.updateUserSelection}"
												reRender="userName, firstName, lastName, selectAllStudents, selectAllTeachers" />
										</h:selectBooleanCheckbox>
									</a4j:region></td>

									<td colspan="2"><h:outputText value="#{msg.allTeachers }" />
									<h:selectBooleanCheckbox
										disabled="#{roleBean.selectAllStudents || roleBean.selectAllUsers }"
										id="selectAllTeachers" value="#{roleBean.selectAllTeachers}"
										title="#{msg.allTeachers }" immediate="true">

										<a4j:support event="onclick" ajaxSingle="true"
											action="#{roleBean.updateTeacherSelection}"
											reRender="userName, firstName, lastName, selectAllStudents, selectAllUsers, levelClass,schoolYear" />
									</h:selectBooleanCheckbox></td>

									<td colspan="2"><h:outputText value="#{msg.allStudents }" />
									<h:selectBooleanCheckbox
										disabled="#{roleBean.selectAllTeachers || roleBean.selectAllUsers }"
										id="selectAllStudents" value="#{roleBean.selectAllStudents}"
										title="#{msg.allStudents}" immediate="true">
										<a4j:support event="onclick" ajaxSingle="true"
											action="#{roleBean.updateStudentSelection}"
											reRender="userName, firstName, lastName, levelClass,schoolYear,selectAllTeachers, selectAllUsers" />
									</h:selectBooleanCheckbox></td>

								</tr>
								<tr>
									<td><h:outputText value="#{msg.userName}" /></td>
									<td><h:inputText id="userName"
										value="#{roleBean.userName}"
										disabled="#{roleBean.userBoxChecked}">
									</h:inputText></td>

									<td><h:outputText value="#{msg.firstName}" /></td>
									<td><h:inputText id="firstName"
										value="#{roleBean.firstName}"
										disabled="#{roleBean.userBoxChecked}">
									</h:inputText></td>

									<td><h:outputText value="#{msg.lastName}" /></td>
									<td><h:inputText id="lastName"
										value="#{roleBean.lastName}"
										disabled="#{roleBean.userBoxChecked}">
									</h:inputText></td>
								</tr>

								<tr>
									<td><h:outputText value="#{msg.classe}" /></td>
									<td><rich:comboBox id="levelClass"
										value="#{roleBean.className}"
										suggestionValues="#{levelClassBean.allLevelClasses}"
										disabled="#{roleBean.userBoxChecked}">
									</rich:comboBox></td>
									<td><h:outputText value="#{msg.year }" /></td>
									<td><rich:comboBox id="schoolYear"
										value="#{roleBean.year}"
										suggestionValues="#{schoolYearBean.allSchoolYears}"
										disabled="#{roleBean.userBoxChecked}">
									</rich:comboBox></td>

								</tr>
								<tr>
									<td><a4j:commandButton value="#{msg.search}"
										id="userSearchButtom" action="#{roleBean.populateUsers}"
										reRender="userShutle"
										oncomplete="if (#{roleBean.userRowCount <= 0}) #{rich:component('resultPanelRoleUser')}.show();" />
									</td>
								</tr>
							</table>
						</a4j:region>

						<table>
							<tr>
								<td colspan="2"><rich:listShuttle id="userShutle"
									sourceValue="#{roleBean.availableUsers}"
									targetValue="#{roleBean.selectedUsers}" var="user"
									converter="userConverter" copyControlLabel="#{msg.copy }"
									removeControlLabel="#{msg.remove }"
									copyAllControlLabel="#{msg.copyAll}"
									removeAllControlLabel="#{msg.removeAll }"
									upControlLabel="#{msg.moveUp }"
									downControlLabel="#{msg.moveDown }"
									bottomControlLabel="#{msg.moveToBottom }"
									topControlLabel="#{msg.moveToTop }" sourceListWidth="450"
									targetListWidth="450">
									<f:facet name="sourceCaption">
										<h:outputText value="#{msg.availableUsers}" />
									</f:facet>
									<f:facet name="targetCaption">
										<h:outputText value="#{msg.selectedUsers}" />
									</f:facet>

									<rich:column width="150">
										<f:facet name="header">
											<h:outputText value="#{msg.userName}" />
										</f:facet>
										<h:outputText value="#{user.userName}" />
									</rich:column>
									<rich:column  width="150">
										<f:facet name="header">
											<h:outputText value="#{msg.firstName}" />
										</f:facet>
										<h:outputText value="#{user.firstName}" />
									</rich:column>
									<rich:column  width="150">
										<f:facet name="header">
											<h:outputText value="#{msg.lastName}" />
										</f:facet>
										<h:outputText value="#{user.lastName}" />
									</rich:column>
								</rich:listShuttle></td>
							</tr>

						</table>
					</rich:panel>
				</a4j:region>

				<a4j:commandButton value="#{msg.save}"
					action="#{roleBean.insertRoleUser}" reRender="gestionRoleUser" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{roleBean.clearRoleUser}" reRender="gestionRoleUser" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="resultPanelRoleUser" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<a4j:region>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="Fermer"
				action="#{roleBean.doNothing}" reRender="gestionRoleUser"
				oncomplete=" #{rich:component('resultPanelRoleUser')}.hide();" /></p>
		</a4j:region>
	</a4j:form>
</rich:modalPanel>
