<a4j:form>
	<table callpadding="10" cellspacing="10">
		<tr>
			<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
			<td><rich:comboBox id="schoolYear111"
				value="#{bulletinBean.year}"
				suggestionValues="#{schoolYearBean.allSchoolYears}">
			</rich:comboBox></td>
			<td></td>
		</tr>

		<tr>
			<a4j:region>
				<td><h:outputText value="#{msg.termGroup}" /><font
					color="#FF0000">*</font></td>
				<td><rich:comboBox id="termGroup"
					value="#{bulletinBean.termGroupName}"
					defaultLabel="#{msg.enterListDefaultValue}"
					suggestionValues="#{termGroupBean.allTermGroups}"
					requiredMessage="#{msg.requiredMessage}" required="true">
				</rich:comboBox></td>
				<td><font color="#FF0000"><rich:message for="termGroup" /></font></td>
			</a4j:region>
		</tr>

		<tr>
			<td></td>
			<td></td>
			<td><a4j:commandButton value="#{msg.calculateAverages}"
				action="#{bulletinBean.calculateGroupAverages}"
				reRender="resultPanelStudent111" onclick="buttonClicked = true; "
				rendered="#{bulletinBean.userHasWriteAccess}"
				oncomplete="#{rich:component('resultPanelStudent111')}.show();" /></td>
		</tr>
	</table>
				<a4j:status id="wstatus01y"  forceId="true"
			onstart="if (buttonClicked) {#{rich:component('wait111y')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait111y')}.hide()" />
</a4j:form>

<rich:modalPanel id="wait111y" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<rich:modalPanel id="resultPanelStudent111" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			id="errorMessage101" value="#{bulletinBean.errorMessage}" /> </error> </font> <font
			color="#00FF00"> <success> <h:outputText
			id="successMessage101" value="#{bulletinBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }"
			action="#{bulletinBean.doNothing}" reRender="resultPanelStudent111"
			oncomplete=" #{rich:component('resultPanelStudent111')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>



