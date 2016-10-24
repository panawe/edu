<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionCarrier">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.carrier}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">
					<tr>
						<td><h:inputHidden value="#{carrierBean.carrier.id}" /> <h:outputText
							value="#{msg.name}" /><font color="#FF0000">*</font></td>
						<td><h:inputText id="carrierName"
							value="#{carrierBean.carrier.name}" size="75" maxlength="50"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="carrierName" /></font></td>
					</tr>
										<tr>
						<td><h:outputText value="#{msg.contactName}:" /></td>
						<td><h:inputText id="contactName"
							value="#{carrierBean.carrier.contactName}" size="75"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="contactName" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.address1}:" /></td>
						<td><h:inputText id="address1"
							value="#{carrierBean.carrier.address1}" size="75"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="address1" /></font>
						</td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.address2}:" /></td>
						<td><h:inputText id="address2"
							value="#{carrierBean.carrier.address2}" size="75"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="address2" /></font>
						</td>
					</tr>
					<!-- Country Suggestion Box -->
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.country}" /></td>
							<td><rich:comboBox id="country1"
								value="#{carrierBean.countryName}"
								defaultLabel="#{msg.enterListDefaultValue}"
								suggestionValues="#{countryBean.allCountries}">

							</rich:comboBox> <font color="#FF0000"><rich:message for="country1" /></font></td>
						</a4j:region>
					</tr>

					<!-- City Suggestion Box -->
					<tr>
						<td><h:outputText value="#{msg.city}" /></td>
						<td><h:inputText id="city1"
							value="#{carrierBean.carrier.city}" size="30" maxlength="150"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText> <font color="#FF0000"><rich:message for="city1" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.email}" /></td>
						<td><h:inputText id="email"
							value="#{carrierBean.carrier.email}" size="30" maxlength="50"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="email" /></font>
						</td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.phone}" /></td>
						<td><h:inputText id="phone"
							value="#{carrierBean.carrier.phoneNumber}" size="30"
							maxlength="12" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="phone" /></font>
						</td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.fax}" /></td>
						<td><h:inputText id="fax"
							value="#{carrierBean.carrier.faxNumber}" size="30"
							maxlength="12" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="fax" /></font>
						</td>
					</tr>
					
				</table>

				<a4j:commandButton value="#{msg.save}"
					rendered="#{ carrierBean.userHasWriteAccess }"
					action="#{carrierBean.insert}" reRender="carriers, gestionCarrier" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{carrierBean.clear}" reRender="gestionCarrier" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
