<a4j:form>
	<a4j:region>

		<a4j:outputPanel id="studentPayments">
			<rich:dataTable rows="5" value="#{paymentBean.tuitions}"
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
				
				<rich:column filterBy="#{tuition.tuitionType.name}" filterEvent="onkeyup"
					sortBy="#{tuition.tuitionType.name}">
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
					<h:outputText value="#{tuition.amount - tuition.paid-tuition.rebate}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column width="60">
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

					<rich:toolTip for="modify" value="#{msg.makePayment}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>

			<rich:messages />
			<br />

			<font color="#FF0000"> <error> <h:outputText
				value="#{paymentBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{paymentBean.successMessage}" /> </success> </font>
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>
