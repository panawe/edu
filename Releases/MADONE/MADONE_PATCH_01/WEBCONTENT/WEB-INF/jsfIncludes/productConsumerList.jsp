<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="productConsumers">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{productConsumerBean.productConsumers}"
				var="productConsumer" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.productConsumers}" />
					</h:outputFormat>
				</f:facet>

				<rich:column sortBy="#{productConsumer.product.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.product}" />
					</f:facet>
					<h:outputText value="#{productConsumer.product.name}">
					</h:outputText>
				</rich:column>
				
				<rich:column sortBy="#{productConsumer.requestDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.requestDate}" />
					</f:facet>
					<h:outputText value="#{productConsumer.requestDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column sortBy="#{productConsumer.pickupDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.pickupDate}" />
					</f:facet>
					<h:outputText value="#{productConsumer.pickupDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column sortBy="#{productConsumer.possibleReturnedDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.possibleReturnedDate}" />
					</f:facet>
					<h:outputText value="#{productConsumer.possibleReturnedDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column sortBy="#{productConsumer.returnDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.returnDate}" />
					</f:facet>
					<h:outputText value="#{productConsumer.returnDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.quantityRequested}" />
					</f:facet>
					<h:outputText value="#{productConsumer.quantityRequested}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.quantityAccepted}" />
					</f:facet>
					<h:outputText value="#{productConsumer.quantityAccepted}" />
				</rich:column>

				<rich:column filterBy="#{productConsumer.statusDesc}"
					filterEvent="onkeyup" sortBy="#{productConsumer.statusDesc}">
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{productConsumer.statusDesc}" />
				</rich:column>
				
				<rich:column width="120">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						rendered="#{productConsumer.school.id == user.school.id }"
						action="#{productConsumerBean.edit}"
						reRender="gestionProductConsumer,consumerConfigPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{productConsumer.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />
					
					<a4j:commandLink ajaxSingle="true" id="approve"
						rendered="#{productConsumer.school.id == user.school.id && (productConsumer.status==3||productConsumer.status==1)}"
						action="#{productConsumerBean.approve}"
						oncomplete="#{rich:component('prodResultPanelList')}.show();"
						reRender="gestionProductConsumer,productConsumers,prodResultPanelList">
						<h:graphicImage value="images/approve.gif" style="border:0" />
						<f:param name="id" value="#{productConsumer.id}" />
					</a4j:commandLink>
					
					<a4j:commandLink ajaxSingle="true" id="return"
						rendered="#{productConsumer.school.id == user.school.id && (productConsumer.status==2)}"
						action="#{productConsumerBean.returnDemande}"
						oncomplete="#{rich:component('prodResultPanelList')}.show();"
						reRender="gestionProductConsumer,productConsumers,prodResultPanelList">
						<h:graphicImage value="images/addtobasket.gif" style="border:0" />
						<f:param name="id" value="#{productConsumer.id}" />
					</a4j:commandLink>
					
					<rich:spacer width="20" height="10" title="" />
					
					<a4j:commandLink ajaxSingle="true" id="reject"
						rendered="#{productConsumer.school.id == user.school.id && (productConsumer.status==1||productConsumer.status==2)}"
						action="#{productConsumerBean.reject}"
						oncomplete="#{rich:component('prodResultPanelList')}.show();"
						reRender="gestionProductConsumer,productConsumers,prodResultPanelList">
						<h:graphicImage value="images/reject.gif" style="border:0" />
						<f:param name="id" value="#{productConsumer.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						rendered="#{productConsumer.school.id == user.school.id && (productConsumer.status==3||productConsumer.status==1)}"
						action="#{productConsumerBean.delete}"
						reRender="gestionProductConsumer, productConsumers">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{productConsumer.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
					<rich:toolTip for="approve" value="#{msg.approve}" />
					<rich:toolTip for="reject" value="#{msg.reject}" />
					<rich:toolTip for="return" value="#{msg.returne}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="prodResultPanelList" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{productConsumerBean.errorMessage}" /> </error> </font> <font
			color="#00FF00"> <success> <h:outputText
			value="#{productConsumerBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('prodResultPanelList')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
