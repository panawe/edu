<a4j:form>
	<table callpadding="10" cellspacing="10">
		<tr>
			<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
			<td>
				<rich:comboBox id="levelClass"
					value="#{bulletinBean.className}"
					suggestionValues="#{levelClassBean.allLevelClasses}">
				</rich:comboBox>
			</td>
		</tr>
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
			<td><a4j:commandButton value="#{msg.calculateAverages}"
				onclick="buttonClicked = true; "
				action="#{bulletinBean.calculateGroupAverages}"
				reRender="resultPanelStudent111"  
				rendered="#{bulletinBean.userHasWriteAccess}"
				oncomplete="#{rich:component('resultPanelStudent111')}.show();" /></td>
		</tr>
	</table>
 
</a4j:form>


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

 

