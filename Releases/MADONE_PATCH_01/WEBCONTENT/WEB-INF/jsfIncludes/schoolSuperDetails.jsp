<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionSchool">
			<rich:panel
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.school}" />
					</h:outputFormat>
				</f:facet>
				<table cellpadding="20">
					<tr>
						<td valign="top">
						<table class="table">
							<tr>
								<td><h:inputHidden value="#{schoolBean.school.id}" /> <h:outputText
									value="#{msg.name}" /><font color="#FF0000">*</font></td>
								<td><h:inputText id="name"
									value="#{schoolBean.school.name}" size="50" maxlength="50"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText> <font color="#FF0000"><rich:message for="name" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.shortName}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="shortName"
									value="#{schoolBean.school.shortName}" size="20" maxlength="15"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText> <font color="#FF0000"><rich:message for="shortName" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.address}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputTextarea id="address"
									value="#{schoolBean.school.address}" rows="5" cols="50" /></td>
							</tr>

							<!-- Country Suggestion Box -->
							<tr>
								<a4j:region>
									<td><h:outputText value="#{msg.country}" /><font
										color="#FF0000">*</font></td>
									<td><rich:comboBox id="country"
										value="#{schoolBean.countryName}"
										suggestionValues="#{countryBean.allCountries}">
									</rich:comboBox> <font color="#FF0000"><rich:message for="country" /></font></td>
								</a4j:region>
							</tr>


							<!-- City Suggestion Box -->
							<tr>
								<td><h:outputText value="#{msg.city}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="city"
										value="#{schoolBean.school.city}" size="30"
										maxlength="150" onchange="convertToUpperCase(this);">
										<rich:ajaxValidator event="onblur" />
									</h:inputText> <font
									color="#FF0000"><rich:message for="city" /></font></td>
							</tr>

							<!-- City Suggestion Box -->
							<tr>
								<td><h:outputText value="#{msg.email}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="email"
									value="#{schoolBean.school.email}" size="30" maxlength="50">
									<rich:ajaxValidator event="onblur" />
								</h:inputText><font color="#FF0000"><rich:message for="email" /></font></td>
							</tr>


							<tr>
								<td><h:outputText value="#{msg.phone}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="phone"
									value="#{schoolBean.school.phone}" size="20" maxlength="12"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText> <font color="#FF0000"><rich:message for="phone" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.schoolType}" /><font
									color="#FF0000">*</font></td>
								<td><rich:comboBox id="schoolType"
									suggestionValues="#{schoolTypeBean.allSchoolTypes}"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{schoolBean.schoolTypeName}" /> <font color="#FF0000"><rich:message
									for="schoolType" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.schoolReligion}" /><font
									color="#FF0000">*</font></td>
								<td><rich:comboBox id="schoolReligion"
									suggestionValues="#{schoolReligionBean.allSchoolReligions}"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{schoolBean.schoolReligionName}" /> <font
									color="#FF0000"><rich:message for="schoolReligion" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.schoolLevel}" /><font
									color="#FF0000">*</font></td>
								<td><rich:comboBox id="schoolLevel"
									suggestionValues="#{schoolLevelBean.allSchoolLevels}"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{schoolBean.schoolLevelName}" /> <font color="#FF0000"><rich:message
									for="schoolLevel" /></font></td>
							</tr>


							<tr>
								<td><h:outputText value="#{msg.reportHeader}" /></td>
								<td><h:inputTextarea id="reportHeader"
									value="#{schoolBean.school.reportHeader}" rows="5" cols="50">
								</h:inputTextarea></td>
							</tr>
						</table>
						</td>
						<td valign="top">
						<table>
							<tr>
								<td><h:outputText value="#{msg.generateMatricule }" /></td>

								<td><h:selectBooleanCheckbox id="generateMatricule"
									value="#{schoolBean.school.generateMatricule}"
									title="#{msg.generateMatricule}">
								</h:selectBooleanCheckbox></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.showReportHeader }" /></td>

								<td><h:selectBooleanCheckbox id="publishMark"
									value="#{schoolBean.school.showReportHeader}"
									title="#{msg.showReportHeader}">
								</h:selectBooleanCheckbox></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.showDefaultPassword }" /></td>

								<td><h:selectBooleanCheckbox id="showDefaultPassword"
									value="#{schoolBean.school.showDefaultPassword}"
									title="#{msg.showDefaultPassword}">
								</h:selectBooleanCheckbox></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.generateDefaultPassword }" /></td>

								<td><h:selectBooleanCheckbox id="generateDefaultPassword"
									value="#{schoolBean.school.generateRandomPassword}"
									title="#{msg.generateDefaultPassword}">
								</h:selectBooleanCheckbox></td>
							</tr>
							<tr>
								<a4j:region>
									<td><rich:fileUpload disabled="false"
										fileUploadListener="#{schoolBean.listener}"
										maxFilesQuantity="#{schoolBean.uploadsAvailable}"
										id="uploadImage" listWidth="250" listHeight="70"
										immediateUpload="#{schoolBean.autoUpload}"
										addControlLabel="#{msg.loadLogo}"
										clearAllControlLabel="#{msg.removeAll }"
										clearControlLabel="#{msg.remove }"
										stopEntryControlLabel="#{msg.stop}"
										uploadControlLabel="#{msg.upload}"
										acceptedTypes="jpg, gif, png, bmp"
										allowFlash="#{schoolBean.useFlash}">
										<a4j:support event="onuploadcomplete"
											reRender="schoolLogoPanel,schoolLogoGrp,schoolLogoOut" />
										<f:facet name="label">
											<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
										</f:facet>
									</rich:fileUpload></td>

									<td><a4j:outputPanel ajaxRendered="true"
										id="schoolLogoPanel">
										<h:panelGroup id="schoolLogoGrp">
											<a4j:mediaOutput id="schoolLogoOut" element="img"
												mimeType="image/gif" createContent="#{schoolBean.paint}"
												value="#{schoolBean.random}" cacheable="false">
											</a4j:mediaOutput>
										</h:panelGroup>
									</a4j:outputPanel></td>
								</a4j:region>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td><a4j:commandButton value="#{msg.save}"
							rendered="#{ schoolBean.userHasWriteAccess }"
							action="#{schoolBean.createSchool}"
							onclick="buttonClicked = true; "
							reRender="schoolResultPanel,schools, gestionSchool"
							oncomplete="#{rich:component('schoolResultPanel')}.show();" /> <rich:spacer
							width="20" height="10" title="" /> <a4j:commandButton
							value="#{msg.clear}"
							rendered="#{ schoolBean.userHasWriteAccess }"
							action="#{schoolBean.clear}"
							reRender="gestionSchool,schoolLogoPanel" /></td>
					</tr>
				</table>
			</rich:panel>
		</a4j:outputPanel>
		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
	</a4j:region>
</a4j:form>


<rich:modalPanel id="wait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<rich:modalPanel id="schoolResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{schoolBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{schoolBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('schoolResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
