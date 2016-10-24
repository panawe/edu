<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionProduct">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.product}" />
					</h:outputFormat>
				</f:facet>

				<table cellpadding="10">

					<tr>
						<td valign="top">
						<table class="table">
							<tr>
								<td><h:inputHidden value="#{productBean.product.id}" /> <h:outputText
									value="#{msg.productCode}" /><font color="#FF0000">*</font></td>
								<td><h:inputText id="productCode"
									value="#{productBean.product.productCode}" size="30"
									maxlength="50" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="productCode" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.name}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="productName"
									value="#{productBean.product.name}" size="30" maxlength="75"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="productName" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.author}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="productAuthor"
									value="#{productBean.product.author}" size="30" maxlength="75"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="productAuthor" /></font></td>
							</tr>
							
							<tr>
								<td><h:outputText value="#{msg.category}" /><font
									color="#FF0000">*</font></td>
								<td><rich:comboBox id="category"
									suggestionValues="#{categoryBean.allCategories}"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{productBean.categoryName}" /> <font color="#FF0000"><rich:message
									for="category" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.brand}" /><font
									color="#FF0000">*</font></td>
								<td><rich:comboBox id="brand"
									suggestionValues="#{brandBean.allBrands}"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{productBean.brandName}" /> <font color="#FF0000"><rich:message
									for="brand" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.isbn}" /></td>
								<td><h:inputText id="isbn"
									value="#{productBean.product.isbn}" size="30" maxlength="50"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message for="isbn" /></font>
								</td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.barCode}" /></td>
								<td><h:inputText id="barCode"
									value="#{productBean.product.barCode}" size="30" maxlength="50"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="barCode" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.quantity}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="quantity"
									value="#{productBean.product.quantity}" size="30" maxlength="9"
									onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="quantityInStock" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.quantityInStock}" /><font
									color="#FF0000">*</font></td>
								<td><h:inputText id="quantityInStock"
									value="#{productBean.product.quantityInStock}" size="30"
									maxlength="9" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="quantityInStock" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.minimumQuantityToOrder}" />
								</td>
								<td><h:inputText id="minimumQuantityToOrder"
									value="#{productBean.product.minimumQuantityToOrder}" size="30"
									maxlength="9" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message
									for="minimumQuantityToOrder" /></font></td>
							</tr>
						</table>
						</td>
						<td valign="top"><a4j:region>
							<table>
								<tr>
									<td><rich:fileUpload disabled="false"
										fileUploadListener="#{productBean.listener}"
										maxFilesQuantity="#{productBean.uploadsAvailable}"
										id="uploadImage" listWidth="250" listHeight="70"
										immediateUpload="#{productBean.autoUpload}"
										addControlLabel="#{msg.addImage}"
										clearAllControlLabel="#{msg.removeAll }"
										clearControlLabel="#{msg.remove }"
										stopEntryControlLabel="#{msg.stop}"
										uploadControlLabel="#{msg.upload}"
										acceptedTypes="jpg, gif, png, bmp"
										allowFlash="#{productBean.useFlash}">
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
												rendered="#{empty productBean.picture}" />
											<a4j:outputPanel ajaxRendered="true" id="schoolLogoPanel"
												rendered="#{not empty productBean.picture}">
												<h:panelGroup id="productPicGroup">
													<a4j:mediaOutput id="productPicMedia" element="img"
														mimeType="image/gif" createContent="#{productBean.paint}"
														value="#{productBean.random}" cacheable="false">
													</a4j:mediaOutput>
												</h:panelGroup>
											</a4j:outputPanel>
										</rich:panel>
									</h:panelGroup></td>

								</tr>
							</table>
						</a4j:region></td>

					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}"
					rendered="#{ productBean.userHasWriteAccess }"
					action="#{productBean.insert}"
					reRender="products, gestionProduct,productResultPanel1"
					oncomplete="#{rich:component('productResultPanel1')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{productBean.clear}" reRender="gestionProduct" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="productResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{productBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{productBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('productResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
