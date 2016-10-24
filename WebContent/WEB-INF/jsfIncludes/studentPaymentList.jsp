<a4j:form>
	<a4j:commandButton ajaxSingle="true" id="pay"
		action="#{studentBean.initiatePayment}" reRender="placeHolder"
		value="#{msg.makePayment }"
		rendered="#{studentBean.userHasWriteAccess}"
		oncomplete="#{rich:component('studentPaymentPannel')}.show()">
	</a4j:commandButton>
</a4j:form>
<br/>
<a4j:form>
	<a4j:outputPanel ajaxRendered="true">
		<font color="#FF0000"> <error> <h:outputText
			value="#{studentBean.errorMessage}" /> </error>
		</font>
		<font color="#00FF00"> <success> <h:outputText
				value="#{studentBean.successMessage}" /> </success>
		</font>
	</a4j:outputPanel>
	<a4j:outputPanel ajaxRendered="true">
		<a4j:outputPanel>
			<h:panelGrid columns="10">
				<h:outputText value="#{msg.year }"><font color="#FF0000">* </font></h:outputText>
				<rich:comboBox id="studentPaymentSchoolYear" value="#{studentBean.year}"
								suggestionValues="#{schoolYearBean.allSchoolYears}">
				</rich:comboBox>
				
				<a4j:commandButton value="#{msg.search}"
					onclick="buttonClicked = true; "
					action="#{studentBean.getStudentPaymentsByStudents}" reRender="studentPaymentTuitions"/>
			</h:panelGrid>	
		</a4j:outputPanel>
	</a4j:outputPanel>
	<br/>
	
	<a4j:outputPanel id="studentPaymentTuitions">
		<a4j:outputPanel ajaxRendered="true">
			<rich:dataTable rows="50" value="#{studentBean.student.tuitionTypes}"
				var="tuitionType" rendered="#{studentBean.student.tuitionTypeCount > 0}" reRender="ds" 
				rowKeyVar="row" style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<rich:columnGroup> 
						<rich:column colspan="8">
							<h:outputFormat value="#{msg.listHeader}">
								<f:param value="#{msg.tuition}" />
							</h:outputFormat>
						</rich:column>
						
						<rich:column breakBefore="true" colspan="3">
						</rich:column>
						
						<rich:column>
							<h:outputFormat value="#{msg.paymentDate}"/>
						</rich:column>
											
						<rich:column>
							<h:outputFormat value="#{msg.amount}"/>
						</rich:column>
						
						<rich:column>
							<h:outputFormat value="#{msg.paid}"/>
						</rich:column>
						
						<rich:column >
							<h:outputFormat value="#{msg.rebate}"/>
						</rich:column>
						
						<rich:column>
							<h:outputFormat value="#{msg.remaining}"/>
						</rich:column>
						
					</rich:columnGroup>
				</f:facet>
				
				<rich:column colspan="8">
					<h:outputText value="#{tuitionType.name}" /> &nbsp;
					<h:outputText rendered="#{tuitionType.hasPastDueAmount}" value="#{msg.hasPaymentDue}" style="color:red" />
				</rich:column>
				<rich:subTable value="#{tuitionType.tuitions}" var="tuition">
					<rich:column colspan="2">
					</rich:column>
					<rich:column colspan="6">
						<a4j:commandLink value="+/-   " reRender="studentPaymentTuitions"> 
							<a4j:actionparam name="shown1" value="#{not tuition.showDetails}"
							 assignTo="#{tuition.showDetails}"/>
						</a4j:commandLink>
						<h:outputText value="#{tuition.description}" /> &nbsp; / &nbsp; 
							<h:outputText value="#{msg.dueDate}" /> &nbsp; 
							<h:outputText value="#{tuition.dueDate}">
								<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
							</h:outputText> &nbsp; 
						<h:outputText rendered="#{tuition.hasPastDueAmount}" value="#{msg.hasPaymentDue}" style="color:red" />
					</rich:column>
					<rich:subTable rendered="#{tuition.showDetails}" value="#{tuition.payments}" var="payment">
						<rich:column colspan="3">
						</rich:column>
						<rich:column>
					  		<h:outputText value="#{payment.paymentDate}">
								<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
							</h:outputText>
					  	</rich:column>
						<rich:column>
							<h:outputText value="#{tuition.amount}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>
							<f:facet name="footer">                     
						 		<h:outputText value="#{tuition.amount}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
				 			</f:facet>
						</rich:column>
						<rich:column>
							<h:outputText value="#{payment.amount}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>
							<f:facet name="footer">                     
						 		<h:outputText value="#{tuition.paid}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
				 			</f:facet>
						</rich:column>
						<rich:column>
							<h:outputText value="#{payment.rebate}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>
							<f:facet name="footer">                     
						 		<h:outputText value="#{tuition.rebate}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
				 			</f:facet>
						</rich:column>
						<rich:column>
							<h:outputText value="#{tuition.amount - payment.amount - payment.rebate}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>
							<f:facet name="footer">                     
						 		<h:outputText value="#{tuition.balance}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
				 			</f:facet>
						</rich:column>
					</rich:subTable>									
				</rich:subTable> 
				
				<rich:column breakBefore="true" colspan="4">
					<h:outputText value="Total #{tuitionType.name}"/>
				</rich:column>
				<rich:column>
					<h:outputText value="#{tuitionType.totalAmount}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column>
					<h:outputText value="#{tuitionType.totalPaid}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column>
					<h:outputText value="#{tuitionType.totalRebate}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column>
					<h:outputText value="#{tuitionType.totalBalance}">
						<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
					</h:outputText>
				</rich:column>
				
				<f:facet name="footer">
					<rich:columnGroup>
						<rich:column>Total</rich:column>
						<rich:column></rich:column>
						<rich:column></rich:column>
						<rich:column></rich:column>
						<rich:column>                 
						 	<h:outputText value="#{studentBean.student.totalAmount}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                           
						 </rich:column>
						 <rich:column>                 
						 	<h:outputText value="#{studentBean.student.totalPaid}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                           
						 </rich:column>
						 <rich:column>                 
						 	<h:outputText value="#{studentBean.student.totalRebate}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                           
						 </rich:column>
						 <rich:column>                 
						 	<h:outputText value="#{studentBean.student.totalBalance}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                           
						 </rich:column>
					</rich:columnGroup>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>
	</a4j:outputPanel>
