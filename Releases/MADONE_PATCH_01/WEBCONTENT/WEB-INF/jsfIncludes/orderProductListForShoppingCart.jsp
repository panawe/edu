
	<a4j:region>
		<a4j:outputPanel id="orderProducts">
			<rich:dataTable
				style="overflow: hidden; width: 100%; white-space: nowrap;" rows="5"
				value="#{purchaseOrderBean.orderProducts}" var="orderProduct"
				rendered="#{purchaseOrderBean.productRowCount>0}"
				binding="#{purchaseOrderBean.repeater}" reRender="ds"
				rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.products}" />
					</h:outputFormat>
				</f:facet>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.productCode}" />
					</f:facet>
					<h:outputText value="#{orderProduct.product.productCode}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.name}" />
					</f:facet>
					<h:outputText value="#{orderProduct.product.name}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.orderedQuantity}" />
					</f:facet>
					<h:outputText value="#{orderProduct.quantityOrdered}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.quantityReceived}" />
					</f:facet>
					<h:outputText value="#{orderProduct.quantityReceived}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.quantityDamaged}" />
					</f:facet>
					<h:outputText value="#{orderProduct.quantityDamaged}" />
				</rich:column>

				<rich:column width="35">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="updateCart1"
						action="#{purchaseOrderBean.editOrderProduct}"
						reRender="resultPanelOrderProduct">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{orderProduct.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="deleteProductFromCart"
						action="#{purchaseOrderBean.deleteOrderProduct}"
						disabled="#{purchaseOrderBean.purchaseOrder.status==3 || purchaseOrderBean.purchaseOrder.status==4}"
						reRender="orderProducts">
						<h:graphicImage value="images/delete.gif" style="border:0" />
						<f:param name="id" value="#{orderProduct.id}" />
					</a4j:commandLink>
					
					<rich:toolTip for="updateCart1" value="#{msg.updateCart}" />
					<rich:toolTip for="deleteProductFromCart" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

			<font color="#FF0000"> <h:outputText
				value="#{purchaseOrderBean.errorMessage}" /> </font>
			<font color="#00FF00"> <h:outputText
				value="#{purchaseOrderBean.successMessage}" /> </font>

			<br />
		</a4j:outputPanel>
	</a4j:region>

	<a4j:region>
		<a4j:outputPanel id="resultPanelOrderProduct">


			<h:inputHidden value="#{purchaseOrderBean.orderProduct.id}" />

			<table>
				<tr>
					<td><h:outputText value="#{msg.name}" /></td>
					<td><h:outputText
						value="#{purchaseOrderBean.orderProduct.product.name}" /></td>

				</tr>
				<tr>
						<td><h:outputText value="#{msg.orderedQuantity}" /></td>
						<td><h:inputText id="quantityOrdered2"
							value="#{purchaseOrderBean.orderProduct.quantityOrdered}"
							size="10" maxlength="50" immediate="true">
						</h:inputText></td>
						<font color="#FF0000"><rich:message for="quantityOrdered2" /></font>
				</tr>
				<tr>
						<td><h:outputText value="#{msg.quantityReceived}" /></td>
						<td><h:inputText id="quantityReceived"
							value="#{purchaseOrderBean.orderProduct.quantityReceived}"
							size="10" maxlength="50" immediate="true">
						</h:inputText></td>
				</tr>
				<font color="#FF0000"><rich:message for="quantityReceived" /></font>
				<br />
				<tr>
					<td><h:outputText value="#{msg.quantityDamaged}" /></td>
					<td><h:inputText id="quantityDamaged"
						value="#{purchaseOrderBean.orderProduct.quantityDamaged}"
						size="10" maxlength="50" immediate="true">
					</h:inputText></td>
				</tr>
				<font color="#FF0000"><rich:message for="quantityDamaged" /></font>
				<tr>
					<td><h:outputText value="#{msg.discountAmount}" /></td>
					<td><h:inputText id="discountAmount2"
						value="#{purchaseOrderBean.orderProduct.discountAmount}"
						size="10" maxlength="50" immediate="true">
					</h:inputText></td>
				</tr>
				<font color="#FF0000"><rich:message for="discountAmount2" /></font>
				<tr>
					<td><h:outputText value="#{msg.totalAmount}" /></td>
					<td><h:inputText id="totalAmount2"
						value="#{purchaseOrderBean.orderProduct.totalAmount}"
						size="10" maxlength="50" immediate="true">
					</h:inputText></td>
				</tr>
				<font color="#FF0000"><rich:message for="totalAmount2" /></font>								
				<tr>
					<td >
					<a4j:commandButton value="#{msg.updateCart}"
						action="#{purchaseOrderBean.updateCart}"
						disabled="#{purchaseOrderBean.purchaseOrder.status==3 || purchaseOrderBean.purchaseOrder.status==4}"
						reRender="orderProducts, resultPanelOrderProduct" />
						</td>
						
				<td>					<a4j:commandButton value="#{msg.close }"
				action="#{purchaseOrderBean.addProducts}"
				reRender="gestionProduct, resultPanelOrderProduct"
				oncomplete="#{rich:component('shoppingCart')}.hide()" />
				</td>
				</tr>
			</table>

		</a4j:outputPanel>
	</a4j:region>
