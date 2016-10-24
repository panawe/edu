<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="products">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{productBean.products}" var="product"
				rendered="#{productBean.rowCount > 0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.products}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{product.productCode}" filterEvent="onkeyup"
					sortBy="#{product.productCode}">
					<f:facet name="header">
						<h:outputText value="#{msg.productCode}" />
					</f:facet>
					<h:outputText value="#{product.productCode}" />
				</rich:column>

				<rich:column filterBy="#{product.name}" filterEvent="onkeyup"
					sortBy="#{product.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.name}" />
					</f:facet>
					<h:outputText value="#{product.name}" />
				</rich:column>

				<rich:column filterBy="#{product.author}" filterEvent="onkeyup"
					sortBy="#{product.author}">
					<f:facet name="header">
						<h:outputText value="#{msg.author}" />
					</f:facet>
					<h:outputText value="#{product.author}" />
				</rich:column>
				
				<rich:column filterBy="#{product.category.name}"
					filterEvent="onkeyup" sortBy="#{product.category.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.category}" />
					</f:facet>
					<h:outputText value="#{product.category.name}" />
				</rich:column>

				<rich:column filterBy="#{product.brand.name}" filterEvent="onkeyup"
					sortBy="#{product.brand.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.brand}" />
					</f:facet>
					<h:outputText value="#{product.brand.name}" />
				</rich:column>
				<rich:column sortBy="#{product.quantity}">
					<f:facet name="header">
						<h:outputText value="#{msg.quantity}" />
					</f:facet>
					<h:outputText value="#{product.quantity}" />
				</rich:column>
				<rich:column sortBy="#{product.quantityInStock}">
					<f:facet name="header">
						<h:outputText value="#{msg.quantityInStock}" />
					</f:facet>
					<h:outputText value="#{product.quantityInStock}" />
				</rich:column>

				<rich:column sortBy="#{product.minimumQuantityToOrder}">
					<f:facet name="header">
						<h:outputText value="#{msg.minimumQuantityToOrder}" />
					</f:facet>
					<h:outputText value="#{product.minimumQuantityToOrder}" />
				</rich:column>

				<rich:column width="90">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>

					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{link=='produits' }"
						action="#{productBean.edit}"
						reRender="stocksConfigPanel,gestionProduct">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{product.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						rendered="#{link=='produits'}"
						action="#{productBean.delete}" reRender="gestionProduct, products">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{product.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="selectProductToAddToCart"
						rendered="#{productBean.pageComingFromPurchaseOrder && link!='produits' }"
						action="#{purchaseOrderBean.selectProductToAddToCart}"
						reRender="gestionProduct">
						<h:graphicImage value="/images/addtobasket.gif" style="border:0" />
						<f:param name="id" value="#{product.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="addProductToConsumer"
						rendered="#{productBean.pageComingFromProductConsumer }"
						action="#{productConsumerBean.addProductToConsumer}">
						<h:graphicImage value="/images/addtobasket.gif" style="border:0" />
						<f:param name="id" value="#{product.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
					<rich:toolTip for="selectProductToAddToCart" value="#{msg.addToCart}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>

		</a4j:outputPanel>
	</a4j:region>
	
		<a4j:region>
		<a4j:outputPanel rendered="#{productBean.rowCount <= 0}">
			No product found.
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


