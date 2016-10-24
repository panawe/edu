<a4j:form>
	<a4j:region>

		<a4j:outputPanel id="studentPayments">
			<rich:dataTable rows="15" value="#{paymentBean.tuitions}"
				var="tuition" rendered="#{paymentBean.rowCount>0}" reRender="ds"
				rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.payments}" />
					</h:outputFormat>
				</f:facet>


				<rich:column filterBy="#{tuition.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{tuition.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{tuition.schoolYear.year}" />
				</rich:column>

				<rich:column filterBy="#{tuition.description}" filterEvent="onkeyup"
					sortBy="#{tuition.description}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{tuition.description}" />
				</rich:column>

				<rich:column filterBy="#{tuition.tuitionType.name}"
					filterEvent="onkeyup" sortBy="#{tuition.tuitionType.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.tuitionType}" />
					</f:facet>
					<h:outputText value="#{tuition.tuitionType.name}" />
				</rich:column>

				<rich:column filterBy="#{tuition.dueDate}" filterEvent="onkeyup"
					sortBy="#{tuition.dueDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.dueDate}" />
					</f:facet>
					<h:outputText value="#{tuition.dueDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.amount}" />
					</f:facet>
					<h:outputText value="#{tuition.amount}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.paid}" />
					</f:facet>
					<h:outputText value="#{tuition.paid}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.rebate}" />
					</f:facet>
					<h:outputText value="#{tuition.rebate}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.remaining}" />
					</f:facet>
					<h:outputText
						value="#{tuition.amount - tuition.paid-tuition.rebate}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column width="120">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>

					<a4j:commandLink ajaxSingle="true" id="pay"
						action="#{paymentBean.initiatePayment}" reRender="paymentPannel"
						rendered="#{tuition.school.id == user.school.id && studentBean.userHasWriteAccess}"
						oncomplete="#{rich:component('paymentPannel')}.show()">
						<h:graphicImage value="images/icon_money.gif" style="border:0" />
						<f:param name="id" value="#{tuition.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="viewPayments"
						action="#{paymentBean.viewPayments}"
						rendered="#{tuition.school.id == user.school.id }"
						reRender="paymentDetailPannel"
						oncomplete="#{rich:component('paymentDetailPannel')}.show()">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{tuition.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="printReminderButton"
						action="#{paymentBean.prePrintReminder}"
						rendered="#{tuition.school.id == user.school.id && tuition.amount - tuition.paid-tuition.rebate>0}"
						reRender="relancePanel"
						oncomplete="#{rich:component('relancePannel')}.show()">
						<h:graphicImage value="images/remind_icon.jpg" style="border:0" />
						<f:param name="id" value="#{tuition.id}" />
					</a4j:commandLink>

					<rich:toolTip for="pay" value="#{msg.makePayment}" />
					<rich:toolTip for="viewPayments" value="#{msg.viewPayments}" />
					<rich:toolTip for="printReminderButton" value="#{msg.reminder}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>

			<rich:messages />
			<br />

			<font color="#FF0000"> <error> <h:outputText
					value="#{paymentBean.errorMessage}" /> </error>
			</font>
			<font color="#00FF00"> <success> <h:outputText
					value="#{paymentBean.successMessage}" /> </success>
			</font>
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>

<rich:modalPanel id="paymentPannel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.makePayment}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink2"
				styleClass="hidelink" />
			<rich:componentControl for="paymentPannel" attachTo="hidelink2"
				operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<a4j:form>
		<rich:messages style="color:red;"></rich:messages>
		<h:panelGrid columns="2">

			<a4j:outputPanel ajaxRendered="true">

				<h:panelGrid columns="2">

					<h:outputText value="#{msg.year} " />
					<h:outputText value="#{paymentBean.tuition.schoolYear.year}" />

					<h:outputText value="#{msg.description} " />
					<h:outputText value="#{paymentBean.tuition.description}" />

					<h:outputText value="#{msg.amountDue}" />
					<h:outputText
						value="#{paymentBean.tuition.amount-paymentBean.tuition.paid}" />

					<h:outputText value="#{msg.payment}" />
					<h:inputText value="#{paymentBean.newPayment}" />

					<h:outputText value="#{msg.rebate}" />
					<h:inputText value="#{paymentBean.newRebate}" />

					<h:outputText value="#{msg.comment}" />

					<h:inputTextarea id="commentaire"
						value="#{paymentBean.tuition.comment}" rows="2" cols="30">
					</h:inputTextarea>

					<a4j:commandButton value="#{msg.save}"
						action="#{paymentBean.savePayment}"
						reRender="studentPayments,paymentPannel"
						oncomplete="if (#{facesContext.maximumSeverity==null}) #{rich:component('paymentPannel')}.hide();" />
					<font color="#FF0000"> <error> <h:outputText
							value="#{examBean.errorMessage}" /> </error>
					</font>
				</h:panelGrid>
			</a4j:outputPanel>
		</h:panelGrid>

	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="paymentDetailPannel" autosized="true" width="800">
	<f:facet name="header">
		<h:outputText value="#{msg.payments}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink"
				styleClass="hidelink" />
			<rich:componentControl for="paymentDetailPannel" attachTo="hidelink"
				operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<a4j:form>
		<a4j:outputPanel id="tuitionDetailsList">
			<rich:scrollableDataTable width="100%" height="300px"
				value="#{paymentBean.tuitionDetails}" var="tuition"
				sortMode="single" rowKeyVar="id"
				selection="#{paymentBean.selectedReceipts}">

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{tuition.tuition.schoolYear.year}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{tuition.tuition.description}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.paid}" />
					</f:facet>
					<h:outputText value="#{tuition.paid}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.rebate}" />
					</f:facet>
					<h:outputText value="#{tuition.rebate}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.comment}" />
					</f:facet>
					<h:outputText value="#{tuition.comment}">
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.paymentDateTime}" />
					</f:facet>
					<h:outputText value="#{tuition.payDate}">
						<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.receivedBy}" />
					</f:facet>
					<h:outputText value="#{tuition.receivedBy}">
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.print }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="printRecipt"
						action="#{paymentBean.getSelectedPayment}"
						oncomplete="#{rich:component('printPaymentReceipt')}.show();">
						<h:graphicImage value="images/print.gif" style="border:0" />
						<f:param name="id" value="#{tuition.id}" />
					</a4j:commandLink>
				</rich:column>
			</rich:scrollableDataTable>

		</a4j:outputPanel>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="printPaymentReceipt" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.print}" />
	</f:facet>
	<a4j:form>
		<p>
			<h:commandButton id="view" value="#{msg.viewPdf }"
				action="#{paymentBean.printReceipt}" />
		</p>
		<p></p>
		<p>
			<a4j:commandButton value="#{msg.close }"
				oncomplete="#{rich:component('printPaymentReceipt')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="relancePannel" autosized="true" width="500">
	<f:facet name="header">
		<h:outputText value="#{msg.reminder}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink212"
				styleClass="hidelink" />
			<rich:componentControl for="relancePannel" attachTo="hidelink212"
				operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
	<a4j:form>
		<rich:messages style="color:red;"></rich:messages>
		<h:panelGrid columns="2">

			<a4j:outputPanel ajaxRendered="true">

				<h:panelGrid columns="2">

					<h:outputText value="#{msg.year} " />
					<h:outputText value="#{paymentBean.tuition.schoolYear.year}" />

					<h:outputText value="#{msg.description} " />
					<h:outputText value="#{paymentBean.tuition.description}" />


					<h:outputText value="#{msg.amountDue}" />
					<h:outputText value="#{paymentBean.relance.montantDu}" />
					<h:outputText value="#{msg.paid}" />
					<h:outputText value="#{paymentBean.relance.montantPaye}" />
					<h:outputText value="#{msg.rebate}" />
					<h:outputText value="#{paymentBean.relance.remise}" />

					<h:outputText value="#{msg.remaining}" />
					<h:outputText value="#{paymentBean.relance.montantRestant}" />

					<h:outputText value="#{msg.dateLimit}" />
					<rich:calendar id="dateLimit"
						value="#{paymentBean.relance.dateLimite}" locale="fr" popup="true"
						datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						style="width:200px">
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar>


					<h:outputText value="#{msg.message}" />
					<h:inputTextarea id="messageq"
						value="#{paymentBean.relance.message}" rows="6" cols="60">
					</h:inputTextarea>
					<h:commandButton id="view" value="#{msg.printReminder }"
						action="#{paymentBean.printReminder}" />



					<a4j:commandButton value="#{msg.close }"
						oncomplete="#{rich:component('relancePannel')}.hide();" />



				</h:panelGrid>
			</a4j:outputPanel>
		</h:panelGrid>

	</a4j:form>
</rich:modalPanel>



