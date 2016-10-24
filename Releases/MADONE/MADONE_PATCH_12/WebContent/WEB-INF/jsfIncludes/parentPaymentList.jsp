		<a4j:form>
			<a4j:outputPanel ajaxRendered="true">
				<font color="#FF0000"> <error> <h:outputText
					value="#{parentBean.errorMessage}" /> </error>
				</font>
				<font color="#00FF00"> <success> <h:outputText
						value="#{parentBean.successMessage}" /> </success>
				</font>
			</a4j:outputPanel>
			<a4j:outputPanel ajaxRendered="true">
				<a4j:outputPanel>
					<h:panelGrid columns="10">
						<h:outputText value="#{msg.year }"><font color="#FF0000">* </font></h:outputText>
						<rich:comboBox id="parentPaymentSchoolYear" value="#{parentBean.year}"
										suggestionValues="#{schoolYearBean.allSchoolYears}">
						</rich:comboBox>
						
						<a4j:commandButton value="#{msg.search}"
							onclick="buttonClicked = true; "
							action="#{parentBean.getParentPaymentsByStudents}" reRender="parentPaymentTuitions"/>
					</h:panelGrid>	
				</a4j:outputPanel>
			</a4j:outputPanel>
			<br/>
			
			<a4j:outputPanel id="parentPaymentTuitions">
				<rich:dataTable rows="50" value="#{parentBean.parent.studentVOs}"
					var="studentVO" rendered="#{parentBean.parent.studentVOCount > 0}" reRender="ds" 
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
								<h:outputFormat value="#{msg.dueDate}"/>
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
						<a4j:commandLink value="+/- " reRender="parentPaymentTuitions"> 
							<a4j:actionparam name="shown" value="#{not studentVO.showDetails}"
							 assignTo="#{studentVO.showDetails}"/>
						</a4j:commandLink>       
						<h:outputText value="#{msg.matricule}: " />
						<h:outputText value="#{studentVO.matricule}" /> &nbsp; &nbsp; &nbsp;
						<h:outputText value="#{msg.lastName}: " />
						<h:outputText value="#{studentVO.lastName}" /> &nbsp; &nbsp; &nbsp;
						<h:outputText value="#{msg.firstName}: " />
						<h:outputText value="#{studentVO.firstName}" /> &nbsp; &nbsp; &nbsp;
						
						<h:outputText rendered="#{studentVO.hasPastDueAmount}" value="#{msg.hasPaymentDue}" style="color:red" />      
					</rich:column> 
					
					<rich:subTable rendered="#{studentVO.showDetails}" value="#{studentVO.tuitionTypes}" var="tuitionType">
						<rich:column breakBefore="true">
						</rich:column>
						<rich:column colspan="7">
							<a4j:commandLink value="+/-   " reRender="parentPaymentTuitions"> 
								<a4j:actionparam name="shown" value="#{not tuitionType.showDetails}"
								 assignTo="#{tuitionType.showDetails}"/>
							</a4j:commandLink> 
							<h:outputText value="#{tuitionType.name}" /> &nbsp;
							<h:outputText rendered="#{tuitionType.hasPastDueAmount}" value="#{msg.hasPaymentDue}" style="color:red" />
						</rich:column>
						<rich:subTable rendered="#{tuitionType.showDetails}" value="#{tuitionType.tuitions}" var="tuition">
							<rich:column breakBefore="true" colspan="2">
							</rich:column>
							<rich:column colspan="6">
								<a4j:commandLink value="+/-   " reRender="parentPaymentTuitions"> 
									<a4j:actionparam name="shown" value="#{not tuition.showDetails}"
									 assignTo="#{tuition.showDetails}"/>
								</a4j:commandLink>
								<h:outputText value="#{tuition.description}" /> &nbsp;
								<h:outputText rendered="#{tuition.hasPastDueAmount}" value="#{msg.hasPaymentDue}" style="color:red" />
							</rich:column>
							<rich:subTable rendered="#{tuition.showDetails}" value="#{tuition.payments}" var="payment">
								<rich:column breakBefore="true" colspan="3">
								</rich:column>
								<rich:column>
							  		<h:outputText value="#{tuition.dueDate}">
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
							<h:outputText value="Totals #{tuitionType.name}"/>
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
						
					</rich:subTable> 
					
					<rich:column breakBefore="true" colspan="4">
						<h:outputText value="Totals "/>
						<h:outputText value="#{msg.matricule}: " />
						<h:outputText value="#{studentVO.matricule}" /> &nbsp; &nbsp; &nbsp;
						<h:outputText value="#{msg.lastName}: " />
						<h:outputText value="#{studentVO.lastName}" /> &nbsp; &nbsp; &nbsp;
						<h:outputText value="#{msg.firstName}: " />
						<h:outputText value="#{studentVO.firstName}" />
					</rich:column>
					
					<rich:column>
						<h:outputText value="#{studentVO.totalAmount}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>
					</rich:column>
					<rich:column>
						<h:outputText value="#{studentVO.totalPaid}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>
					</rich:column>
					<rich:column>
						<h:outputText value="#{studentVO.totalRebate}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>
					</rich:column>
					<rich:column>
						<h:outputText value="#{studentVO.totalBalance}">
							<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
						</h:outputText>
					</rich:column>
							
					<f:facet name="footer">
						<rich:columnGroup>
							<rich:column>Totals</rich:column>
							<rich:column></rich:column>
							<rich:column></rich:column>
							<rich:column></rich:column>
							<rich:column>                 
							 	<h:outputText value="#{parentBean.parent.totalAmount}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
							 <rich:column>                 
							 	<h:outputText value="#{parentBean.parent.totalPaid}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
							 <rich:column>                 
							 	<h:outputText value="#{parentBean.parent.totalRebate}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
							 <rich:column>                 
							 	<h:outputText value="#{parentBean.parent.totalBalance}">
									<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
								</h:outputText>                           
							 </rich:column>
						</rich:columnGroup>
					</f:facet>
				</rich:dataTable>
			</a4j:outputPanel>
		</a4j:form>