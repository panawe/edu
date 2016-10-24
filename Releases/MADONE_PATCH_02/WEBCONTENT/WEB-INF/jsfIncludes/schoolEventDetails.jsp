<a4j:form id="formID">
	<a4j:region>
		<a4j:outputPanel id="gestionSchoolEvent">
			<rich:panel>
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.event}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				<table class="table">
					<tr>
						<td><h:inputHidden value="#{schoolEventBean.schoolEvent.id}" />
						<h:outputText value="#{msg.title}" /><font color="#FF0000">*</font>
						<h:inputText id="tittle"
							value="#{schoolEventBean.schoolEvent.title}" size="75"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
					</tr>
					<tr>
						<td>
						<table>
							<tr>
								<td><h:outputText value="#{msg.beginDateTime }" /><font
									color="#FF0000">*</font></td>
								<td><rich:calendar id="beginDateTime"
									value="#{schoolEventBean.schoolEvent.beginDateTime}"
									locale="fr" popup="true" datePattern="dd/MM/yyyy HH:mm"
									showFooter="true" showApplyButton="false" cellWidth="24px"
									cellHeight="22px" style="width:200px, border-color : blue;">
									<f:convertDateTime pattern="dd/MM/yyyy HH:mm" />
								</rich:calendar></td>
								<td><font color="#FF0000"><rich:message
									for="beginDateTime" /></font></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>
						<table>
							<tr>
								<td><h:outputText value="#{msg.endDateTime }" /><font
									color="#FF0000">*</font></td>
								<td><rich:calendar id="endDateTime"
									value="#{schoolEventBean.schoolEvent.endDateTime}" locale="fr"
									popup="true" datePattern="dd/MM/yyyy HH:mm" showFooter="true"
									showApplyButton="false" cellWidth="24px" cellHeight="22px"
									style="width:200px, border-color : blue;">
									<f:convertDateTime pattern="dd/MM/yyyy HH:mm" />
								</rich:calendar></td>
								<td><font color="#FF0000"><rich:message
									for="endDateTime" /></font></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td colspan="2"><h:outputText value="#{msg.description}" />
						<rich:editor value="#{schoolEventBean.schoolEvent.description}"
							plugins="save,paste" width="500">
						</rich:editor></td>
						<td><font color="#FF0000"><rich:message
							for="description" /></font></td>
					</tr>
				</table>
				<a4j:commandButton value="#{msg.save}"
					action="#{schoolEventBean.insert}"
					reRender="schoolEvents,gestionSchoolEvent,schoolEventResultPanel"
					oncomplete="#{rich:component('schoolEventResultPanel')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{schoolEventBean.clear}" reRender="gestionSchoolEvent" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="schoolEventResultPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{schoolEventBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{schoolEventBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('schoolEventResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>