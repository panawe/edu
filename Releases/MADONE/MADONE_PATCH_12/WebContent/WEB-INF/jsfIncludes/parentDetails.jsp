<table width="100%">
	<tr>
		<td width="45%">
			<a4j:form>
				<a4j:region>
					<a4j:outputPanel id="gestionParent">
					<rich:panel style="overflow: hidden; width: 100%; white-space: nowrap;" >
						<f:facet name="header">
				        	<h:outputFormat value="#{msg.detailsHeader}">
				        		 <f:param value="#{msg.parent}"/>
				        	</h:outputFormat>
					    </f:facet>
				    	<table class="table">
				    	<%
							if ("student".equals(request.getSession().getAttribute("link"))) {
						%>
				    		<tr>
								<td> 
				          			<h:outputText value="#{msg.parentType}"> <font
										color="#FF0000">*</font> </h:outputText>
				          		</td>
				          		<td>
				          			<h:selectOneMenu required = "true"
										value="#{parentBean.parent.parentType}"
										binding="#{parentBean.mySecondValue}">
										<f:selectItems value="#{parentBean.configsByGroupName}" />
										<f:attribute name="groupName" value="PARENT_TYPE" />
									</h:selectOneMenu>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="parentType" /></font>                            
						  		</td>
						  	</tr>
						  <%
							}
						  %>
							<tr>
								<td> 
									<h:inputHidden value="#{parentBean.parent.id}" />
				          			<h:outputText value="#{msg.name}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="lastName" value="#{parentBean.parent.lastName}" 
				          				size="50" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="lastName" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<td> 
				          			<h:outputText value="#{msg.firstName}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="firstName" value="#{parentBean.parent.firstName}" 
				          				size="50" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="firstName" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<td> 
									<h:outputText value="#{msg.middleName}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="middleName" value="#{parentBean.parent.middleName}" 
				          				size="25" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="middleName" /></font>                            
						  		</td>
						  	</tr>
							<tr>
								<td> 
									<h:outputText value="#{msg.address}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="address" value="#{parentBean.parent.address}" 
				          				size="50" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="address" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<td> 
									<h:outputText value="#{msg.city}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="city" value="#{parentBean.parent.city}" 
				          				size="50" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="city" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<a4j:region>
									<td><h:outputText value="#{msg.country}:" /><font
										color="#FF0000">*</font></td>
									<td><rich:comboBox id="country"
										value="#{parentBean.countryName}"
										defaultLabel="#{msg.enterListDefaultValue}"
										suggestionValues="#{countryBean.allCountries}"
										requiredMessage="#{msg.requiredMessage}" required="true">
									</rich:comboBox></td>
									<td><font color="#FF0000"><rich:message
										for="country" /></font></td>
								</a4j:region>
							</tr>
							<tr>
								<td> 
									<h:outputText value="#{msg.phone}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="telephone" value="#{parentBean.parent.telephone}" 
				          				size="20" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="telephone" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<td> 
									<h:outputText value="#{msg.email}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="email" value="#{parentBean.parent.email}" 
				          				size="50" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="email" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<td> 
									<h:outputText value="#{msg.profession}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="profession" value="#{parentBean.parent.profession}" 
				          				size="20" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="profession" /></font>                            
						  		</td>
						  	</tr>
						  	<tr>
								<td> 
									<h:outputText value="#{msg.workPlace}:" />
				          		</td>
				          		<td>
				          			<h:inputText id="workPlace" value="#{parentBean.parent.workPlace}" 
				          				size="20" maxlength="50" onchange="convertToUpperCase(this);">
				            			<rich:ajaxValidator event="onblur"/>
				          			</h:inputText>
				          		</td>
				          		<td>             
				          			<font color="#FF0000"><rich:message for="workPlace" /></font>                            
						  		</td>
						  	</tr>
							<tr>
								<td><h:outputText value="#{msg.picture}" /></td>
								<td valign="top">
									<table>
										<a4j:region>
											<tr>
												<td><rich:fileUpload disabled="false"
													fileUploadListener="#{parentBean.listener}"
													maxFilesQuantity="#{parentBean.uploadsAvailable}"
													id="uploadImage" listWidth="250" listHeight="70"
													immediateUpload="#{parentBean.autoUpload}"
													addControlLabel="#{msg.addImage}"
													clearAllControlLabel="#{msg.removeAll }"
													clearControlLabel="#{msg.remove }"
													stopEntryControlLabel="#{msg.stop}"
													uploadControlLabel="#{msg.upload}"
													acceptedTypes="jpg, gif, png, bmp"
													allowFlash="#{teacherBean.useFlash}">
													<a4j:support event="onuploadcomplete" reRender="infoImage" />
													<f:facet name="label">
														<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
													</f:facet>
												</rich:fileUpload></td>
											</tr>
											<tr>
												<td><h:panelGroup id="infoImage">
													<rich:panel bodyClass="info">
														<f:facet name="header">
															<h:outputText value="#{msg.image }" />
														</f:facet>
														<h:outputText value="#{msg.noPicture}"
															rendered="#{empty parentBean.picture}" />
														<a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel"
															rendered="#{not empty parentBean.picture}">
															<h:panelGroup id="schoolLogoGrp">
																<a4j:mediaOutput id="schoolLogoOut" element="img"
																style="width:220px; height:190px;"
																	mimeType="image/gif" createContent="#{parentBean.paint}"
																	value="#{parentBean.random}" cacheable="false">
																</a4j:mediaOutput>
															</h:panelGroup>
														</a4j:outputPanel>
													</rich:panel>
												</h:panelGroup></td>
				
											</tr>
										</a4j:region>
									</table>
								</td>
							</tr>
						</table>
					        
					    <a4j:commandButton value="#{msg.save}" action="#{parentBean.insert}" 
					    					rendered = "#{ schoolBean.userHasWriteAccess }"
					    					reRender="parents, gestionParent" /> 
					    <SPACER TYPE=HORIZONTAL SIZE=50>
					    <a4j:region>  
				        	<a4j:commandButton value="#{msg.clear}" action="#{parentBean.clear}" 
				        						reRender="gestionParent, students"/> 
				        </a4j:region>                          		
					</rich:panel>
				</a4j:outputPanel>
				</a4j:region>
			</a4j:form>
		</td>
	<%
		if ("parent".equals(request.getSession().getAttribute("link"))) {
	%>
		<td valign="top">
			<a4j:form>
				<a4j:region>
					<a4j:outputPanel id="students">
						<rich:dataTable rows="5" value="#{parentBean.selectedStudents}"
							var="student" rendered="#{parentBean.selectedStudentsCount > 0}" reRender="ds"
							rowKeyVar="row"
							style="overflow: hidden; width: 100%; white-space: nowrap;">
							<f:facet name="header">
								<h:outputFormat value="#{msg.listHeader}">
									<f:param value="#{msg.children}" />
								</h:outputFormat>
							</f:facet>
												
							<rich:column>
								<f:facet name="header">
									<h:outputText value="#{msg.select}" />
								</f:facet>
						 
								<h:selectBooleanCheckbox value="#{student.selectedForPayment}">
									<a4j:support event="onclick" reRender="students">
										<a4j:actionparam name="selectedForPmt" value="#{not student.selectedForPayment}"
						 					assignTo="#{student.selectedForPayment}"/>
									</a4j:support>
								</h:selectBooleanCheckbox>
							</rich:column>
							
							<rich:column filterBy="#{student.matricule}" filterEvent="onkeyup"
								sortBy="#{student.matricule}">
								<f:facet name="header">
									<h:outputText value="#{msg.matricule}" />
								</f:facet>
								<h:outputText value="#{student.matricule}" />
							</rich:column>
							<rich:column filterBy="#{student.lastName}" filterEvent="onkeyup"
								sortBy="#{student.lastName}">
								<f:facet name="header">
									<h:outputText value="#{msg.lastName}" />
								</f:facet>
								<h:outputText value="#{student.lastName}" />
							</rich:column>
							<rich:column filterBy="#{student.firstName}" filterEvent="onkeyup"
								sortBy="#{student.firstName}">
								<f:facet name="header">
									<h:outputText value="#{msg.firstName}" />
								</f:facet>
								<h:outputText value="#{student.firstName}" />
							</rich:column>
							<rich:column>
								<f:facet name="header">
									<h:outputText value="#{msg.classe}" />
								</f:facet>
								<h:outputText value="#{student.currentEnrollment.levelClass.name}" />
							</rich:column>			
							<rich:column>
								<f:facet name="header">
									<h:outputText value="#{msg.status}" />
								</f:facet>
								<h:outputText value="#{student.statusText}" />
							</rich:column>
							<rich:column>
								<f:facet name="header">
									<h:outputText value="#{msg.photo}" />
								</f:facet>
														
								<a4j:mediaOutput element="img"
									style="width:60px; height:44px;"
									mimeType="image/gif" createContent="#{parentBean.paintStudent}"
									value="#{parentBean.random}" cacheable="false">
									<f:param name="studentId" value="#{student.id}"/>
									<a4j:support event="onclick" ajaxSingle="true"
										action="#{studentBean.edit}"
										reRender="gestionParent,parentHeaderPannel, parentPanel">
										<f:param name="id" value="#{student.id}"/>
									</a4j:support>
								</a4j:mediaOutput>		
							</rich:column>			
						</rich:dataTable>
					</a4j:outputPanel>
				</a4j:region>
			</a4j:form>
			
			<a4j:form>
				<a4j:commandButton ajaxSingle="true" id="pay"
					action="#{parentBean.initiatePayment}" reRender="placeHolder"
					value="#{msg.makePayment }"
					oncomplete="#{rich:component('parentPaymentPannel')}.show()">
				</a4j:commandButton>
			</a4j:form>
		</td>
		<%
			}
		%>
	</tr>
