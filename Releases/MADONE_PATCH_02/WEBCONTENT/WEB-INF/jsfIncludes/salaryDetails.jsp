<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionSalary">
		<rich:panel style="width:700px;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.salary}"/>
	        	</h:outputFormat>
		    </f:facet>
	    	<table class="table">
	    	
	    		<tr>
					<td>
	         			<h:outputText value="#{msg.payType}:" /><font
								color="#FF0000">*</font>
	         		</td>
	         		<td><rich:comboBox id="payType" suggestionValues="#{payTypeBean.allPayTypes}"
						directInputSuggestions="true" defaultLabel="#{msg.enterListDefaultValue}"
						value="#{salaryBean.payTypeName}">
						</rich:comboBox>
						<font color="#FF0000"><rich:message for="payType" /></font>
					</td>
				</tr>
				
				<tr>
					<td> 
						<h:inputHidden value="#{salaryBean.salary.id}" />
	          			<h:outputText value="#{msg.amount}:" /><font
								color="#FF0000">*</font>
	          		</td>
	          		<td>
	          			<h:inputText id="amount" value="#{salaryBean.salary.amount}" 
	          				size="20" maxlength="15" onchange="convertToUpperCase(this);">
	            			<rich:ajaxValidator event="onblur"/>
	          			</h:inputText>
	          		</td>
	          		<td>             
	          			<font color="#FF0000"><rich:message for="amount" /></font>                            
			  		</td>
			  	</tr>
			  	
			  	<tr>
					<td><h:outputText value="#{msg.effectiveDate }" /><font
								color="#FF0000">*</font></td>
					<td><rich:calendar id="effectiveDate"
						value="#{salaryBean.salary.effectiveDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						enableManualInput="true"
						requiredMessage="#{msg.requiredMessage}" converterMessage="#{msg.dateConverter}"
						style="width:200px">
						<rich:ajaxValidator event="onblur" />
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message
						for="effectiveDate" /></font></td>
				</tr>
			  	
			  	<tr>
					<td><h:outputText value="#{msg.comments}" /></td>
					<td><h:inputTextarea id="salaryComment"
						value="#{salaryBean.salary.comment}" rows ="5"
						cols="50" >
					</h:inputTextarea></td>
					<td><font color="#FF0000"><rich:message
						for="salaryComment" /></font></td>
				</tr>
			</table>
		        
				<a4j:commandButton value="#{msg.save}" 
					rendered = "#{teacherBean.userHasWriteAccess}"
					action="#{salaryBean.insert}"
					reRender="salaries, gestionSalary, salaryResultPanel1" 
					oncomplete="#{rich:component('salaryResultPanel1')}.show();"/>
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{salaryBean.clear}" reRender="gestionSalary" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="salaryResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{salaryBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{salaryBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('salaryResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>