<style type="text/css">
	a.button {
	    display: inline-block;
	    background: lightblue;
	    border: 2px outset lightgray;
	    cursor: default;
	}
	a.button:active {
	    border-style: inset;
	}
</style>


<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="assignmentFileDetails">
			<rich:panel  style="overflow: hidden; width: 100%; white-space: nowrap;" >
				<f:facet name="header">
		        	<h:outputFormat value="#{msg.detailsHeader}">
		        		 <f:param value="#{msg.document}"/>
		        	</h:outputFormat>
			    </f:facet>
				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.description}" /><font color="#FF0000"></font></td>
						<td>
							<h:inputTextarea id="assignmentFileDetailsDescription"
								value="#{assignmentFileBean.assignmentFile.description}" cols="51"
								requiredMessage="#{msg.requiredMessage}" rows="5">
							</h:inputTextarea>
						</td>
						<td><font color="#FF0000"><rich:message for="assignmentFileDetailsDescription" /></font></td>
					</tr>	
					<tr>
						<td><h:outputText value="#{msg.document}" /><font color="#FF0000">*</font></td>
						<td>
							<rich:fileUpload disabled="false"
								fileUploadListener="#{assignmentFileBean.pieceslistener}"
								maxFilesQuantity="#{assignmentFileBean.uploadsAvailable}"
								id="uploadImage" listWidth="250" listHeight="70"
								immediateUpload="#{assignmentFileBean.autoUpload}"
								addControlLabel="#{msg.addDoc}"
								clearAllControlLabel="#{msg.removeAll }"
								clearControlLabel="#{msg.remove }"
								stopEntryControlLabel="#{msg.stop}"
								uploadControlLabel="#{msg.upload}"
								acceptedTypes=""
								allowFlash="#{assignmentFileBean.useFlash}">
								<a4j:support event="onuploadcomplete" />
								<f:facet name="label">
									<h:outputText
										value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
								</f:facet>
							</rich:fileUpload>	
						</td>	
					</tr>
				</table>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="assignmentFileResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{assignmentFileBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{assignmentFileBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('assignmentFileResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
