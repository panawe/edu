
<a4j:region>
	<a4j:outputPanel id="products">
		<rich:dataTable
			style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
			value="#{productBean.products}" var="product"
			rendered="#{productBean.rowCount>0}" reRender="ds" rowKeyVar="row">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
					<f:param value="#{msg.products}" />
				</h:outputFormat>
			</f:facet>

			<rich:column width="400px" filterBy="#{product.productCode}"
				filterEvent="onkeyup" sortBy="#{product.productCode}">
				<f:facet name="header">
					<h:outputText value="#{msg.productCode}" />
				</f:facet>
				<h:outputText value="#{product.productCode}" />
			</rich:column>

			<rich:column width="400px" filterBy="#{product.name}"
				filterEvent="onkeyup" sortBy="#{product.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.name}" />
				</f:facet>
				<h:outputText value="#{product.name}" />
			</rich:column>

			<rich:column width="400px" filterBy="#{product.category.name}"
				filterEvent="onkeyup" sortBy="#{product.category.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.category}" />
				</f:facet>
				<h:outputText value="#{product.category.name}" />
			</rich:column>

			<rich:column width="400px" filterBy="#{product.brand.name}"
				filterEvent="onkeyup" sortBy="#{product.brand.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.brand}" />
				</f:facet>
				<h:outputText value="#{product.brand.name}" />
			</rich:column>

			<rich:column width="400px" filterBy="#{product.quantityInStock}"
				filterEvent="onkeyup" sortBy="#{product.quantityInStock}">
				<f:facet name="header">
					<h:outputText value="#{msg.quantityInStock}" />
				</f:facet>
				<h:outputText value="#{product.quantityInStock}" />
			</rich:column>

			<rich:column width="400px"
				filterBy="#{product.minimumQuantityToOrder}" filterEvent="onkeyup"
				sortBy="#{product.minimumQuantityToOrder}">
				<f:facet name="header">
					<h:outputText value="#{msg.minimumQuantityToOrder}" />
				</f:facet>
				<h:outputText value="#{product.minimumQuantityToOrder}" />
				<h:outputText value="#{productBean.pageProvenence}" />
			</rich:column>

			<rich:column width="35">
				<f:facet name="header">
					<h:outputText value="#{msg.actions }" />
				</f:facet>

				<a4j:commandLink ajaxSingle="true" id="modify"
					rendered="#{productBean.pageComingFromProduct }"
					action="#{productBean.edit}" reRender="gestionProduct">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{product.id}" />
				</a4j:commandLink>
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:commandLink ajaxSingle="true" id="delete"
					rendered="#{productBean.pageComingFromProduct }"
					action="#{productBean.delete}" reRender="gestionProduct, products">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{product.id}" />
				</a4j:commandLink>

				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:commandLink ajaxSingle="true" id="selectProductToAddToCart"
					rendered="#{productBean.pageComingFromPurchaseOrder }"
					action="#{purchaseOrderBean.selectProductToAddToCart}"
					reRender="renderMe">
					<h:graphicImage value="/images/addtobasket.gif" style="border:0" />
					<f:param name="id" value="#{product.id}" />
				</a4j:commandLink>

				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:commandLink ajaxSingle="true" id="addProductToConsumer"
					rendered="#{productBean.pageComingFromProductConsumer }"
					action="#{productConsumerBean.addProductToConsumer}"
					reRender="resultProduct1,renderMe"
					oncomplete="#{rich:component('resultPanelProducts')}.hide()">
					<h:graphicImage value="/images/addtobasket.gif" style="border:0" />
					<f:param name="id" value="#{product.id}" />
				</a4j:commandLink>

				<rich:toolTip for="modify" value="#{msg.modify}" />
				<rich:toolTip for="delete" value="#{msg.delete}" />
			</rich:column>

			<f:facet name="footer">
				<rich:datascroller id="ds"></rich:datascroller>
			</f:facet>
		</rich:dataTable>
		<br />

		<font color="#FF0000"> <error> <h:outputText
			value="#{productBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{productBean.successMessage}" /> </success> </font>

		<br />
	</a4j:outputPanel>
</a4j:region>
