<a4j:form>
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

				<rich:column width="90">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>

					<a4j:commandLink ajaxSingle="true" id="selectProduit"
						action="#{productBean.selectProduct}"
						reRender="demandeProductPannel"
						oncomplete="#{rich:component('demandeProductPannel')}.show()">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{product.id}" />
					</a4j:commandLink>

					<rich:toolTip for="selectProduit" value="#{msg.modify}" />

				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>

		</a4j:outputPanel>
	</a4j:region>
</a4j:form>


<rich:modalPanel id="demandeProductPannel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.demand}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink3"
				styleClass="hidelink" />
			<rich:componentControl for="demandeProductPannel" attachTo="hidelink3"
				operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<a4j:form>
		<h:panelGrid columns="2">

			<a4j:outputPanel ajaxRendered="true">

				<h:panelGrid columns="2">

					<h:outputText value="#{msg.productCode}" />
					<h:outputText value="#{productBean.product.productCode}" />
					
					<h:outputText value="#{msg.name} " />
					<h:outputText value="#{productBean.product.name}" />
					
					<h:outputText value="#{msg.category}" />
					<h:outputText value="#{productBean.product.category.name}" />
					
					<h:outputText value="#{msg.brand}" />
					<h:outputText value="#{productBean.product.brand.name}" />

					<h:outputText value="#{msg.quantity}" />
					<h:inputText value="#{productBean.requestedQty}" />
					
					<h:outputText value="#{msg.possibleReturnedDate}" />
					<rich:calendar id="dateOfReturn"
							value="#{productBean.returnDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar>
						
					<h:outputText value="#{msg.comment}" />
					<h:inputTextarea id="commentaire"
						value="#{productBean.comment}" rows="2" cols="30">
					</h:inputTextarea>

				</h:panelGrid>

				<rich:message showSummary="true" showDetail="false" for="couleur" />
			</a4j:outputPanel>

			<a4j:outputPanel ajaxRendered="true">
				<h:panelGroup id="infoProductPic">
					<a4j:mediaOutput id="productPicOut" element="img"
						mimeType="image/gif" style="width:100px; height:100px;"
						createContent="#{productBean.paint}"
						value="#{productBean.random}" cacheable="false">
					</a4j:mediaOutput>
				</h:panelGroup>
			</a4j:outputPanel>

			<a4j:commandButton value="#{msg.save}" action="#{productBean.demandForStudent}"
				reRender="productConsumers"
				oncomplete="if (#{facesContext.maximumSeverity==null}) #{rich:component('demandeProductPannel')}.hide();" />
		</h:panelGrid>
	</a4j:form>
</rich:modalPanel>


