<a4j:form>
	<table callpadding="10" cellspacing="10">
		<tr>
			<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
			<td><rich:comboBox id="schoolYear11" value="#{bulletinBean.year}"
				suggestionValues="#{schoolYearBean.allSchoolYears}">
			</rich:comboBox></td>
			<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
			<td><rich:comboBox id="levelClass"
					value="#{bulletinBean.className}"
					suggestionValues="#{levelClassBean.allLevelClasses}">
				</rich:comboBox></td>
			<td><a4j:commandButton value="#{msg.calculateAverages}"
				action="#{bulletinBean.calculateYearAverages}"
				reRender="resultPanelStudent11" onclick="buttonClicked = true; "
				rendered="#{bulletinBean.userHasWriteAccess}"
				oncomplete="#{rich:component('resultPanelStudent11')}.show();" /></td>
		</tr>
	</table>
</a4j:form>

<rich:modalPanel id="resultPanelStudent11" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			id="errorMessage10" value="#{bulletinBean.errorMessage}" /> </error> </font> <font
			color="#00FF00"> <success> <h:outputText
			id="successMessage10" value="#{bulletinBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }"
			action="#{bulletinBean.doNothing}" reRender="resultPanelStudent11"
			oncomplete=" #{rich:component('resultPanelStudent11')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>