</a4j:form>



<a4j:outputPanel id="placeHolder">
	<rich:modalPanel id="studentPaymentPannel" autosized="true" width="1000">
		<f:facet name="header">
			<h:outputText value="#{msg.makePayment}" />
		</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="studentPaymentHideLink"
					styleClass="hidelink" />
				<rich:componentControl for="studentPaymentPannel" attachTo="studentPaymentHideLink"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<a4j:outputPanel ajaxRendered="true">
				<font color="#FF0000"> <error> <h:outputText
					value="#{studentBean.errorMessage}" /> </error>
				</font>
				<font color="#00FF00"> <success> <h:outputText
						value="#{studentBean.successMessage}" /> </success>
				</font>
			</a4j:outputPanel>
			<a4j:outputPanel ajaxRendered="true">
				<h:panelGrid columns="10">
					<h:outputText value="#{msg.year }"><font color="#FF0000">* </font></h:outputText>
					<rich:comboBox id="studentPaymentSchoolYear" value="#{studentBean.year}"
									suggestionValues="#{schoolYearBean.allSchoolYears}">
					</rich:comboBox>
					
					<h:outputText></h:outputText>
					
					<h:outputText value="#{msg.tuitionType}"><font color="#FF0000">* </font></h:outputText>
					<rich:comboBox id="studentPaymentTuitionTypes"
							suggestionValues="#{tuitionTypeBean.allTuitionTypes}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{studentBean.tuitionTypeName}" 
							> 
	
					</rich:comboBox>
					
					<a4j:commandButton value="#{msg.search}"
						onclick="buttonClicked = true; "
						action="#{studentBean.getStudentTuitionsByTuitionType}" reRender="studentTuitions"/>
				</h:panelGrid>	
			</a4j:outputPanel>
			<br/>
			
			<a4j:outputPanel id="studentTuitions">
				<rich:dataTable rows="50" value="#{studentBean.student.tuitions}"
					var="tuition" rendered="#{studentBean.student.tuitionCount > 0}" reRender="ds" 
					rowKeyVar="row" style="overflow: hidden; width: 100%; white-space: nowrap;">
					<f:facet name="header">
						<rich:columnGroup> 
							<rich:column colspan="5">
								<h:outputFormat value="#{msg.listHeader}">
									<f:param value="#{msg.tuition}" />
								</h:outputFormat>
							</rich:column>
							
							<rich:column breakBefore="true">
								<h:outputFormat value="#{msg.dueDate}"/>
							</rich:column>
														
							<rich:column>
								<h:outputFormat value="#{msg.amount}"/>
							</rich:column>
							
							<rich:column >
								<h:outputFormat value="#{msg.paid}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.rebate}"/>
							</rich:column>
							
							<rich:column rowspan="2">
								<h:outputFormat value="#{msg.remaining}"/>
							</rich:column>
						</rich:columnGroup>
					</f:facet>					 
				
				  	<rich:column breakBefore="true">
				  		<h:outputText value="#{tuition.dueDate}">
							<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
						</h:outputText>
				  	</rich:column>
				  	
					<rich:column>                 
					 	<h:outputText value="#{tuition.amount}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>                           
					 </rich:column>
					 
					 <rich:column>                 
					 	<h:outputText value="#{tuition.paid}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>                          
					 </rich:column>
					 
					 <rich:column>                 
					 	<h:outputText value="#{tuition.rebate}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>                         
					</rich:column>
					 
 					<rich:column>                 
					 	<h:outputText value="#{tuition.balance}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>                              
					</rich:column>
				
					<f:facet name="footer">
						<rich:columnGroup>
							<rich:column>Total</rich:column>
							<rich:column>                 
							 	<h:outputText value="#{studentBean.student.totalAmountByType}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
							 <rich:column>                 
							 	<h:outputText value="#{studentBean.student.totalPaidByType}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
							 <rich:column>                 
							 	<h:outputText value="#{studentBean.student.totalRebateByType}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
							 <rich:column>                 
							 	<h:outputText value="#{studentBean.student.totalBalanceByType}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
						</rich:columnGroup>
					</f:facet>
				</rich:dataTable>
			</a4j:outputPanel>						
						
			<h:panelGrid columns="2">
				<a4j:outputPanel ajaxRendered="true">
					<h:panelGrid columns="2">				
						<h:outputText value="#{msg.payment}" />
						<h:inputText value="#{studentBean.tuition.amount}" />
	
						<h:outputText value="#{msg.rebate}" />
						<h:inputText value="#{studentBean.tuition.rebate}" />
	
						<h:outputText value="#{msg.comment}" />
						<h:inputTextarea id="commentaire"
							value="#{studentBean.tuition.comment}" rows="2" cols="30">
						</h:inputTextarea>
	
						<a4j:commandButton value="#{msg.save}"
							action="#{studentBean.savePaymentsForStudentByTuitionType}"
							reRender="studentTuitions,printStudentReceipt,studentPaymentTuitions"
							/>
														
						<h:commandButton id="printStudentReceipt" value="#{msg.printReceipt }"
						rendered="#{studentBean.paymentId>0}"
						action="#{studentBean.printReceipt}" />
			
					</h:panelGrid>
				</a4j:outputPanel>
			</h:panelGrid>
		</a4j:form>
	</rich:modalPanel>
</a4j:outputPanel>