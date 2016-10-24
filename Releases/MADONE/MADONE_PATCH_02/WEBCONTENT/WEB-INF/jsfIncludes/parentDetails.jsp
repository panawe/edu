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
								<a4j:region>
									<td><h:outputText value="#{msg.country}" /><font
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
			
							<rich:column filterBy="#{student.matricule}" filterEvent="onkeyup"
								sortBy="#{student.matricule}">
								<f:facet name="header">
									<h:outputText value="#{msg.matricule}" />
								</f:facet>
							<a4j:commandLink ajaxSingle="true" id="viewAllStudentDetails"
								action="#{studentBean.edit}"
								reRender="gestionParent,parentHeaderPannel, parentPanel" value="#{student.matricule}">
								<f:param name="id" value="#{student.id}"/>
							</a4j:commandLink>
								 
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
		</td>
	</tr>
</table>