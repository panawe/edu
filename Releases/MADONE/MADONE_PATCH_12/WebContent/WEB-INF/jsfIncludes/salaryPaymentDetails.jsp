<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionSalaryPayment">
		<rich:panel style="width:700px;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.salaryPayment}"/>
	        	</h:outputFormat>
		    </f:facet>
	    	<table class="table">
				
				<tr>
					<td> 
						<h:inputHidden value="#{salaryPaymentBean.salaryPayment.id}" />
	          			<h:outputText value="#{msg.amount}:" /><font
								color="#FF0000">*</font>
	          		</td>
	          		<td>
	          			<h:inputText id="paymentAmount" value="#{salaryPaymentBean.salaryPayment.amount}" 
	          				size="20" maxlength="15" onchange="convertToUpperCase(this);">
	            			<rich:ajaxValidator event="onblur"/>
	          			</h:inputText>
	          		</td>
	          		<td>             
	          			<font color="#FF0000"><rich:message for="paymentAmount" /></font>                            
			  		</td>
			  	</tr>
			  	
			  	<tr>
					<td><h:outputText value="#{msg.paymentDate }" /><font
								color="#FF0000">*</font></td>
					<td><rich:calendar id="salaryPaymentDate"
						value="#{salaryPaymentBean.salaryPayment.paymentDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						enableManualInput="true"
						requiredMessage="#{msg.requiredMessage}" converterMessage="#{msg.dateConverter}"
						style="width:200px">
						<rich:ajaxValidator event="onblur" />
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message
						for="salaryPaymentDate" /></font></td>
				</tr>
				
				<tr>
					<td><h:outputText value="#{msg.payrollBeginDate }" /><font
								color="#FF0000">*</font></td>
					<td><rich:calendar id="payrollBeginDate"
						value="#{salaryPaymentBean.salaryPayment.payrollBeginDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						enableManualInput="true"
						requiredMessage="#{msg.requiredMessage}" converterMessage="#{msg.dateConverter}"
						style="width:200px">
						<rich:ajaxValidator event="onblur" />
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message
						for="payrollBeginDate" /></font></td>
				</tr>
				
				<tr>
					<td><h:outputText value="#{msg.payrollEndDate }" /><font
								color="#FF0000">*</font></td>
					<td><rich:calendar id="payrollEndDate"
						value="#{salaryPaymentBean.salaryPayment.payrollEndDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						enableManualInput="true"
						requiredMessage="#{msg.requiredMessage}" converterMessage="#{msg.dateConverter}"
						style="width:200px">
						<rich:ajaxValidator event="onblur" />
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message
						for="payrollEndDate" /></font></td>
				</tr>
			  	
			  	<tr>
					<td><h:outputText value="#{msg.comments}" /></td>
					<td><h:inputTextarea id="salaryPaymentComment"
						value="#{salaryPaymentBean.salaryPayment.comment}" rows ="5"
						cols="50" >
					</h:inputTextarea></td>
					<td><font color="#FF0000"><rich:message
						for="salaryPaymentComment" /></font></td>
				</tr>
			</table>
		        
				<a4j:commandButton value="#{msg.save}" rendered = "#{teacherBean.userHasWriteAccess }"
					action="#{salaryPaymentBean.insert}"
					reRender="salaryPayments, gestionSalaryPayment, salaryPaymentResultPanel1" 
					oncomplete="#{rich:component('salaryPaymentResultPanel1')}.show();"/>
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{salaryPaymentBean.clear}" reRender="gestionSalaryPayment" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="salaryPaymentResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{salaryPaymentBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{salaryPaymentBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('salaryPaymentResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>