<a4j:form>
<a4j:region>
	<a4j:outputPanel id="gestionTerm">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.term}" />
				</h:outputFormat>
			</f:facet>
			<table class="table">
				<tr>
					<td>
						<h:inputHidden value="#{termBean.term.id}" /> 
						<h:outputText value="#{msg.name}" />
					</td>
					<td>
						<h:inputText id="name" value="#{termBean.term.name}" size="30" maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText> 
						<font color="#FF0000"><rich:message for="name" /></font>
					</td>
				</tr>
				<!-- Term Group Suggestion Box -->
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.termGroup}" /><font
							color="#FF0000">*</font></td>
						<td><rich:comboBox id="termGroup"
							value="#{termBean.termGroupName}"
							defaultLabel="#{msg.enterListDefaultValue}"
							suggestionValues="#{termGroupBean.allTermGroups}"
							requiredMessage="#{msg.requiredMessage}" required="true">
						</rich:comboBox></td>
						<td><font color="#FF0000"><rich:message
							for="termGroup" /></font></td>
					</a4j:region>
				</tr>			
				<tr>
					<td>
						<h:outputText value="#{msg.showFinalRank}" />
					</td>
					<td>
						<h:selectOneMenu id="showFinalRank" value="#{termBean.term.showFinalRank}">
							<f:selectItem itemValue="0" itemLabel="#{msg.no}" />
							<f:selectItem itemValue="1" itemLabel="#{msg.yes}" />
						</h:selectOneMenu>
						<font color="#FF0000"><rich:message for="showFinalRank" /></font>
					</td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}" action="#{termBean.insert}"
				reRender="terms, gestionTerm" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}" action="#{termBean.clear}"
					reRender="gestionTerm" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>
