<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionPurchaseOrder">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.purchaseOrder}" />
					</h:outputFormat>
				</f:facet>
				<table>
					<tr>
						<td><h:inputHidden
							value="#{purchaseOrderBean.purchaseOrder.id}" /> <h:outputText
							value="#{msg.orderDate}" /><font color="#FF0000">*</font></td>
						<td><rich:calendar id="orderDate"
							value="#{purchaseOrderBean.purchaseOrder.orderDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px"
							requiredMessage="#{msg.requiredMessage}" required="true">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="orderDate" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.possibleDeliveryDate}" /></td>
						<td><rich:calendar id="possibleDeliveryDate"
							value="#{purchaseOrderBean.purchaseOrder.possibleDeliveryDate}"
							locale="fr" popup="true" datePattern="dd/MM/yyyy"
							showFooter="false" showApplyButton="false" cellWidth="24px"
							cellHeight="22px" style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="possibleDeliveryDate" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.supplier}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="supplier"
							suggestionValues="#{supplierBean.allSuppliers}"
							directInputSuggestions="true"
							requiredMessage="#{msg.requiredMessage}" required="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{purchaseOrderBean.supplierName}" /> <font
							color="#FF0000"><rich:message for="supplier" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.shipment}" /></td>
						<td><rich:comboBox id="shipment"
							suggestionValues="#{shipmentBean.allShipments}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{purchaseOrderBean.shipmentName}" /> <font
							color="#FF0000"><rich:message for="shipment" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.discountRate}" /></td>
						<td><h:inputText id="discountRate"
							value="#{purchaseOrderBean.purchaseOrder.discountRate}" size="10"
							maxlength="50" readonly="true" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="discountRate" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.discountAmount}" /></td>
						<td><h:inputText id="discountAmount"
							value="#{purchaseOrderBean.purchaseOrder.discountAmount}"
							size="10" maxlength="50" readonly="true" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="discountAmount" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.totalAmount}" /></td>
						<td><h:inputText id="totalAmount"
							value="#{purchaseOrderBean.purchaseOrder.totalAmount}" size="10"
							maxlength="50" readonly="true" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="totalAmount" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.status}" /></td>
						<td><h:selectOneMenu id="status"
							value="#{purchaseOrderBean.purchaseOrder.status}"
							binding="#{purchaseOrderBean.myValue}">
							<f:selectItems
								value="#{purchaseOrderBean.configurationsByGroupName}" />
							<f:attribute name="groupName" value="PURCHASE_ORDER_STATUS" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message for="status" /></font>
						</td>
					</tr>

				</table>

				<table cellpadding="10">
					<tr>
						<td valign="middle"><a4j:commandButton value="#{msg.save}"
							rendered="#{ purchaseOrderBean.userHasWriteAccess }"
							action="#{purchaseOrderBean.insert}"
							disabled="#{purchaseOrderBean.purchaseOrder.status==3 || purchaseOrderBean.purchaseOrder.status==4}"
							oncomplete="#{rich:component('savePurchaseOrderResultPanel')}.show();"
							reRender="purchaseOrders, gestionPurchaseOrder, resultPanelProducts, shoppingCart,savePurchaseOrderResultPanel" /></td>
						<td valign="middle"><a4j:region>
							<a4j:commandButton value="#{msg.clear}"
								action="#{purchaseOrderBean.clear}"
								reRender="gestionPurchaseOrder, orderProds" />
						</a4j:region></td>
						<td valign="middle"><a4j:region>
							<a4j:commandButton value="#{msg.chooseProduct}"
								action="#{productBean.addProducts}"
								rendered="#{purchaseOrderBean.purchaseOrder.id != null }"
								reRender="gestionPurchaseOrder, resultPanelProducts"
								oncomplete="#{rich:component('resultPanelProducts')}.show()" />
						</a4j:region></td>

						<td valign="middle"><a4j:region>

							<a4j:commandLink ajaxSingle="true" id="viewCart"
								action="#{purchaseOrderBean.getOrderProductsForOrder}"
								rendered="#{purchaseOrderBean.purchaseOrder.id != null }"
								reRender="gestionPurchaseOrder"
								oncomplete="#{rich:component('shoppingCart')}.show()">
								<h:graphicImage value="images/cartButton.gif" style="border:0" />
							</a4j:commandLink>

						</a4j:region></td>
					</tr>
				</table>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="savePurchaseOrderResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{purchaseOrderBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{purchaseOrderBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('savePurchaseOrderResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>

<!-- Section for list of products popup -->
<a4j:region>
	<rich:modalPanel id="resultPanelProducts"
		rendered="#{ purchaseOrderBean.purchaseOrder.id != null }"
		autosized="true" minHeight="300" width="300">

		<a4j:outputPanel id="renderMe">
			<f:facet name="header">
				<h:outputText value="#{msg.result}" />
			</f:facet>
			<p><%@include file="/WEB-INF/jsfIncludes/productList.jsp"%>
			</p>
			<p><%@include
				file="/WEB-INF/jsfIncludes/productDetailsForOrder.jsp"%>
			</p>
			<p><a4j:form>

				<table cellpadding="10">
					<tr>
						<td valign="middle"><a4j:commandButton value="#{msg.close }"
							action="#{purchaseOrderBean.addProducts}"
							reRender="gestionProduct, resultPanelOrderProduct"
							oncomplete="#{rich:component('resultPanelProducts')}.hide()" />
						</td>

						<td valign="middle"><a4j:commandLink ajaxSingle="true"
							id="viewCart"
							action="#{purchaseOrderBean.getOrderProductsForOrder}"
							oncomplete="#{rich:component('shoppingCart')}.show()">
							<h:graphicImage value="images/cartButton.gif" style="border:0" />
						</a4j:commandLink></td>
					</tr>
				</table>

			</a4j:form></p>
		</a4j:outputPanel>

	</rich:modalPanel>
</a4j:region>

<!--  Section for the shopping cart -->
<rich:modalPanel id="shoppingCart"
	rendered="#{ purchaseOrderBean.purchaseOrder.id != null }"
	autosized="true" minHeight="300" width="600">
	<a4j:outputPanel id="shoppingCartOutputPanel"
		rendered="#{ purchaseOrderBean.hasOrder }">
		<a4j:form>
			<%@include
				file="/WEB-INF/jsfIncludes/orderProductListForShoppingCart.jsp"%>
		</a4j:form>
	</a4j:outputPanel>
</rich:modalPanel>


<rich:modalPanel id="purchaseOrderResult" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<br />
		<font color="#FF0000"> <error> <h:outputText
			value="#{purchaseOrderBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{purchaseOrderBean.successMessage}" /> </success> </font>
		<br />
		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('purchaseOrderResult')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>