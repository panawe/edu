<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionBrand">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.brand}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">
					<tr>
						<td><h:inputHidden value="#{brandBean.brand.id}" /> <h:outputText
							value="#{msg.name}" /><font color="#FF0000">*</font></td>
						<td><h:inputText id="brandName"
							value="#{brandBean.brand.name}" size="75" maxlength="50"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="brandName" /></font></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}" action="#{brandBean.insert}"
					rendered="#{ brandBean.userHasWriteAccess }"
					reRender="brands, gestionBrand" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}" action="#{brandBean.clear}"
						reRender="gestionBrand" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
