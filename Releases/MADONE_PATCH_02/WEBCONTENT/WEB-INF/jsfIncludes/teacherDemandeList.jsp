<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="productConsumers">
			<rich:dataTable
				style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5"
				value="#{productBean.teacherDemands}" var="productConsumer"
				reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.productConsumers}" />
					</h:outputFormat>
				</f:facet>
				<rich:column sortBy="#{productConsumer.product.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.product}" />
					</f:facet>
					<h:outputText value="#{productConsumer.product.name}"/>

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

				<rich:column filterBy="#{productConsumer.releasedBy}"
					filterEvent="onkeyup" sortBy="#{productConsumer.releasedBy}">
					<f:facet name="header">
						<h:outputText value="#{msg.releasedBy}" />
					</f:facet>
					<h:outputText value="#{productConsumer.releasedBy}" />
				</rich:column>

				<rich:column filterBy="#{productConsumer.statusDesc}"
					filterEvent="onkeyup" sortBy="#{productConsumer.statusDesc}">
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{productConsumer.statusDesc}" />
				</rich:column>

				<rich:column width="150">
					<f:facet name="header">
						<h:outputText value="#{msg.comment}" />
					</f:facet>
					<h:outputText escape="true" value="#{productConsumer.comment}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="delete"
						rendered="#{productConsumer.school.id == user.school.id && productConsumer.status==1}"
						action="#{productBean.deleteTeacherDemande}"
						reRender="productConsumers">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{productConsumer.id}" />
					</a4j:commandLink>
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>