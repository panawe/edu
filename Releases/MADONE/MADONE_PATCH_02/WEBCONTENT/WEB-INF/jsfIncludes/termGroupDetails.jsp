<a4j:form>
<a4j:region>
	<a4j:outputPanel id="gestionTermGroup">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.termGroup}" />
				</h:outputFormat>
			</f:facet>
			<table class="table">
				<tr>
					<td>
						<h:inputHidden value="#{termGroupBean.termGroup.id}" /> 
						<h:outputText value="#{msg.name}" />
					</td>
					<td>
						<h:inputText id="name" value="#{termGroupBean.termGroup.name}" size="30" maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText> 
						<font color="#FF0000"><rich:message for="name" /></font>
					</td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}" action="#{termGroupBean.insert}"
				reRender="termGroups, gestionTermGroup" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}" action="#{termGroupBean.clear}"
					reRender="gestionTermGroup" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>
