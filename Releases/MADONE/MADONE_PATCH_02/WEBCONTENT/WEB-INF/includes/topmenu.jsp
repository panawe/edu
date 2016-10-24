<tr>
	<td valign="top" height="5"><a4j:form>
		<a4j:region>
			<rich:toolBar id="MenuBar">
				<rich:dropDownMenu binding="#{userBean.home}" id="homes1"/>
				<rich:dropDownMenu binding="#{userBean.dossiers}" id="dossiers" />
				<rich:dropDownMenu binding="#{userBean.evaluations}" id="evaluations" />
				<rich:dropDownMenu binding="#{userBean.bulletins}" id="bulletins" />
				<rich:dropDownMenu binding="#{userBean.stocks}" id="stocks" />
				<rich:dropDownMenu binding="#{userBean.etats}" id="etats" />
				<rich:dropDownMenu binding="#{userBean.suivi}" id="suivi" />
				<rich:dropDownMenu binding="#{userBean.infirmerie}" id="infirmerie" />
				<rich:dropDownMenu binding="#{userBean.configuration}" 	id="configuration" />
				<rich:dropDownMenu binding="#{userBean.aide}" id="aide" />
				<rich:toolBarGroup location="right" id="Connection">
					<rich:dropDownMenu value="#{msg.signin }" direction="bottom-left"
						rendered="#{userBean.displayConnect}" jointPoint="br"
						styleClass="search">
						<rich:menuItem submitMode="ajax">
							<table width="240">
								<tr>
									<td><h:outputText value="#{msg.userName}" /></td>
									<td><h:inputText value="#{userBean.user.userName}"
										id="connectUsername" /></td>
								</tr>
								<tr>
									<td><h:outputText value="#{msg.password}" /></td>
									<td><h:inputSecret value="#{userBean.user.password}"
										id="connectPassword" /> </td>
								</tr>
								<tr>
									<td><a4j:commandButton value="#{msg.signin}"
										action="#{userBean.validate}" reRender="MenuBar">
									</a4j:commandButton></td>
									<td><h:outputText value="#{reportBean.dummie}"/> </td>
								</tr>
							</table>
						</rich:menuItem>
						<rich:menuItem value="#{userBean.errorMessage}" disabled="true"></rich:menuItem>
					</rich:dropDownMenu>
				</rich:toolBarGroup>
				<rich:toolBarGroup location="right" id="Deconnection">
					<rich:dropDownMenu value="#{userBean.disconnectMessage}"
						direction="bottom-left" rendered="#{!userBean.displayConnect}"
						jointPoint="br" styleClass="search">
						<rich:menuItem value="#{msg.signout}" submitMode="none"
							onclick="document.location.href = 'logout'">
						</rich:menuItem>
					</rich:dropDownMenu>
				</rich:toolBarGroup>
			</rich:toolBar>
		</a4j:region>
	</a4j:form></td>
</tr>