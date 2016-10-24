<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionProduct">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.command}">
					</h:outputFormat>
				</f:facet>
				<table class="table">
					<tr>
						<td>
						<table>
							<tr>
								<td><h:inputHidden value="#{purchaseOrderBean.product.id}" />
								<h:outputText value="#{msg.productCode}:" /></td>
								<td><h:outputText
									value="#{purchaseOrderBean.product.productCode}" /></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.name}:" /></td>
								<td><h:outputText value="#{purchaseOrderBean.product.name}" />
								</td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.brand}:" /></td>
								<td><h:outputText
									value="#{purchaseOrderBean.product.brand.name}" /></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.isbn}:" /></td>
								<td><h:outputText value="#{purchaseOrderBean.product.isbn}" />
								</td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.barCode}:" /></td>
								<td><h:outputText
									value="#{purchaseOrderBean.product.barCode}" /></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.quantityInStock}:" /></td>
								<td><h:outputText
									value="#{purchaseOrderBean.product.quantityInStock}" /></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.orderedQuantity}:" /></td>
								<td><h:inputText id="quantityOrdered"
									value="#{purchaseOrderBean.product.quantityOrdered}" size="10"
									maxlength="50" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="quantityOrdered" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.discountAmount}:" /></td>
								<td><h:inputText id="ddiscountAmount"
									value="#{purchaseOrderBean.product.discountAmount}" size="10"
									maxlength="50" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="ddiscountAmount" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.totalAmount}:" /></td>
								<td><h:inputText id="ttotalAmount"
									value="#{purchaseOrderBean.product.totalAmount}" size="10"
									maxlength="50" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="ttotalAmount" /></font></td>
							</tr>
						</table>
						</td>
					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}"
					disabled="#{purchaseOrderBean.purchaseOrder.status==3 || purchaseOrderBean.purchaseOrder.status==4}"
					action="#{purchaseOrderBean.addProductToCart}"
					reRender="renderMe, shoppingCart" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>