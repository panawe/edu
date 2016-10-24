<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionAlert">
			<rich:panel style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.alert}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">
	
					<tr>
						<td><h:inputHidden value="#{alertBean.alert.id}" /> <h:outputText
							value="#{msg.alertType}" /></td>
						<td><h:selectOneMenu id="alertType1"
							value="#{alertBean.alert.alertTypeCode}"
							binding="#{alertBean.myValue}">
							<f:selectItems value="#{alertBean.configurationsByGroupName}" />
							<a4j:support event="onchange" action="#{alertBean.alertTypeChanged }" 
										reRender="numberOfDaysBeforeDueDate" ajaxSingle="true" />
							<f:attribute name="groupName" value="ALERT_TYPE" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message
							for="alertType1" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.alertSubject}:" /></td>
						<td><h:inputText id="alertSubject"
							value="#{alertBean.alert.subject}" size="75" maxlength="50"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="alertSubject" /></font></td>
					</tr>
	
					<tr>
						<td><h:outputText value="#{msg.message}:" /></td>
						<td><rich:editor value="#{alertBean.alert.message}"
							theme="advanced" plugins="save,paste" width="700">
	
							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline, cut,copy,paste,pasteword" />
	
							<f:param name="theme_advanced_toolbar_location" value="top" />
	
							<f:param name="theme_advanced_toolbar_align" value="left" />
	
						</rich:editor></td>
						<td><font color="#FF0000"><rich:message for="message" /></font>
						</td>
					</tr>
	
					
					<tr>
						<td><h:outputText value="#{msg.numberOfRepeat}:" /></td>
						<td><h:inputText id="numberOfRepeat"
							value="#{alertBean.alert.numberOfRepeat}" size="10" maxlength="3"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="numberOfRepeat" /></font></td>
					</tr>
	
					<tr>
						<td><h:outputText value="#{msg.repeatInterval}:" /></td>
						<td><h:inputText id="repeatInterval"
							value="#{alertBean.alert.repeatInterval}" size="10" maxlength="3">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="repeatInterval" /></font></td>
					</tr>
	
	
					<tr>
						<td><h:outputText value="#{msg.sendTo}:" /></td>
						<td><h:inputText id="sendTo" value="#{alertBean.alert.sendTo}"
							size="100" maxlength="100" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="sendTo" /></font>
						</td>
					</tr>
	
					<tr>
						<td><h:outputText value="#{msg.display}:" /></td>
						<td><h:selectOneMenu id="display"
							value="#{alertBean.alert.moment}">
							<f:selectItem itemValue="0" itemLabel="#{msg.yes }" />
							<f:selectItem itemValue="1" itemLabel="#{msg.no }" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message for="display" /></font>
						</td>
					</tr>
	
					<tr>
						<td><h:outputText value="#{msg.daysDisplay}:" /></td>
						<td><h:inputText id="daysDisplay"
							value="#{alertBean.alert.daysDisplay}" size="10" maxlength="3"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="daysDisplay" /></font></td>
					</tr>
						<tr>
	<td colspan="2">
					<a4j:outputPanel id="numberOfDaysBeforeDueDate" >
					<rich:panel rendered="#{alertBean.showNumberOfDaysBeforeDueDate == true}">
					<table>
						<tr>
							<td><h:outputText value="#{msg.numberOfDays}:" /></td>
							<td><h:inputText id="numberOfDays"
								value="#{alertBean.alert.numberOfDays}" size="10" maxlength="3"
								onchange="convertToUpperCase(this);">
								<rich:ajaxValidator event="onblur" />
							</h:inputText></td>
							<td><font color="#FF0000"><rich:message
								for="numberOfDays" /></font></td>
						</tr>
		
						<tr>
							<td><h:outputText value="#{msg.moment}:" /></td>
							<td><h:selectOneMenu id="moment"
								value="#{alertBean.alert.moment}">
								<f:selectItem itemValue="0" itemLabel="#{msg.before }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.after }" />
							</h:selectOneMenu></td>
							<td><font color="#FF0000"><rich:message for="moment" /></font>
							</td>
						</tr>
					</table>
					</rich:panel>
					</a4j:outputPanel>
					</td>
	</tr>
					
				</table>
	
				<a4j:commandButton value="#{msg.save}" action="#{alertBean.insert}"
					reRender="alerts, gestionAlert, alertListResultPanel1" oncomplete="#{rich:component('alertListResultPanel1')}.show();"
					 rendered = "#{ alertBean.userHasWriteAccess }" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}" action="#{alertBean.clear}"
						reRender="gestionAlert" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="alertListResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p>
			<font color="#FF0000"> 
				<error> 
					<h:outputText value="#{alertBean.errorMessage}" /> 
				</error> 
			</font> 
			<font color="#00FF00">
				<success> 
					<h:outputText value="#{alertBean.successMessage}" />
				</success> 
			</font>
		</p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('alertListResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>