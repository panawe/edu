<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionRoleMenu">
			<rich:panel
				style="overflow: hidden; width: 85%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.roleMenuDetails}">
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.roleName}" /></td>
						<td><h:selectOneMenu id="roleMenuRole"
							value="#{roleBean.roleId}">
							<a4j:support event="onchange" ajaxSingle="true"
								action="#{roleBean.populateMenus}" reRender="menuShutle" />
							<f:selectItems value="#{roleBean.selectedRoles}" />
						</h:selectOneMenu></td>
					</tr>
				</table>

				<a4j:region>
					<rich:panel
						style="overflow: hidden; width: 85%; white-space: nowrap;">
						<f:facet name="header">
							<h:outputFormat value="#{msg.selectedMenus}" />
						</f:facet>
						<a4j:region>
							<table>
								<tr>
									<td><h:outputText value="#{msg.name}" /></td>
									<td><h:inputText id="menuName"
										value="#{roleBean.menuName}" disabled="#{roleBean.boxChecked}">
									</h:inputText></td>
									<td colspan="2"><h:outputText value="#{msg.allMenus }" />
									<h:selectBooleanCheckbox id="selectAllMenus"
										value="#{roleBean.selectAllMenus}" title="#{msg.allMenus}">
										<a4j:support event="onchange" ajaxSingle="true"
											action="#{roleBean.updateMenuSelection}" reRender="menuName" />
									</h:selectBooleanCheckbox></td>
									<td><a4j:commandButton value="#{msg.search}"
										id="searchButtom" action="#{roleBean.populateMenus}"
										reRender="menuShutle"
										oncomplete="if (#{roleBean.rowCount <= 0}) #{rich:component('resultPanelRoleMenu')}.show();" />
									</td>

								</tr>
							</table>
						</a4j:region>


						<table>
							<tr>
								<td colspan="2"><rich:listShuttle id="menuShutle"
									sourceValue="#{roleBean.availableMenus}"
									targetValue="#{roleBean.selectedMenus}" var="menu"
									converter="menuConverter" copyControlLabel="#{msg.copy }"
									removeControlLabel="#{msg.remove }"
									copyAllControlLabel="#{msg.copyAll}"
									removeAllControlLabel="#{msg.removeAll }"
									upControlLabel="#{msg.moveUp }"
									downControlLabel="#{msg.moveDown }"
									bottomControlLabel="#{msg.moveToBottom }"
									topControlLabel="#{msg.moveToTop }" sourceListWidth="400"
									targetListWidth="400">
									<f:facet name="sourceCaption">
										<h:outputText value="#{msg.availableMenus}" />
									</f:facet>
									<f:facet name="targetCaption">
										<h:outputText value="#{msg.selectedMenus}" />
									</f:facet>
									<rich:column width="180">
										<f:facet name="header">
											<h:outputText value="#{msg.menu}" />
										</f:facet>
										<h:outputText value="#{menu.name}" />
									</rich:column>
									<rich:column width="120">
										<f:facet name="header">
											<h:outputText value="#{msg.parentName}" />
										</f:facet>
										<h:outputText value="#{menu.menuParent.name}" />
									</rich:column>

									<rich:column width="100">
										<f:facet name="header">
											<h:outputText value="#{msg.accessLevel}" />
										</f:facet>
										<h:selectBooleanCheckbox value="#{menu.accessLevelCheck}" />
									</rich:column>

								</rich:listShuttle></td>
							</tr>
						</table>
					</rich:panel>
				</a4j:region>
				<a4j:commandButton value="#{msg.save}"
					action="#{roleBean.insertRoleMenu}" reRender="gestionRoleMenu" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{roleBean.clearRoleMenu}" reRender="gestionRoleMenu" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="resultPanelRoleMenu" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<a4j:region>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="Fermer"
				action="#{roleBean.doNothing}" reRender="gestionRoleMenu"
				oncomplete=" #{rich:component('resultPanelRoleMenu')}.hide();" /></p>
		</a4j:region>
	</a4j:form>
</rich:modalPanel>
