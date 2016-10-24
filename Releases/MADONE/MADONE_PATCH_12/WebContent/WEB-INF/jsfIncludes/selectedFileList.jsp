
	<a4j:region>
		<a4j:outputPanel id="selectedFiles">
			<h:outputText value="No file found." rendered="#{assignmentFileBean.selectedFileRowCount == 0}" />
			<rich:dataTable rows="10" value="#{assignmentFileBean.addedFiles}"
				var="assignmentFile" rendered="#{assignmentFileBean.selectedFileRowCount > 0}"
				reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.selectedFile}" />
					</h:outputFormat>
				</f:facet>

				<rich:column width="10" filterBy="#{assignmentFile.createDate}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.createDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.uploadDate}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.createDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column width="10" filterBy="#{assignmentFile.name}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.fileName}" />
					</f:facet>
					<h:commandLink action="#{assignmentFileBean.openFileByName(assignmentFile.name)}">
						<h:outputText value="#{assignmentFile.name}" />
					</h:commandLink>
				</rich:column>
				<rich:column width="10" style="white-space:normal;">
					<f:facet name="header">
						<h:outputText value="#{msg.fileType}" />
					</f:facet>
					<h:commandLink action="#{assignmentFileBean.openFile}">
						<h:graphicImage value="#{assignmentFile.fileTypeImagePath}" width="20"
							height="20" />
						<f:param name="id" value="#{assignmentFile.id}" />
					</h:commandLink>
				</rich:column>
				<rich:column width="10" filterBy="#{assignmentFile.description}"
					style="white-space:normal;" filterEvent="onkeyup"
					sortBy="#{assignmentFile.description}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{assignmentFile.description}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{assignmentFileBean.removeSelectedFile(assignmentFile.name)}"
						reRender="selectedFiles">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						
					</a4j:commandLink>

					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />

			<br />
		</a4j:outputPanel>
	</a4j:region>
