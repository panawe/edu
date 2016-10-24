<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionProductConsumer">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.productConsumer}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel id="resultProduct1">

					<table>
						<tr>
							<td><h:inputHidden
								value="#{productConsumerBean.productConsumer.product.id}" /> <h:outputText
								value="#{msg.name}:" /></td>
							<td><h:outputText
								value="#{productConsumerBean.productConsumer.product.name}" />
							</td>
							<td><a4j:region>
								<a4j:commandButton value="#{msg.chooseProduct}"
									action="#{productConsumerBean.addProducts}"
									oncomplete="#{rich:component('resultPanelProducts')}.show()"
									reRender="resultPanelProducts" />
							</a4j:region></td>
						</tr>
					</table>
				</a4j:outputPanel>

				<a4j:outputPanel id="resultConsumer1">
					<table>
						<tr>
							<td><h:inputHidden
								value="#{productConsumerBean.productConsumer.consumer.id}" /> <h:outputText
								value="#{msg.firstName}:" /></td>
							<td><h:outputText
								value="#{productConsumerBean.productConsumer.consumer.firstName}" />
							</td>
							<td><h:outputText value="#{msg.lastName}:" /></td>
							<td><h:outputText
								value="#{productConsumerBean.productConsumer.consumer.lastName}" />
							</td>
							<td><a4j:region>
								<a4j:commandButton value="#{msg.chooseConsumer}"
									action="#{productConsumerBean.addProducts}"
									oncomplete="#{rich:component('resultPanelConsumers')}.show()"
									reRender="resultPanelConsumers" />
							</a4j:region></td>
						</tr>
					</table>
				</a4j:outputPanel>

				<table>
					<tr>
						<td><h:inputHidden
							value="#{productConsumerBean.productConsumer.id}" /> <h:outputText
							value="#{msg.requestDate}" /></td>
						<td><rich:calendar id="requestDate"
							value="#{productConsumerBean.productConsumer.requestDate}"
							locale="fr" popup="true" datePattern="dd/MM/yyyy"
							showFooter="false" showApplyButton="false" cellWidth="24px"
							cellHeight="22px" style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="requestDate" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.pickupDate}" /></td>
						<td><rich:calendar id="pickupDate"
							value="#{productConsumerBean.productConsumer.pickupDate}"
							locale="fr" popup="true" datePattern="dd/MM/yyyy"
							showFooter="false" showApplyButton="false" cellWidth="24px"
							cellHeight="22px" style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="pickupDate" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.releasedBy}:" /></td>
						<td><h:inputText id="releasedBy"
							value="#{productConsumerBean.productConsumer.releasedBy}"
							size="50" maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="releasedBy" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.pickupBy}:" /></td>
						<td><h:inputText id="pickupBy"
							value="#{productConsumerBean.productConsumer.pickupBy}" size="50"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="pickupBy" /></font>
						</td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.quantityRequested}:" /></td>
						<td><h:inputText id="quantityRequested"
							value="#{productConsumerBean.productConsumer.quantityRequested}"
							size="10" maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="quantityRequested" /></font></td>
					</tr>
					<!-- 
					<tr>
						<td><h:outputText value="#{msg.quantityAccepted}:" /></td>
						<td><h:inputText id="quantityAccepted"
							value="#{productConsumerBean.productConsumer.quantityAccepted}"
							size="10" maxlength="15" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="quantityAccepted" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.quantityToBeReturned}:" /></td>
						<td><h:inputText id="quantityToBeReturned"
							value="#{productConsumerBean.productConsumer.quantityToBeReturned}"
							size="10" maxlength="15" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="quantityToBeReturned" /></font></td>
					</tr>
					-->
					<tr>
						<td><h:outputText value="#{msg.returnDate}" /></td>
						<td><rich:calendar id="returnDate"
							value="#{productConsumerBean.productConsumer.returnDate}"
							locale="fr" popup="true" datePattern="dd/MM/yyyy"
							showFooter="false" showApplyButton="false" cellWidth="24px"
							cellHeight="22px" style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="possibleReturnedDate" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.possibleReturnedDate}" /></td>
						<td><rich:calendar id="possibleReturnedDate"
							value="#{productConsumerBean.productConsumer.possibleReturnedDate}"
							locale="fr" popup="true" datePattern="dd/MM/yyyy"
							showFooter="false" showApplyButton="false" cellWidth="24px"
							cellHeight="22px" style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="possibleReturnedDate" /></font></td>
					</tr>
					<!-- 
					<tr>
						<td><h:outputText value="#{msg.quantityReturned}:" /></td>
						<td><h:inputText id="quantityReturned"
							value="#{productConsumerBean.productConsumer.quantityReturned}"
							size="10" maxlength="15" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="quantityReturned" /></font></td>
					</tr>
					
					<tr>
						<td><h:outputText value="#{msg.status}:" /></td>
						<td><h:selectOneMenu id="status" disabled="true"
							value="#{productConsumerBean.productConsumer.status}"
							binding="#{productConsumerBean.myValue}">
							<f:selectItems
								value="#{productConsumerBean.configurationsByGroupName}" />
							<f:attribute name="groupName" value="CONSUMER_STATUS" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message for="status" /></font>
						</td>
					</tr>
					-->
					
					<tr>
						<td><h:outputText value="#{msg.status}:" /></td>
						<td><h:inputText id="statusDescription" size="50" maxlength="50" readonly="true"
							value="#{productConsumerBean.productConsumer.statusDesc}" /></td>
						<td>
						</td>
					</tr>
					
					<tr>
						<td><h:outputText value="#{msg.comment}:" /></td>
						<td><h:inputTextarea id="comment"
							value="#{productConsumerBean.productConsumer.comment}" rows="5"
							cols="50" /></td>
						<td><font color="#FF0000"><rich:message for="comment" /></font>
						</td>
					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}"
					action="#{productConsumerBean.insert}"
					rendered="#{productConsumerBean.userHasWriteAccess}"
					reRender="productConsumers, gestionProductConsumer,prodResultPanel" 
					oncomplete="#{rich:component('prodResultPanel')}.show();"/>
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{productConsumerBean.clear}"
						rendered="#{productConsumerBean.userHasWriteAccess}"
						reRender="gestionProductConsumer" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="resultPanelProducts" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><%@include
			file="/WEB-INF/jsfIncludes/productListWithoutForm.jsp"%>
		</p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{productConsumerBean.addProducts}" reRender="resultProduct1"
			oncomplete="#{rich:component('resultPanelProducts')}.hide()" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="resultPanelConsumers" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><%@include file="/WEB-INF/jsfIncludes/userList.jsp"%>
		</p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{productConsumerBean.addProducts}"
			reRender="resultConsumer1"
			oncomplete="#{rich:component('resultPanelConsumers')}.hide()" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="prodResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{productConsumerBean.errorMessage}" /> </error> </font> <font
			color="#00FF00"> <success> <h:outputText
			value="#{productConsumerBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('prodResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
