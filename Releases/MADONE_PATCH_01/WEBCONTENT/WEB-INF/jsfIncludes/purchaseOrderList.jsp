<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="purchaseOrders">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{purchaseOrderBean.purchaseOrders}" var="purchaseOrder"
				rendered="#{purchaseOrderBean.rowCount>0}" reRender="ds"
				rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.purchaseOrders}" />
					</h:outputFormat>
				</f:facet>

				<rich:column sortBy="#{purchaseOrder.orderDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.orderDate}" />
					</f:facet>
					<h:outputText value="#{purchaseOrder.orderDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column sortBy="#{purchaseOrder.possibleDeliveryDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.possibleDeliveryDate}" />
					</f:facet>
					<h:outputText value="#{purchaseOrder.possibleDeliveryDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column filterBy="#{purchaseOrder.discountAmount}"
					filterEvent="onkeyup" sortBy="#{purchaseOrder.discountAmount}">
					<f:facet name="header">
						<h:outputText value="#{msg.discountAmount}" />
					</f:facet>
					<h:outputText value="#{purchaseOrder.discountAmount}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column filterBy="#{purchaseOrder.totalAmount}"
					filterEvent="onkeyup" sortBy="#{purchaseOrder.totalAmount}">
					<f:facet name="header">
						<h:outputText value="#{msg.totalAmount}" />
					</f:facet>
					<h:outputText value="#{purchaseOrder.totalAmount}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column filterBy="#{purchaseOrder.statusDesc}"
					filterEvent="onkeyup" sortBy="#{purchaseOrder.statusDesc}">
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{purchaseOrder.statusDesc}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{purchaseOrderBean.edit}"
						reRender="orderConfigPanel,gestionPurchaseOrder">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{purchaseOrder.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{purchaseOrderBean.delete}"
						oncomplete="#{rich:component('actionPurchaseOrderMessage')}.show()"
						reRender="gestionPurchaseOrder, purchaseOrders,actionPurchaseOrderMessage">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{purchaseOrder.id}" />
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

<rich:modalPanel id="actionPurchaseOrderMessage" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{purchaseOrderBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{purchaseOrderBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('actionPurchaseOrderMessage')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
