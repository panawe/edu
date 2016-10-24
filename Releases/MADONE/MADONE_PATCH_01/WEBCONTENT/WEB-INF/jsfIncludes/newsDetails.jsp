<a4j:form>
<a4j:region>
	<a4j:outputPanel id="gestionNews">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.news}" />
				</h:outputFormat>
			</f:facet>
			<table>
				<tr>
					<td>
					<table class="table">
						<tr>
							<td><h:inputHidden value="#{newsBean.news.id}" /> <h:outputText
								value="#{msg.title}" /><font color="#FF0000">*</font></td>
							<td><h:inputText id="name1" value="#{newsBean.news.title}"
								size="75" maxlength="100">
								<rich:ajaxValidator event="onblur" />
							</h:inputText></td>
							<td><font color="#FF0000"><rich:message for="name1" /></font>
							</td>
						</tr>
						<tr>
							<td><h:outputText value="#{msg.newsDate}" /><font
								color="#FF0000">*</font></td>
							<td><rich:calendar id="newsDate"
								value="#{newsBean.news.newsDate}" locale="fr" popup="true"
								datePattern="dd/MM/yyyy" showFooter="false"
								showApplyButton="false" cellWidth="24px" cellHeight="22px"
								enableManualInput="true"
								requiredMessage="#{msg.requiredMessage}" required="true"
								converterMessage="#{msg.dateConverter}" style="width:200px">
								<rich:ajaxValidator event="onblur" />
								<f:convertDateTime pattern="dd/MM/yyyy" />
							</rich:calendar></td>
							<td><font color="#FF0000"><rich:message
								for="newsDate" /></font></td>
						</tr>
						<tr>
							<td><h:outputText value="#{msg.author}" /><font
								color="#FF0000">*</font></td>
							<td><h:inputText id="title" value="#{newsBean.news.author}"
								size="75" maxlength="100">
								<rich:ajaxValidator event="onblur" />
							</h:inputText></td>
							<td><font color="#FF0000"><rich:message for="title" /></font>
							</td>
						</tr>
						<tr>
							<td colspan="2"><h:outputText value="#{msg.message}" /><font
								color="#FF0000">*</font><rich:editor id="message"
								value="#{newsBean.news.message}" width="500">
							</rich:editor></td>
							<td><font color="#FF0000"><rich:message for="message" /></font></td>
						</tr>
					</table>
					</td>
					<td>
					<table>
						<a4j:region>
							<tr>
								<td><rich:fileUpload disabled="false"
									fileUploadListener="#{newsBean.listener}"
									maxFilesQuantity="#{newsBean.uploadsAvailable}"
									id="uploadImage" listWidth="250" listHeight="70"
									immediateUpload="#{newsBean.autoUpload}"
									addControlLabel="#{msg.addImage}"
									clearAllControlLabel="#{msg.removeAll }"
									clearControlLabel="#{msg.remove }"
									stopEntryControlLabel="#{msg.stop}"
									uploadControlLabel="#{msg.upload}"
									acceptedTypes="jpg, gif, png, bmp"
									allowFlash="#{newsBean.useFlash}">
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
											rendered="#{empty newsBean.picture}" />
										<a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel"
											rendered="#{not empty newsBean.picture}">
											<h:panelGroup id="schoolLogoGrp">
												<a4j:mediaOutput id="schoolLogoOut" element="img"
													style="width:125px; height:125px;" mimeType="image/gif"
													createContent="#{newsBean.paint}"
													value="#{newsBean.random}" cacheable="false">
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
			<a4j:commandButton value="#{msg.save}" action="#{newsBean.insert}"
				reRender="countries, gestionNews" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}" action="#{newsBean.clear}"
					reRender="gestionNews" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>