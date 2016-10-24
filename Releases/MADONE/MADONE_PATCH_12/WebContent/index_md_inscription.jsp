<%@include file="madone/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear"><a4j:form>
		<a4j:region>
			<rich:panel rendered="#{!empty studentBean.student.matricule }">
				<a4j:commandLink ajaxSingle="true" id="disconnect22"
					rendered="#{!empty studentBean.student.matricule }"
					onclick="document.location.href = 'logout'"
					reRender="tempStudentPanel" value="#{msg.signout}">
				</a4j:commandLink>
			</rich:panel>

				<rich:panel id="decision" 
					rendered="#{!empty studentBean.student.matricule }">
					<strong> <br />
					<h:outputText value="#{studentBean.student.statusText}"
						rendered="#{studentBean.student.status==2 }" /> <font
						color="green"> <h:outputText
						value="#{studentBean.student.statusText}"
						rendered="#{studentBean.student.status==4 }" /> </font> <font
						color="red"> <h:outputText
						value="#{studentBean.student.statusText}"
						rendered="#{studentBean.student.status==3 }" /> </font> <br />
					<br />
					<h:outputText value="#{studentBean.student.decision }" /> </strong>
				</rich:panel>

				<rich:panel id="files" >
					<table width="100%" border="0">
						<tr>
							<td valign="top"><rich:panel header="#{msg.identity }"
								id="identite">
								<table class="table">

									<tr>
										<td><h:outputText value="#{msg.school}" /><font
											color="#FF0000">*</font></td>
										<td><rich:comboBox id="school"
											value="#{studentBean.schoolName}"
											suggestionValues="#{schoolBean.allSchools}"
											requiredMessage="#{msg.requiredMessage}" required="true">
										</rich:comboBox></td>
										<td><font color="#FF0000"><rich:message
											for="birthCity" /></font></td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.level}" /><font
											color="#FF0000">*</font></td>
										<td><rich:comboBox id="level"
											suggestionValues="#{levelBean.allLevels}"
											directInputSuggestions="true"
											requiredMessage="#{msg.requiredMessage}" required="true"
											defaultLabel="#{msg.enterListDefaultValue}"
											value="#{studentBean.levelName}" /></td>

										<td><font color="#FF0000"><rich:message
											for="level" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.lastName}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="lastName"
											value="#{studentBean.student.lastName}" size="30"
											requiredMessage="#{msg.requiredMessage}" required="true"
											maxlength="50" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="lastName" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.firstName}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="firstName"
											value="#{studentBean.student.firstName}" size="30"
											requiredMessage="#{msg.requiredMessage}" required="true"
											maxlength="50" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="firstName" /></font></td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.middleName}" /></td>
										<td><h:inputText id="middleName"
											value="#{studentBean.student.middleName}" size="30"
											maxlength="50" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="middleName" /></font></td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.nickName}" /></td>
										<td><h:inputText id="nickName"
											value="#{studentBean.student.nickName}" size="30"
											maxlength="50" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="nickName" /></font></td>
									</tr>

									<!-- Country Suggestion Box -->
									<tr>
										<a4j:region>
											<td><h:outputText value="#{msg.residenceCountry}" /><font
												color="#FF0000">*</font></td>
											<td><rich:comboBox id="country"
												value="#{studentBean.countryName}"
												defaultLabel="#{msg.enterListDefaultValue}"
												suggestionValues="#{countryBean.allCountries}"
												requiredMessage="#{msg.requiredMessage}" required="true">
											</rich:comboBox></td>
											<td><font color="#FF0000"><rich:message
												for="country" /></font></td>
										</a4j:region>
									</tr>


									<!-- City Suggestion Box -->
									<tr>
										<td><h:outputText value="#{msg.residenceCity}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="city"
											value="#{studentBean.student.city}" size="30" maxlength="150"
											onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message for="city" /></font>
										</td>
									</tr>

									<!-- Birth Country Suggestion Box -->
									<tr>
										<a4j:region>
											<td><h:outputText value="#{msg.birthCountry}" /><font
												color="#FF0000">*</font></td>
											<td><rich:comboBox id="birthCountry"
												value="#{studentBean.birthCountryName}"
												requiredMessage="#{msg.requiredMessage}" required="true"
												defaultLabel="#{msg.enterListDefaultValue}"
												suggestionValues="#{countryBean.allCountries}">
											</rich:comboBox></td>
											<td><font color="#FF0000"><rich:message
												for="birthCountry" /></font></td>
										</a4j:region>
									</tr>


									<!-- Birth City Suggestion Box -->
									<tr>
										<td><h:outputText value="#{msg.birthCity}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="birthCity"
											value="#{studentBean.student.birthCity}" size="30"
											requiredMessage="#{msg.requiredMessage}" required="true"
											maxlength="150" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="birthCity" /></font></td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.birthDate }" /><font
											color="#FF0000">*</font></td>
										<td><rich:calendar id="birthDate"
											value="#{studentBean.student.birthDate}" locale="fr"
											popup="true" datePattern="dd/MM/yyyy" showFooter="false"
											requiredMessage="#{msg.requiredMessage}" required="true"
											showApplyButton="false" cellWidth="24px" cellHeight="22px"
											style="width:200px, border-color : blue;">
											<f:convertDateTime pattern="dd/MM/yyyy" />
										</rich:calendar></td>
										<td><font color="#FF0000"><rich:message
											for="birthDate" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.address}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="address"
											value="#{studentBean.student.address}" size="50"
											requiredMessage="#{msg.requiredMessage}" required="true"
											maxlength="100" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="address" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.email}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="email"
											value="#{studentBean.student.email}" size="30" maxlength="50"
											requiredMessage="#{msg.requiredMessage}" required="true"
											onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="email" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.phone}" /><font
											color="#FF0000">*</font></td>
										<td><h:inputText id="phone"
											value="#{studentBean.student.phone}" size="30" maxlength="20"
											requiredMessage="#{msg.requiredMessage}" required="true"
											onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="phone" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.cellPhone}" /></td>
										<td><h:inputText id="cellPhone"
											value="#{studentBean.student.cellPhone}" size="30"
											maxlength="20" onchange="convertToUpperCase(this);">
											<rich:ajaxValidator event="onblur" />
										</h:inputText></td>
										<td><font color="#FF0000"><rich:message
											for="cellPhone" /></font></td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.schoolReligion}" /><font
											color="#FF0000">*</font></td>
										<td><rich:comboBox id="schoolReligion"
											suggestionValues="#{schoolReligionBean.allSchoolReligions}"
											directInputSuggestions="true"
											requiredMessage="#{msg.requiredMessage}" required="true"
											defaultLabel="#{msg.enterListDefaultValue}"
											value="#{studentBean.religionName}" /> <font color="#FF0000"><rich:message
											for="schoolReligion" /></font></td>
									</tr>

									<tr>
										<td><h:outputText value="#{msg.sex}" /><font
											color="#FF0000">*</font></td>
										<td><h:selectOneMenu id="sexx"
											value="#{studentBean.student.sex}">
											<f:selectItem itemValue="M" itemLabel="#{msg.masculin }" />
											<f:selectItem itemValue="F" itemLabel="#{msg.feminin }" />
										</h:selectOneMenu><font color="#FF0000"><rich:message for="sex" /></font></td>
									</tr>
								</table>
							</rich:panel></td>
							<td valign="top">

							<rich:panel header="#{msg.medicalInfo}" id="medicalInfo">
								<table>
									<tr>
										<td><h:outputText value="#{msg.medicalInfoList}" /></td>
										<td><h:inputTextarea id="reportHeader11"
											value="#{studentBean.student.allergy}" rows="3" cols="50">
										</h:inputTextarea></td>
										<td><font color="#FF0000"><rich:message
											for="allergy" /></font></td>
									</tr>
								</table>
							</rich:panel> <rich:panel header="#{msg.pieces}" id="StudentFiles">
								<table>
									<a4j:region>
										<tr>
											<td colspan="3"><rich:fileUpload disabled="false"
												fileUploadListener="#{studentBean.pieceslistener}"
												maxFilesQuantity="5" id="uploadFiles" listWidth="250"
												listHeight="70" immediateUpload="#{studentBean.autoUpload}"
												addControlLabel="#{msg.addPiece}"
												clearAllControlLabel="#{msg.removeAll }"
												clearControlLabel="#{msg.remove }"
												stopEntryControlLabel="#{msg.stop}"
												uploadControlLabel="#{msg.upload}"
												acceptedTypes="jpg, gif, png, bmp"
												allowFlash="#{studentBean.useFlash}">
												<a4j:support event="onuploadcomplete" />
												<f:facet name="label">
													<h:outputText
														value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
												</f:facet>
											</rich:fileUpload></td>

											<td valign="middle"><a4j:commandLink ajaxSingle="true"
												id="studentFiles" action="#{studentBean.viewFiles}"
												rendered="#{not empty studentBean.studentfiles}"
												oncomplete="#{rich:component('studentFiles')}.show();">
												<h:graphicImage value="images/file.png" style="border:0" />
											</a4j:commandLink> <rich:toolTip for="studentFiles" value="#{msg.viewFiles}" />
											</td>
										</tr>


									</a4j:region>
								</table>
							</rich:panel>
							
							<rich:panel header="#{msg.photo}"
								id="StudentPhoto">
								<table>
									<a4j:region>
										<tr>
											<td colspan="3"><rich:fileUpload disabled="false"
												fileUploadListener="#{studentBean.listener}"
												maxFilesQuantity="#{studentBean.uploadsAvailable}"
												id="uploadImage" listWidth="250" listHeight="70"
												immediateUpload="#{studentBean.autoUpload}"
												addControlLabel="#{msg.addImage}"
												clearAllControlLabel="#{msg.removeAll }"
												clearControlLabel="#{msg.remove }"
												stopEntryControlLabel="#{msg.stop}"
												uploadControlLabel="#{msg.upload}"
												acceptedTypes="jpg, gif, png, bmp"
												allowFlash="#{studentBean.useFlash}">
												<a4j:support event="onuploadcomplete" reRender="infoImage" />
												<f:facet name="label">
													<h:outputText
														value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
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
														rendered="#{empty studentBean.picture}" />
													<a4j:outputPanel ajaxRendered="true" id="studentPhotoPanel"
														rendered="#{not empty studentBean.picture}">
														<h:panelGroup id="studentPanelGrp">
															<a4j:mediaOutput id="studentMediaOut" element="img"
																mimeType="image/gif" style="width:100px; height:100px;"
																createContent="#{studentBean.paint}"
																value="#{studentBean.random}" cacheable="false">
															</a4j:mediaOutput>
														</h:panelGroup>
													</a4j:outputPanel>
												</rich:panel>
											</h:panelGroup></td>

										</tr>
									</a4j:region>
								</table>
							</rich:panel>
							</td>
						</tr>
						<tr>
							<td valign="top"><!-- Tutor Information --> 
							
							<!-- Others information --> <rich:panel header="#{msg.others}"
								id="otherInfo">
								<table>
									<tr>
										<td><h:outputText value="#{msg.comments}" /></td>
										<td><h:inputTextarea id="reportHeader"
											value="#{studentBean.student.comments}" rows="3" cols="50">
										</h:inputTextarea></td>
										<td><font color="#FF0000"><rich:message
											for="comments" /></font></td>
									</tr>
								</table>
							</rich:panel></td>
							<td valign="top"></td>
						</tr>
						<tr>
							<td valign="top"><a4j:commandButton
								onclick="buttonClicked = true; " value="#{msg.saveSendDemand}"
								action="#{studentBean.insert}"
								rendered="#{studentBean.student.status==2 ||studentBean.student.status==3|| empty studentBean.student.matricule}"
								reRender="actionResultPanel1,identite,parents,medicalInfo,otherInfo,StudentPhoto,tutor,infoImage"
								oncomplete="#{rich:component('actionResultPanel1')}.show();" />

							</td>
						</tr>


					</table>
				</rich:panel>
			 
			<a4j:status
				onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
				onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
		</a4j:region>
	</a4j:form> <rich:modalPanel id="wait" autosized="true" width="200" height="120"
		moveable="false" resizeable="false">
		<f:facet name="header">
			<h:outputText value="#{msg.operationInProgress }" />
		</f:facet>
		<h:outputText value="#{msg.oneMomentPlease }" />
	</rich:modalPanel> <rich:modalPanel id="actionResultPanel1" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<a4j:form>
			<p><font color="#FF0000"> <error> <h:outputText
				value="#{studentBean.errorMessage}" /> </error> </font> <font color="#3f3f3f">
			<success> <h:outputText escape="false"
				value="#{studentBean.successMessage}" /> </success> </font></p>

			<p><a4j:commandButton value="#{msg.close }" immediate="true"
				action="#{studentBean.clearMessages}"
				oncomplete="#{rich:component('actionResultPanel1')}.hide();" /></p>
		</a4j:form>
	</rich:modalPanel> <rich:modalPanel id="studentFiles" autosized="true" width="450">
		<f:facet name="header">
			<h:outputText value="#{msg.viewFiles}" />
		</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink11"
					styleClass="hidelink" />
				<rich:componentControl for="studentFiles" attachTo="hidelink11"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<a4j:region>
				<a4j:outputPanel id="viewFiles1">

					<rich:dataTable rows="5" value="#{studentBean.studentfiles}"
						var="file" rendered="#{not empty studentBean.studentfiles}"
						reRender="ds1" rowKeyVar="row" id="viewFilesTable"
						style="overflow: hidden; width: 100%; white-space: nowrap;">
						<f:facet name="header">
							<h:outputText value="#{msg.viewFiles}" />
						</f:facet>

						<rich:column>
							<f:facet name="header">
								<h:outputText value="#{msg.name}" />
							</f:facet>
							<h:outputText escape="false" value="#{file.name}">
							</h:outputText>
						</rich:column>

						<rich:column>
							<f:facet name="header">
								<h:outputText value="#{msg.actions}" />
							</f:facet>
							<a4j:commandLink ajaxSingle="true" id="viewFile11"
								oncomplete="#{rich:component('studentFile')}.show();"
								action="#{studentBean.viewFile}" reRender="studentFile,viewFile">
								<h:graphicImage value="images/edit.gif" style="border:0" />
								<f:param name="fileId" value="#{file.id}" />
							</a4j:commandLink>
							<rich:spacer width="40" height="10" title="" />
							<a4j:commandLink ajaxSingle="true" id="deleteFile"
								action="#{studentBean.deleteFile}"
								reRender="viewFiles1,viewFilesTable">
								<h:graphicImage value="/images/delete.gif" style="border:0" />
								<f:param name="fileId" value="#{file.id}" />
							</a4j:commandLink>
						</rich:column>
						<f:facet name="footer">
							<rich:datascroller id="ds1"></rich:datascroller>
						</f:facet>
					</rich:dataTable>

				</a4j:outputPanel>

			</a4j:region>
		</a4j:form>
	</rich:modalPanel> <rich:modalPanel id="studentFile" autosized="false" left="1" top="1"
		width="850" height="650">
		<f:facet name="header">
			<h:outputText value="#{msg.viewFiles}" />
		</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink22"
					styleClass="hidelink" />
				<rich:componentControl for="studentFile" attachTo="hidelink22"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<div style="width: 100%; height: 100%; overflow: auto;"><a4j:form>
			<a4j:region>
				<a4j:outputPanel id="viewFile">
					<a4j:mediaOutput id="OneFile" element="img" mimeType="image/gif"
						createContent="#{studentBean.paintFile}"
						style="width:800px; height:600px;" value="#{studentBean.random}"
						cacheable="false">
					</a4j:mediaOutput>
				</a4j:outputPanel>
			</a4j:region>
		</a4j:form></div>
	</rich:modalPanel> <!-- ####################################################################################################### -->
	</div>
	</div>
	</div>
	<!-- ####################################################################################################### -->

</f:view>
<%@include file="madone/includes/footer.jsp"%>