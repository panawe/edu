<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="shipments">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{shipmentBean.shipments}" var="shipment"
				rendered="#{shipmentBean.rowCount>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.shipments}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{shipment.shipmentNumber}"
					filterEvent="onkeyup" sortBy="#{shipment.shipmentNumber}">
					<f:facet name="header">
						<h:outputText value="#{msg.shipmentNumber}" />
					</f:facet>
					<h:outputText value="#{shipment.shipmentNumber}" />
				</rich:column>

				<rich:column filterBy="#{shipment.origin}" filterEvent="onkeyup"
					sortBy="#{shipment.origin}">
					<f:facet name="header">
						<h:outputText value="#{msg.origin}" />
					</f:facet>
					<h:outputText value="#{shipment.origin}" />
				</rich:column>

				<rich:column filterBy="#{shipment.destination}"
					filterEvent="onkeyup" sortBy="#{shipment.destination}">
					<f:facet name="header">
						<h:outputText value="#{msg.destination}" />
					</f:facet>
					<h:outputText value="#{shipment.destination}" />
				</rich:column>

				<rich:column filterBy="#{shipment.carrier.name}"
					filterEvent="onkeyup" sortBy="#{shipment.carrier.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.carrier}" />
					</f:facet>
					<h:outputText value="#{shipment.carrier.name}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.dateOfDispatch}" />
					</f:facet>
					<h:outputText value="#{shipment.dateOfDispatch}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.dateOfArrival}" />
					</f:facet>
					<h:outputText value="#{shipment.dateOfArrival}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column filterBy="#{shipment.deliveredBy}"
					filterEvent="onkeyup" sortBy="#{shipment.deliveredBy}">
					<f:facet name="header">
						<h:outputText value="#{msg.deliveredBy}" />
					</f:facet>
					<h:outputText value="#{shipment.deliveredBy}" />
				</rich:column>

				<rich:column filterBy="#{shipment.receivedBy}" filterEvent="onkeyup"
					sortBy="#{shipment.receivedBy}">
					<f:facet name="header">
						<h:outputText value="#{msg.receivedBy}" />
					</f:facet>
					<h:outputText value="#{shipment.receivedBy}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>

					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{shipmentBean.edit}"
						reRender="gestionShipment,commandesShipmentPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{shipment.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{shipmentBean.delete}"
						reRender="gestionShipment, shipments">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{shipment.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>

		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
