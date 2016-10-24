<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionTeacher">
			<rich:panel
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.teacher}" />
					</h:outputFormat>
				</f:facet>
				<table>

					<tr>
						<td>
						<table class="table">

							<tr>
								<td><h:outputText value="#{msg.matricule}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="matricule"
									value="#{teacherBean.teacher.matricule}" size="30"
									disabled="#{user.school.generateMatricule}"
									maxlength="10">
									<rich:ajaxValidator event="onblur" /></h:inputText></td>
								<td><font color="#00FF00"> <h:outputText
										value="#{msg.systemGenerated }"
										rendered="#{user.school.generateMatricule}" /> </font></td>
								<td><font color="#00FF00"><rich:message
									for="matricule" /></font></td>
							</tr>
							<tr>
								<td><h:inputHidden value="#{teacherBean.teacher.id}" /> <h:outputText
									value="#{msg.lastName}" /><font color="#FF0000">*</font></td>
								<td><h:inputText id="lastName"
									value="#{teacherBean.teacher.lastName}" size="30"
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
									value="#{teacherBean.teacher.firstName}" size="30"
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
									value="#{teacherBean.teacher.middleName}" size="30"
									maxlength="50" onchange="convertToUpperCase(this);">
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="middleName" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.nickName}" /></td>
								<td><h:inputText id="nickName"
									value="#{teacherBean.teacher.nickName}" size="30"
									maxlength="50" onchange="convertToUpperCase(this);">
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="nickName" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.birthDate }" /><font
									color="#FF0000">*</font></td>
								<td><rich:calendar id="birthDate"
									value="#{teacherBean.teacher.birthDate}" locale="fr"
									popup="true" datePattern="dd/MM/yyyy" showFooter="false"
									showApplyButton="false" cellWidth="24px" cellHeight="22px"
									enableManualInput="true"
									requiredMessage="#{msg.requiredMessage}" required="true"
									converterMessage="#{msg.dateConverter}" style="width:200px">
									<rich:ajaxValidator event="onblur" />
									<f:convertDateTime pattern="dd/MM/yyyy" />
								</rich:calendar></td>
								<td><font color="#FF0000"><rich:message
									for="birthDate" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.hiredDate }" /><font
									color="#FF0000">*</font></td>
								<td><rich:calendar id="hiredDate"
									value="#{teacherBean.teacher.hiredDate}" locale="fr"
									popup="true" datePattern="dd/MM/yyyy" showFooter="false"
									showApplyButton="false" cellWidth="24px" cellHeight="22px"
									requiredMessage="#{msg.requiredMessage}" required="true"
									style="width:200px">
									<f:convertDateTime pattern="dd/MM/yyyy" />
								</rich:calendar></td>
								<td><font color="#FF0000"><rich:message
									for="hiredDate" /></font></td>
							</tr>
							<!-- Country Suggestion Box -->
							<tr>
								<a4j:region>
									<td><h:outputText value="#{msg.residenceCountry}" /><font
										color="#FF0000">*</font></td>

									<td><rich:comboBox id="country"
										value="#{teacherBean.countryName}"
										defaultLabel="#{msg.enterListDefaultValue}"
										requiredMessage="#{msg.requiredMessage}" required="true"
										suggestionValues="#{countryBean.allCountries}">
									</rich:comboBox> <font color="#FF0000"><rich:message for="country" /></font></td>
								</a4j:region>
							</tr>


							<!-- City Suggestion Box -->
							<tr>
								<a4j:region>
									<td><h:outputText value="#{msg.residenceCity}" /><font
										color="#FF0000">*</font></td>
									<td><h:inputText id="city"
									value="#{teacherBean.teacher.city}" size="30"
									requiredMessage="#{msg.requiredMessage}" required="true"
									maxlength="150" onchange="convertToUpperCase(this);">
								</h:inputText> <font
										color="#FF0000"><rich:message for="city" /></font></td>
								</a4j:region>
							</tr>

							<!-- Birth Country Suggestion Box -->
							<tr>
								<a4j:region>
									<td><h:outputText value="#{msg.birthCountry}" /><font
										color="#FF0000">*</font></td>
									<td><rich:comboBox id="birthCountry"
										value="#{teacherBean.birthCountryName}"
										defaultLabel="#{msg.enterListDefaultValue}"
										requiredMessage="#{msg.requiredMessage}" required="true"
										suggestionValues="#{countryBean.allCountries}">
									</rich:comboBox> <font color="#FF0000"><rich:message for="birthCountry" /></font>
									</td>
								</a4j:region>
							</tr>


							<!-- Birth City Suggestion Box -->
							<tr>
								<td><h:outputText value="#{msg.birthCity}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="birthCity"
									value="#{teacherBean.teacher.birthCity}" size="30"
									requiredMessage="#{msg.requiredMessage}" required="true"
									maxlength="150" onchange="convertToUpperCase(this);">
								</h:inputText> <font
									color="#FF0000"><rich:message for="birthCity" /></font></td>
							</tr>


							<tr>
								<td><h:outputText value="#{msg.address}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="address"
									value="#{teacherBean.teacher.address}" size="50"
									requiredMessage="#{msg.requiredMessage}" required="true"
									maxlength="100" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="address" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.email}" /></td>
								<td><h:inputText id="email"
									value="#{teacherBean.teacher.email}" size="30" maxlength="50"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message for="email" /></font>
								</td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.phone}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="phone"
									value="#{teacherBean.teacher.phone}" size="30" maxlength="20"
									requiredMessage="#{msg.requiredMessage}" required="true"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message for="phone" /></font>
								</td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.cellPhone}" /></td>
								<td><h:inputText id="cellPhone"
									value="#{teacherBean.teacher.cellPhone}" size="30"
									maxlength="20" onchange="convertToUpperCase(this);">
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="cellPhone" /></font></td>
							</tr>
								<tr>
									<td><h:outputText value="#{msg.schoolReligion}" /></td>
									<td><rich:comboBox id="schoolReligion"
										suggestionValues="#{schoolReligionBean.allSchoolReligions}"
										requiredMessage="#{msg.requiredMessage}" required="false"
										directInputSuggestions="true"
										defaultLabel="#{msg.enterListDefaultValue}"
										value="#{teacherBean.religionName}" /> <font color="#FF0000"><rich:message
										for="schoolReligion" /></font></td>
								</tr>

								<tr>
									<td><h:outputText value="#{msg.sex}" /><font
										color="#FF0000">*</font></td>
									<td><h:selectOneMenu id="sexx"
										value="#{teacherBean.teacher.sex}"
										requiredMessage="#{msg.requiredMessage}" required="true">
										<f:selectItem itemValue="M" itemLabel="#{msg.masculin }" />
										<f:selectItem itemValue="F" itemLabel="#{msg.feminin }" />
									</h:selectOneMenu><font color="#FF0000"><rich:message for="sex" /></font></td>
								</tr>

						<br/>

								<tr>
									<td><h:outputText value="#{msg.medicalInfoList}" /></td>
									<td><h:inputTextarea id="reportHeader111"
										value="#{teacherBean.teacher.allergy}" rows="3" cols="50">
									</h:inputTextarea></td>
									<td><font color="#FF0000"><rich:message
										for="allergy" /></font></td>
								</tr>

							<tr>
								<td><h:outputText value="#{msg.quickResume}" /></td>
								<td>	<h:inputTextarea id="reportHeader22"
									value="#{teacherBean.teacher.resume}" rows="6" cols="50">
								</h:inputTextarea></td>
								<td><font color="#FF0000"><rich:message
									for="comments" /></font></td>
							</tr>

						</table>
						</td>

						<td valign="top">
						<table>
							<a4j:region>
								<tr>
									<td><rich:fileUpload disabled="false"
										fileUploadListener="#{teacherBean.listener}"
										maxFilesQuantity="#{teacherBean.uploadsAvailable}"
										id="uploadImage" listWidth="250" listHeight="70"
										immediateUpload="#{teacherBean.autoUpload}"
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
												rendered="#{empty teacherBean.picture}" />
											<a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel"
												rendered="#{not empty teacherBean.picture}">
												<h:panelGroup id="schoolLogoGrp">
													<a4j:mediaOutput id="schoolLogoOut" element="img"
													style="width:220px; height:190px;"
														mimeType="image/gif" createContent="#{teacherBean.paint}"
														value="#{teacherBean.random}" cacheable="false">
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
				<a4j:commandButton rendered="#{(empty (teacherBean.teacher.school.id) || (not empty (teacherBean.teacher.school.id) && teacherBean.teacher.school.id== user.school.id)) && teacherBean.userHasWriteAccess}"
					value="#{msg.save}" action="#{teacherBean.insert}"
					onclick="buttonClicked = true; "
					reRender="teachers, gestionTeacher, actionResultPanel1, teacherPanel, teacherHeaderPannel"
					oncomplete="#{rich:component('actionResultPanel1')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						rendered="#{(empty (teacherBean.teacher.school.id) || (not empty (teacherBean.teacher.school.id) && teacherBean.teacher.school.id== user.school.id)) && teacherBean.userHasWriteAccess}"
						action="#{teacherBean.clear}"
						reRender="gestionTeacher, teacherPanel, teacherHeaderPannel" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
		
						<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait1')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait1')}.hide()" />
			
	</a4j:region>
</a4j:form>


<rich:modalPanel id="wait1" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<rich:modalPanel id="actionResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{teacherBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{teacherBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			action="#{studentBean.clearMessages}"
			oncomplete="#{rich:component('actionResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>