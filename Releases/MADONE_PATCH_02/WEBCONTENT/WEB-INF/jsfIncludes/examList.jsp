<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="exams">
			<rich:dataTable rows="15" value="#{examBean.exams}" var="exam"
				rendered="#{examBean.rowCount>0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.exams}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{exam.name}" filterEvent="onkeyup"
					sortBy="#{exam.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.name}" />
					</f:facet>
					<h:outputText value="#{exam.name}" />
				</rich:column>

				<rich:column filterBy="#{exam.term}" filterEvent="onkeyup"
					sortBy="#{exam.term}">
					<f:facet name="header">
						<h:outputText value="#{msg.term}" />
					</f:facet>
					<h:outputText value="#{exam.term}" />
				</rich:column>

				<rich:column filterBy="#{exam.schoolYear}"
					filterEvent="onkeyup" sortBy="#{exam.schoolYear}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{exam.schoolYear}" />
				</rich:column>

				<rich:column filterBy="#{exam.examType}" filterEvent="onkeyup"
					sortBy="#{exam.examType.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.examType}" />
					</f:facet>
					<h:outputText value="#{exam.examType}" />
				</rich:column>

				<rich:column filterBy="#{exam.course}"
					filterEvent="onkeyup" sortBy="#{exam.course}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{exam.course}" />
				</rich:column>

				<rich:column filterBy="#{exam.className}"
					filterEvent="onkeyup" sortBy="#{exam.className}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{exam.className}" />
				</rich:column>

				<rich:column filterBy="#{exam.examDate}" filterEvent="onkeyup"
					sortBy="#{exam.examDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.examDate}" />
					</f:facet>
					<h:outputText value="#{exam.examDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column width="160">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{examBean.edit}" reRender="examPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{exam.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="importExamMark"
						action="#{examBean.edit}" reRender="examMarkImportPanel"
						oncomplete="#{rich:component('examMarkImportPanel')}.show();">
						<h:graphicImage value="images/import.png" style="border:0" />
						<f:param name="id" value="#{exam.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="importExamMarkFile"
						action="#{examBean.edit}" reRender="examMarkImportFilePanel"
						oncomplete="#{rich:component('examMarkImportFilePanel')}.show();">
						<h:graphicImage value="images/importExcel.jpg" style="border:0" />
						<f:param name="id" value="#{exam.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<h:commandLink id="exportExamMarkFile"
						action="#{examBean.generateCSVReport}">
						<h:graphicImage value="images/exportExcel.jpg" style="border:0" />
						<f:param name="id" value="#{exam.id}" />
					</h:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{examBean.delete}" reRender="gestionExam, exams">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{exam.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
					<rich:toolTip for="importExamMark" value="#{msg.importMarksFromOnlineExam}" />
					<rich:toolTip for="importExamMarkFile" value="#{msg.importMarksFromExcel}" />
					<rich:toolTip for="exportExamMarkFile" value="#{msg.exporttMarksToExcel}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="examMarkImportPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink"
				styleClass="hidelink" />
			<rich:componentControl for="examMarkImportPanel" attachTo="hidelink"
				operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
		<%@include file="/WEB-INF/jsfIncludes/testList.jsp"%>
</rich:modalPanel>


<rich:modalPanel id="examMarkImportFilePanel" rendered="true" height="240">
	<a4j:form>
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<table>
		<a4j:region>
			<tr>
				<td colspan="3"><rich:fileUpload 
				ajaxSingle="true" noDuplicate="true" immediate="true" 
				disabled="false"
					fileUploadListener="#{examBean.pieceslistener}"
					maxFilesQuantity="5" id="uploadFiles" listWidth="250"
					listHeight="70" immediateUpload="#{examBean.autoUpload}"
					addControlLabel="#{msg.importMarks}"
					clearAllControlLabel="#{msg.removeAll }"
					clearControlLabel="#{msg.remove }"
					stopEntryControlLabel="#{msg.stop}"
					uploadControlLabel="#{msg.upload}"
					allowFlash="#{examBean.useFlash}">
					<a4j:support event="onuploadcomplete" reRender="info" />
					<f:facet name="label">
						<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
					</f:facet>
				</rich:fileUpload></td>
			</tr>
			
		</a4j:region>
		</table>
	</a4j:form>
			<h:panelGroup id="info">
	               <f:facet name="header">
					<h:outputText value="#{msg.result}" />
				</f:facet>
				<a4j:form>
					<p>
						<font color="#FF0000"> 
							<h:inputTextarea id="errors"
								value="#{examBean.errorMessage}" rows="3" cols="50">
							</h:inputTextarea>
						</font>
					</p>
			
					<p><a4j:commandButton value="#{msg.close }" immediate="true"
						action="#{examBean.clearMessages}"
						oncomplete="#{rich:component('examMarkImportFilePanel')}.hide();" /></p>
				</a4j:form>
		    </h:panelGroup>
</rich:modalPanel>
