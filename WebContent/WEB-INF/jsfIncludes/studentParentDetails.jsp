<a4j:form>
	<a4j:region>
		<table>
			<tr>
				<td><h:outputText value="#{msg.lastName}" /></td>
				<td><h:inputText onkeyup="convertToUpperCase(this);" value="#{studentBean.parentLastName}" /></td>
				
				<td><h:outputText value="#{msg.firstName}" /></td>
				<td><h:inputText onkeyup="convertToUpperCase(this);" value="#{studentBean.parentFirstName}" /></td>
				
				<td><a4j:commandButton value="#{msg.search}" id="searchParentButtom"
						action="#{studentBean.searchParents}" onclick="buttonClicked"
						reRender="parentShutle"
						oncomplete="if (#{studentBean.parentCounts <= 0}) #{rich:component('resultPanelStudentParent')}.show();" />
				</td>
			</tr>
		</table>

		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('studentParentWait')}.show()}"
			onstop="buttonClicked = false; #{rich:component('studentParentWait')}.hide()" />
	</a4j:region>
</a4j:form>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionStudentParent">
			<rich:panel
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.parent}" />
					</h:outputFormat>
				</f:facet>
	
				<table class="table">
					<tr>
						<td>
							<table class="table">
								<tr>
									<td colspan="2"><rich:listShuttle id="parentShutle"
											sourceValue="#{studentBean.availableParents}"
											targetValue="#{studentBean.selectedParents}"
											var="parent" converter="parentConverter"
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
												<h:outputText value="#{msg.availableParents}" />
											</f:facet>
											<f:facet name="targetCaption">
												<h:outputText value="#{msg.selectedParents}" />
											</f:facet>
											<rich:column width="150">
												<f:facet name="header">
													<h:outputText value="#{msg.firstName}" />
												</f:facet>
												<h:outputText value="#{parent.firstName}" />
											</rich:column>
											<rich:column width="150">
												<f:facet name="header">
													<h:outputText value="#{msg.lastName}" />
												</f:facet>
												<h:outputText value="#{parent.lastName}" />
											</rich:column>
											<rich:column width="150">
												<f:facet name="header">
													<h:outputText value="#{msg.profession}" />
												</f:facet>
												<h:outputText value="#{parent.profession}" />
											</rich:column>
											<rich:column width="150">
												<f:facet name="header">
													<h:outputText value="#{msg.workPlace}" />
												</f:facet>
												<h:outputText value="#{parent.workPlace}" />
											</rich:column>
											<rich:column width="100">
												<f:facet name="header">
													<h:outputText value="#{msg.parentType}" />
												</f:facet>
												<h:selectOneMenu 
													value="#{parent.parentType}"
													binding="#{parentBean.myValue}">
													<f:selectItems value="#{parentBean.configurationsByGroupName}" />
													<f:attribute name="groupName" value="PARENT_TYPE" />
												</h:selectOneMenu>
											</rich:column>
										</rich:listShuttle>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}"
					rendered="#{studentBean.userHasWriteAccess}"
					action="#{studentBean.assignParentsToStudent}"
					onclick="buttonClicked = true; "
					reRender="gestionStudentParent, assignParentModalPanel"
					oncomplete="#{rich:component('assignParentModalPanel')}.show();" />
			</rich:panel>
		</a4j:outputPanel>
		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('studentParentWait1')}.show()}"
			onstop="buttonClicked = false; #{rich:component('studentParentWait1')}.hide()" />
	</a4j:region>
</a4j:form>

<rich:modalPanel id="studentParentWait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>
<rich:modalPanel id="studentParentWait1" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<rich:modalPanel id="assignParentModalPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<br />
		<font color="#FF0000"> <error> <h:outputText
				value="#{studentBean.errorMessage}" /> </error>
		</font>
		<font color="#00FF00"> <success> <h:outputText
				value="#{studentBean.successMessage}" /> </success>
		</font>

		<br />
		<br />
		<a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('assignParentModalPanel')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="resultPanelStudentParent" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p>
			<h:outputText value="#{msg.noResultFound}" />
		</p>
		<p></p>
		<p>
			<a4j:commandButton value="#{msg.close }"
				action="#{studentBean.doNothing}" reRender="gestionStudentParent"
				oncomplete=" #{rich:component('resultPanelStudentParent')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>
