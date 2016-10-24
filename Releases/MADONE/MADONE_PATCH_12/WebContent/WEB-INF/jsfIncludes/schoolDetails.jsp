<a4j:form>
<a4j:region>
	<a4j:outputPanel id="gestionSchool">
		<rich:panel style="overflow: hidden; width: 100%; white-space: nowrap;">
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
								value="#{msg.name}:" /></td>
							<td><h:inputText id="name" value="#{schoolBean.school.name}"
								size="50" maxlength="50" onchange="convertToUpperCase(this);">
								<rich:ajaxValidator event="onblur" />
							</h:inputText> <font color="#FF0000"><rich:message for="name" /></font></td>
						</tr>

						<tr>
							<td><h:outputText
								value="#{msg.shortName}:" /></td>
							<td><h:inputText id="shortname" value="#{schoolBean.school.shortName}"
								size="20" maxlength="15" onchange="convertToUpperCase(this);">
								<rich:ajaxValidator event="onblur" />
							</h:inputText> <font color="#FF0000"><rich:message for="shortname" /></font></td>
						</tr>
						
						<tr>
							<td><h:outputText value="#{msg.address}:" /></td>
							<td><h:inputTextarea id="address"
								value="#{schoolBean.school.address}" rows="5" cols="50" /></td>
						</tr>

						<!-- Country Suggestion Box -->
						<tr>
							<a4j:region>
								<td><h:outputText value="#{msg.country}:" /></td>
								<td><rich:comboBox id="country"
									value="#{schoolBean.countryName}"
									suggestionValues="#{countryBean.allCountries}">
								</rich:comboBox> <font color="#FF0000"><rich:message for="country" /></font></td>
							</a4j:region>
						</tr>


						<!-- City Suggestion Box -->
						<tr>
							<td><h:outputText value="#{msg.city}:" /></td>
							<td><h:inputText id="city"
										value="#{schoolBean.school.city}" size="30"
										maxlength="150" onchange="convertToUpperCase(this);">
										<rich:ajaxValidator event="onblur" />
									</h:inputText> <font
								color="#FF0000"><rich:message for="city" /></font></td>
						</tr>


						<tr>
							<td><h:outputText value="#{msg.phone}" /></td>
							<td><h:inputText id="phone"
								value="#{schoolBean.school.phone}" size="20" maxlength="20"
								onchange="convertToUpperCase(this);">
								<rich:ajaxValidator event="onblur" />
							</h:inputText> <font color="#FF0000"><rich:message for="phone" /></font></td>
						</tr>

						<tr>
							<td><h:outputText value="#{msg.schoolType}:" /></td>
							<td><rich:comboBox id="schoolType"
								suggestionValues="#{schoolTypeBean.allSchoolTypes}"
								directInputSuggestions="true"
								defaultLabel="#{msg.enterListDefaultValue}"
								value="#{schoolBean.schoolTypeName}" /> <font color="#FF0000"><rich:message
								for="schoolType" /></font></td>
						</tr>

						<tr>
							<td><h:outputText value="#{msg.schoolReligion}:" /></td>
							<td><rich:comboBox id="schoolReligion"
								suggestionValues="#{schoolReligionBean.allSchoolReligions}"
								directInputSuggestions="true"
								defaultLabel="#{msg.enterListDefaultValue}"
								value="#{schoolBean.schoolReligionName}" /> <font
								color="#FF0000"><rich:message for="schoolReligion" /></font></td>
						</tr>
						<tr>
							<td><h:outputText value="#{msg.schoolLevel}:" /></td>
							<td><rich:comboBox id="schoolLevel"
								suggestionValues="#{schoolLevelBean.allSchoolLevels}"
								directInputSuggestions="true"
								defaultLabel="#{msg.enterListDefaultValue}"
								value="#{schoolBean.schoolLevelName}" /> <font color="#FF0000"><rich:message
								for="schoolLevel" /></font></td>
						</tr>
						
						<tr>
							<td><h:outputText value="#{msg.baremPrimaire}" /></td>
							<td><h:inputText id="baremP"
								value="#{schoolBean.school.baremPrimaire}" size="20" maxlength="5" >
								<rich:ajaxValidator event="onblur" />
							</h:inputText> <font color="#FF0000"><rich:message for="baremP" /></font></td>
						</tr>

						<tr>
							<td><h:outputText value="#{msg.baremCollege}" /></td>
							<td><h:inputText id="baremC"
								value="#{schoolBean.school.baremCollege}" size="20" maxlength="5" >
								<rich:ajaxValidator event="onblur" />
							</h:inputText> <font color="#FF0000"><rich:message for="baremC" /></font></td>
						</tr>
												
						<tr>
							<td colspan="2"><h:outputText value="#{msg.reportHeader}" />
							<rich:editor value="#{schoolBean.school.reportHeader}"
								plugins="save,paste" width="500">
							</rich:editor></td>
							<td><font color="#FF0000"><rich:message
								for="reportHeader" /></font></td>
						</tr>
						<tr>
							<td colspan="2"><h:outputText value="#{msg.leftReportHeader}" />
							<rich:editor value="#{schoolBean.school.leftReportHeader}"
								plugins="save,paste" width="500">
							</rich:editor></td>
							<td><font color="#FF0000"><rich:message
								for="leftReportHeader" /></font></td>
						</tr>
						<tr>
							<td><h:outputText value="#{msg.director}:" /></td>
							<td><h:inputText id="director"
								value="#{schoolBean.school.director}" size="35" maxlength="100">
							</h:inputText></td>
						</tr>
						<tr>
							<td><h:outputText value="#{msg.inspector}:" /></td>
							<td><h:inputText id="inspector"
								value="#{schoolBean.school.inspector}" size="35" maxlength="100">
							</h:inputText></td>
						</tr>
												<tr>
							<td><h:outputText value="#{msg.slogan}:" /></td>
							<td><h:inputText id="slogan"
								value="#{schoolBean.school.slogan}" size="35" maxlength="250">
							</h:inputText></td>
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
							<td><h:outputText value="#{msg.displayRang }" /></td>

							<td><h:selectBooleanCheckbox id="displayRang"
								value="#{schoolBean.school.displayRang}"
								title="#{msg.displayRang}">
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
									<a4j:support event="onuploadcomplete" reRender="schoolLogoPanel,schoolLogoGrp,schoolLogoOut" />
									<f:facet name="label">
										<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
									</f:facet>
								</rich:fileUpload></td>

								<td><a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel">
									<h:panelGroup id="schoolLogoGrp">
										<a4j:mediaOutput id="schoolLogoOut" element="img"
											mimeType="image/gif" 
											createContent="#{schoolBean.paint}"
											value="#{schoolBean.random}" cacheable="false">
										</a4j:mediaOutput>
									</h:panelGroup>
								</a4j:outputPanel></td>
							</a4j:region>
						</tr>
						
												<tr>
							<a4j:region>
								<td><rich:fileUpload disabled="false"
									fileUploadListener="#{schoolBean.listenerIdCard}"
									maxFilesQuantity="#{schoolBean.uploadsAvailable}"
									id="uploadImage2" listWidth="250" listHeight="70"
									immediateUpload="#{schoolBean.autoUpload}"
									addControlLabel="#{msg.loadIdCard}"
									clearAllControlLabel="#{msg.removeAll }"
									clearControlLabel="#{msg.remove }"
									stopEntryControlLabel="#{msg.stop}"
									uploadControlLabel="#{msg.upload}"
									acceptedTypes="jpg, gif, png, bmp"
									allowFlash="#{schoolBean.useFlash}">
									<a4j:support event="onuploadcomplete" reRender="schoolLogoPanel2,schoolLogoGrp2,schoolLogoOut2" />
									<f:facet name="label">
										<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
									</f:facet>
								</rich:fileUpload></td>

								<td><a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel2">
									<h:panelGroup id="schoolLogoGrp2">
										<a4j:mediaOutput id="schoolLogoOut2" element="img"
											mimeType="image/gif" 
											createContent="#{schoolBean.paintIdCard}"
											value="#{schoolBean.random}" cacheable="false">
										</a4j:mediaOutput>
									</h:panelGroup>
								</a4j:outputPanel></td>
							</a4j:region>
						</tr>
						
												<tr>
							<a4j:region>
								<td><rich:fileUpload disabled="false"
									fileUploadListener="#{schoolBean.listenerReportHdrLeft}"
									maxFilesQuantity="#{schoolBean.uploadsAvailable}"
									id="uploadImage3" listWidth="250" listHeight="70"
									immediateUpload="#{schoolBean.autoUpload}"
									addControlLabel="#{msg.loadReportHdrLeft}"
									clearAllControlLabel="#{msg.removeAll }"
									clearControlLabel="#{msg.remove }"
									stopEntryControlLabel="#{msg.stop}"
									uploadControlLabel="#{msg.upload}"
									acceptedTypes="jpg, gif, png, bmp"
									allowFlash="#{schoolBean.useFlash}">
									<a4j:support event="onuploadcomplete" reRender="schoolLogoPanel3,schoolLogoGrp3,schoolLogoOut3" />
									<f:facet name="label">
										<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
									</f:facet>
								</rich:fileUpload></td>

								<td><a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel3">
									<h:panelGroup id="schoolLogoGrp3">
										<a4j:mediaOutput id="schoolLogoOut3" element="img"
											mimeType="image/gif" 
											createContent="#{schoolBean.paintReportHdrLeft}"
											value="#{schoolBean.random}" cacheable="false">
										</a4j:mediaOutput>
									</h:panelGroup>
								</a4j:outputPanel></td>
							</a4j:region>
						</tr>
						
																		<tr>
							<a4j:region>
								<td><rich:fileUpload disabled="false"
								fileUploadListener="#{schoolBean.listenerReportHdrRight}"
									maxFilesQuantity="#{schoolBean.uploadsAvailable}"
									id="uploadImage4" listWidth="250" listHeight="70"
									immediateUpload="#{schoolBean.autoUpload}"
									addControlLabel="#{msg.loadReportHdrRight}"
									clearAllControlLabel="#{msg.removeAll }"
									clearControlLabel="#{msg.remove }"
									stopEntryControlLabel="#{msg.stop}"
									uploadControlLabel="#{msg.upload}"
									acceptedTypes="jpg, gif, png, bmp"
									allowFlash="#{schoolBean.useFlash}">
									<a4j:support event="onuploadcomplete" reRender="schoolLogoPanel4,schoolLogoGrp4,schoolLogoOut4" />
									<f:facet name="label">
										<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
									</f:facet>
								</rich:fileUpload></td>

								<td><a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel4">
									<h:panelGroup id="schoolLogoGrp4">
										<a4j:mediaOutput id="schoolLogoOut4" element="img"
											mimeType="image/gif" 
											createContent="#{schoolBean.paintReportHdrRight}"
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
					onclick="buttonClicked = true; "
					rendered = "#{ schoolBean.userHasWriteAccess }"
						action="#{schoolBean.insert}" reRender="schoolResultPanel,schools, gestionSchool"
						oncomplete="#{rich:component('schoolResultPanel')}.show();"/></td>
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
			action="#{studentBean.clearMessages}"
			oncomplete="#{rich:component('schoolResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
