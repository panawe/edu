<a4j:region>
	<table width="50%">
		<tr>
			<td><h:outputText value="#{msg.inHowManyDays }" /></td>
			<td width="30%">
				<h:inputText value="#{paymentBean.numberOfDays}" /> 	
			</td>
			<td>
				<a4j:commandButton value="#{msg.search}" action="#{paymentBean.getOverDuePayments}" 
				rendered = "#{ paymentBean.userHasWriteAccess }" reRender="overDuePayments" 
				oncomplete="if (#{paymentBean.rowCount <= 0}) #{rich:component('overDuePaymentResultPanelStudent')}.show();" />
			</td>
			
		</tr>
	</table>
</a4j:region>

<a4j:region>
	<rich:modalPanel id="overDuePaymentResultPanelStudent" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<p>
			<h:outputText value="#{msg.noResultFound}" />
		</p>
		<p></p>
		<p>
			<a4j:commandButton value="Fermer" reRender="students" 
			oncomplete=" #{rich:component('overDuePaymentResultPanelStudent')}.hide();" />
		</p>
	</rich:modalPanel>
</a4j:region>

<a4j:region>
	<a4j:outputPanel id="overDuePayments">
		<rich:dataTable rows="5" value="#{paymentBean.tuitionEnrollments}" var="tuitionEnrollment"
			rendered="#{paymentBean.rowCount>0}" reRender="ds" rowKeyVar="row">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
        		 <f:param value="#{msg.overDuePayments}"/>
        	</h:outputFormat>
			</f:facet>
			
			<rich:column filterBy="#{tuitionEnrollment.enrollment.levelClass.name}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.enrollment.levelClass.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.levelClass}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.enrollment.levelClass.name}" />
			</rich:column>
					
			<rich:column filterBy="#{tuitionEnrollment.enrollment.student.firstName}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.enrollment.student.firstName}">
				<f:facet name="header">
					<h:outputText value="#{msg.firstName}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.enrollment.student.firstName}" />
			</rich:column>
					
			<rich:column filterBy="#{tuitionEnrollment.enrollment.student.lastName}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.enrollment.student.lastName}">
				<f:facet name="header">
					<h:outputText value="#{msg.lastName}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.enrollment.student.lastName}" />
			</rich:column>
			
			<rich:column filterBy="#{tuitionEnrollment.tuition.schoolYear.year}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.tuition.schoolYear.year}">
				<f:facet name="header">
					<h:outputText value="#{msg.year}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.schoolYear.year}" />
			</rich:column>
			
			<rich:column filterBy="#{tuitionEnrollment.tuition.description}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.tuition.description}">
				<f:facet name="header">
					<h:outputText value="#{msg.description}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.description}" />
			</rich:column>
			
			<rich:column filterBy="#{tuitionEnrollment.tuition.tuitionType.name}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.tuition.tuitionType.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.tuitionType}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.tuitionType.name}" />
			</rich:column>

			<rich:column filterBy="#{tuitionEnrollment.tuition.dueDate}" filterEvent="onkeyup"
				sortBy="#{tuitionEnrollment.tuition.dueDate}">
				<f:facet name="header">
					<h:outputText value="#{msg.dueDate}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.dueDate}" >
									<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
				 </h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.amount}"/>
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.amount}" >
						<f:convertNumber  pattern="#{configurationBean.moneyFormat}"  />
					</h:outputText>
			</rich:column>
			
			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.paid}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.paid}">
						<f:convertNumber  pattern="#{configurationBean.moneyFormat}"  />
					</h:outputText>
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.remaining}" />
				</f:facet>
				<h:outputText value="#{tuitionEnrollment.tuition.amount - tuitionEnrollment.tuition.paid}">
						<f:convertNumber  pattern="#{configurationBean.moneyFormat}"  />
					</h:outputText>
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
<a4j:region>

<rich:messages></rich:messages>
</a4j:region>



