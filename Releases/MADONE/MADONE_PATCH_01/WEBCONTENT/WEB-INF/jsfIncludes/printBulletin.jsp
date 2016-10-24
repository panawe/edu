<a4j:form>
	<table callpadding="10" cellspacing="10">
		<tr>
			<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
			<td><rich:comboBox id="levelClass"
				value="#{bulletinBean.className}"
				suggestionValues="#{levelClassBean.allLevelClasses}">
			</rich:comboBox></td>
			<td><a4j:commandButton value="#{msg.publishResults}"
				action="#{bulletinBean.publishResults}"
				onclick="buttonClicked = true; "
				reRender="resultPanelStudent"
				rendered="#{ bulletinBean.userHasWriteAccess }"
				oncomplete="#{rich:component('resultPanelStudent')}.show();" /></td>
		</tr>
		<tr>
			<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
			<td><rich:comboBox id="schoolYear" value="#{bulletinBean.year}"
				suggestionValues="#{schoolYearBean.allSchoolYears}">
			</rich:comboBox></td>
			<td><a4j:commandButton value="#{msg.lockUnlockResults}"
			onclick="buttonClicked = true; "
				action="#{bulletinBean.lockUnlockResults}"
				reRender="resultPanelStudent"
				rendered="#{ bulletinBean.userHasWriteAccess }"
				oncomplete="#{rich:component('resultPanelStudent')}.show();" /></td>
		</tr>
		<tr>
			<td><h:outputText value="#{msg.term}" /><font color="#FF0000">*</font></td>
			<td><rich:comboBox id="term" value="#{bulletinBean.termName}"
				suggestionValues="#{termBean.allTerms}" /></td>
			<td><h:commandButton
			
				rendered="#{ bulletinBean.userHasWriteAccess }" value="#{msg.print}"
				id="searchButtom" action="#{bulletinBean.printBulletin}" /> <rich:spacer
				width="20" height="10" title="" /></td>
		</tr>

	</table>
			<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
</a4j:form>

 
<rich:modalPanel id="wait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<rich:modalPanel id="resultPanelStudent" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			id="errorMessage0" value="#{bulletinBean.errorMessage}" /> </error> </font> <font
			color="#00FF00"> <success> <h:outputText
			id="successMessage0" value="#{bulletinBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }"
			action="#{bulletinBean.doNothing}" reRender="gestionBulletin"
			oncomplete=" #{rich:component('resultPanelStudent')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>



