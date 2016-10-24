<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionShipment">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.shipment}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.shipmentNumber}" /></td>
						<td><h:inputText id="shipmentNumber"
							value="#{shipmentBean.shipment.shipmentNumber}" size="50"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="shipmentNumber" /></font></td>
					</tr>
					<tr>
						<td><h:inputHidden value="#{shipmentBean.shipment.id}" /> <h:outputText
							value="#{msg.origin}" /></td>
						<td><h:inputText id="origin"
							value="#{shipmentBean.shipment.origin}" size="15" maxlength="50"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="origin" /></font>
						</td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.destination}" /></td>
						<td><h:inputText id="destination"
							value="#{shipmentBean.shipment.destination}" size="50"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="destination" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.carrier}" /></td>
						<td><rich:comboBox id="shipmentCarrier"
							suggestionValues="#{carrierBean.allCarriers}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{shipmentBean.carrierName}" /> <font color="#FF0000"><rich:message
							for="shipmentCarrier" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.dateOfDispatch}" /></td>
						<td><rich:calendar id="dateOfDispatch"
							value="#{shipmentBean.shipment.dateOfDispatch}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="dateOfDispatch" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.dateOfArrival}" /></td>
						<td><rich:calendar id="dateOfArrival"
							value="#{shipmentBean.shipment.dateOfArrival}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="dateOfArrival" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.deliveredBy}" /></td>
						<td><h:inputText id="deliveredBy"
							value="#{shipmentBean.shipment.deliveredBy}" size="50"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="deliveredBy" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.receivedBy}" /></td>
						<td><h:inputText id="receivedBy"
							value="#{shipmentBean.shipment.receivedBy}" size="50"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="receivedBy" /></font></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}"
					action="#{shipmentBean.insert}"
					reRender="shipments, gestionShipment,ShipmentResultPanel1"
					oncomplete="#{rich:component('ShipmentResultPanel1')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{shipmentBean.clear}" reRender="gestionShipment" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="ShipmentResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{shipmentBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{shipmentBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('ShipmentResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>