</table>

<a4j:outputPanel id="placeHolder">
	<rich:modalPanel id="parentPaymentPannel" autosized="true" width="1000">
		<f:facet name="header">
			<h:outputText value="#{msg.makePayment}" />
		</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="parentPaymentHideLink"
					styleClass="hidelink" />
				<rich:componentControl for="parentPaymentPannel" attachTo="parentPaymentHideLink"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
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
				<a4j:outputPanel rendered="#{parentBean.studentWithTuitionToPayCount > 0}">
					<h:panelGrid columns="10">
						<h:outputText value="#{msg.year }"><font color="#FF0000">* </font></h:outputText>
						<rich:comboBox id="parentPaymentSchoolYear" value="#{parentBean.year}"
										suggestionValues="#{schoolYearBean.allSchoolYears}">
						</rich:comboBox>
						
						<h:outputText></h:outputText>
						
						<h:outputText value="#{msg.tuitionType}"><font color="#FF0000">* </font></h:outputText>
						<rich:comboBox id="parentPaymentTuitionTypes"
								suggestionValues="#{tuitionTypeBean.allTuitionTypes}"
								directInputSuggestions="true"
								defaultLabel="#{msg.enterListDefaultValue}"
								value="#{parentBean.tuitionTypeName}" 
								> 
		
						</rich:comboBox>
						
						<a4j:commandButton value="#{msg.search}"
							onclick="buttonClicked = true; "
							action="#{parentBean.getParentTuitionsByTuitionType}" reRender="parentTuitions"/>
					</h:panelGrid>	
				</a4j:outputPanel>
			</a4j:outputPanel>
			<br/>
			
			<a4j:outputPanel id="parentTuitions">
				<rich:dataTable rows="50" value="#{parentBean.parent.studentVOs}"
					var="studentVO" rendered="#{parentBean.parent.studentVOCount > 0}" reRender="ds" 
					rowKeyVar="row" style="overflow: hidden; width: 100%; white-space: nowrap;">
					<f:facet name="header">
						<rich:columnGroup> 
							<rich:column colspan="5">
								<h:outputFormat value="#{msg.listHeader}">
									<f:param value="#{msg.tuition}" />
								</h:outputFormat>
							</rich:column>
							
							<rich:column breakBefore="true" rowspan="2">
							</rich:column>
							
							<rich:column colspan="3">
								<h:outputFormat value=""/>
							</rich:column>
							
							<rich:column rowspan="2">
								<h:outputFormat value="#{msg.remaining}"/>
							</rich:column>
							
							<rich:column breakBefore="true">
								<h:outputFormat value="#{msg.amount}"/>
							</rich:column>
							
							<rich:column >
								<h:outputFormat value="#{msg.paid}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.rebate}"/>
							</rich:column>
							
						</rich:columnGroup>
						
					</f:facet>
					
					<rich:column colspan="5">      
						<a4j:commandLink value="+/-   " reRender="parentTuitions"> 
							<a4j:actionparam name="shown" value="#{not studentVO.showDetails}"
							 assignTo="#{studentVO.showDetails}"/>
						</a4j:commandLink>       
						<h:outputText value="#{msg.matricule}: " />
						<h:outputText value="#{studentVO.matricule}" /> &nbsp; &nbsp; &nbsp;
						<h:outputText value="#{msg.lastName}: " />
						<h:outputText value="#{studentVO.lastName}" /> &nbsp; &nbsp; &nbsp;
						<h:outputText value="#{msg.firstName}: " />
						<h:outputText value="#{studentVO.firstName}" />       
					</rich:column> 
					
					 
					 <rich:subTable rendered="#{studentVO.showDetails}"
					 	onRowMouseOver="this.style.backgroundColor='#F8F8F8'" 
					  	onRowMouseOut="this.style.backgroundColor='#{a4jSkin.tableBackgroundColor}'"  
					  	var="tuition" value="#{studentVO.tuitions}">
					  	
					  	<rich:column breakBefore="true">
					  		<h:outputText value="#{tuition.dueDate}">
								<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
							</h:outputText>
					  	</rich:column>
					  	
						<rich:column>                 
						 	<h:outputText value="#{tuition.amount}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                
						 	<f:facet name="footer">                     
						 		<h:outputText value="#{studentVO.totalAmount}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
						 	</f:facet>             
						 </rich:column>
						 
						 <rich:column>                 
						 	<h:outputText value="#{tuition.paid}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                
						 	<f:facet name="footer">                     
						 		<h:outputText value="#{studentVO.totalPaid}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
						 	</f:facet>             
						 </rich:column>
						 
						 <rich:column>                 
						 	<h:outputText value="#{tuition.rebate}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                
						 	<f:facet name="footer">                     
						 		<h:outputText value="#{studentVO.totalRebate}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
						 	</f:facet>             
						</rich:column>
						 
	 					<rich:column>                 
						 	<h:outputText value="#{tuition.balance}">
								<f:convertNumber pattern="#{configurationBean.moneyFormat}" />
							</h:outputText>                 
						 	<f:facet name="footer">                     
						 		<h:outputText value="#{studentVO.totalBalance}">                         
						 			<f:convertNumber pattern="#{configurationBean.moneyFormat}" />                     
						 		</h:outputText>                 
						 	</f:facet>             
						</rich:column>
					</rich:subTable>
					
					<f:facet name="footer">
						<rich:columnGroup>
							<rich:column>Totals</rich:column>
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
						
			<h:panelGrid columns="2">
			<a4j:outputPanel ajaxRendered="true">
				<a4j:outputPanel rendered="#{parentBean.studentWithTuitionToPayCount>0}">
	
					<h:panelGrid columns="2">				
						<h:outputText value="#{msg.payment}" />
						<h:inputText value="#{parentBean.tuition.amount}" />
	
						<h:outputText value="#{msg.rebate}" />
						<h:inputText value="#{parentBean.tuition.rebate}" />
	
						<h:outputText value="#{msg.comment}" />
						<h:inputTextarea id="commentaire"
							value="#{parentBean.tuition.comment}" rows="2" cols="30">
						</h:inputTextarea>
	
						<a4j:commandButton value="#{msg.save}"
							action="#{parentBean.savePaymentsForStudentsByTuitionType}"
							reRender="parentTuitions,printParentReceipt"
							/>
														
						<h:commandButton id="printParentReceipt" value="#{msg.printReceipt }"
						rendered="#{parentBean.paymentId>0}"
						action="#{parentBean.printReceipt}" />
			
					</h:panelGrid>
				</a4j:outputPanel>
			</a4j:outputPanel>
			</h:panelGrid>
		</a4j:form>
	</rich:modalPanel>
</a4j:outputPanel>