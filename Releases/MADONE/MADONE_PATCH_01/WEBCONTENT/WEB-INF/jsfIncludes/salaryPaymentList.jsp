<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="salaryPayments">
			<rich:dataTable style="overflow: hidden; width: 700px; white-space: nowrap;" rows="5" value="#{salaryPaymentBean.salaryPayments}" var="salaryPayment"
				rendered="#{salaryPaymentBean.rowCount>0}" reRender="ds" rowKeyVar="row">
			    <f:facet name="header" >
		        	<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.salaryPayments}"/>
		        	</h:outputFormat>
		        </f:facet>
			        
			     <rich:column filterBy="#{salaryPayment.paymentDate}" filterEvent="onkeyup" sortBy="#{salaryPayment.paymentDate}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.paymentDate}"/>
		            </f:facet>
			            <h:outputText value="#{salaryPayment.paymentDate}" >
			            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
			            </h:outputText>
			    </rich:column>
	
				<rich:column filterBy="#{salaryPayment.payrollBeginDate}" filterEvent="onkeyup" sortBy="#{salaryPayment.payrollBeginDate}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.payrollBeginDate}"/>
		            </f:facet>
			            <h:outputText value="#{salaryPayment.payrollBeginDate}">
			            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
			            </h:outputText>
			    </rich:column>
			    
			    <rich:column filterBy="#{salaryPayment.payrollEndDate}" filterEvent="onkeyup" sortBy="#{salaryPayment.payrollEndDate}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.payrollEndDate}"/>
		            </f:facet>
			            <h:outputText value="#{salaryPayment.payrollEndDate}">
			            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
			            </h:outputText>
			    </rich:column>
			    
			    <rich:column filterBy="#{salaryPayment.amount}" filterEvent="onkeyup" sortBy="#{salaryPayment.amount}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.amount}"/>
		            </f:facet>
			            <h:outputText value="#{salaryPayment.amount}">
			            	<f:convertNumber  pattern="#{configurationBean.moneyFormat}"  />
			            </h:outputText>
			    </rich:column>
			        
			    <rich:column>
			        <f:facet name="header">
		                <h:outputText value="#{msg.actions }"/>
		            </f:facet>
			        <a4j:commandLink ajaxSingle="true" id="modify" action="#{salaryPaymentBean.edit}" reRender="gestionSalaryPayment, teacherSalaryPaymentPanel">
			            <h:graphicImage value="images/edit.gif" style="border:0"/>
			            <f:param name="id" value="#{salaryPayment.id}"/>
			        </a4j:commandLink>  
			         <rich:spacer width="20" height="10" title="" />
			        <a4j:commandLink ajaxSingle="true" id="delete" action="#{salaryPaymentBean.delete}" reRender="gestionSalaryPayment, salaryPayments, salaryPaymentResultPanel"
			        oncomplete="#{rich:component('salaryPaymentResultPanel')}.show();">
			            <h:graphicImage value="/images/delete.gif" style="border:0"/>
			            <f:param name="id" value="#{salaryPayment.id}"/>
			        </a4j:commandLink>
			        
			        <rich:toolTip for="modify" value="#{msg.modify}"/>      
	                <rich:toolTip for="delete" value="#{msg.delete}"/> 
			    </rich:column>
			        
			    <f:facet name="footer">
		            <rich:datascroller id="ds"></rich:datascroller>
		        </f:facet>
			</rich:dataTable>
			<br/>
			<br/>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="salaryPaymentResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>

	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{salaryPaymentBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{salaryPaymentBean.successMessage}" />
		</success> </font></p>
	
		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('salaryPaymentResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>