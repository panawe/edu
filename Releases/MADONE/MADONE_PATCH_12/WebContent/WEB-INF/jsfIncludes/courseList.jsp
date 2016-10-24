<%if ("school".equals(request.getSession().getAttribute("link"))) {%>
		<rich:panel bodyClass="info" id="levelClassResponsibleTeacherPanel" style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputText value="#{msg.responsibleTeacher }" />
			</f:facet>
			
			<table>
				<tr>
					<td><strong><h:outputText value="#{msg.matricule}:" /> </strong></td>
					<td width="100px"><strong></strong><font color="red"><h:outputText value="#{levelClassBean.levelClass.responsibleTeacher.matricule}" /></font></strong></td>
				
					<td><strong><h:outputText value="#{msg.lastName}:" /> </strong></td>
					<td width="250px"><strong></strong><font color="red"><h:outputText value="#{levelClassBean.levelClass.responsibleTeacher.lastName}" /></font></strong></td>
				
					<td><strong><h:outputText value="#{msg.firstName}:" /> </strong></td>
					<td width="250px"><strong></strong><font color="red"><h:outputText value="#{levelClassBean.levelClass.responsibleTeacher.firstName}" /></font></strong></td>
				</tr>
			</table>
		</rich:panel>
		<br/>
<%} %>

<a4j:form>
	<a4j:commandButton ajaxSingle="true" id="importCourses" value="#{msg.importCoursesFromExcel}"
		action="#{courseBean.initializeCourseImport}" reRender="courseImportFileOutputPanel"
		oncomplete="#{rich:component('courseImportFilePanel')}.show();">
	</a4j:commandButton>
</a4j:form>


<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="courses">
			<rich:dataTable rows="5" value="#{courseBean.courses}" var="course"
				rendered="#{courseBean.rowCount>0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.courses}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{course.className}"
					filterEvent="onkeyup" sortBy="#{course.className}" rendered="#{link != 'school'}">
					<f:facet name="header">
						<h:outputText value="#{msg.levelClass}" />
					</f:facet>
					<h:outputText value="#{course.className}" />
				</rich:column>

				<rich:column filterBy="#{course.subject}" filterEvent="onkeyup"
					sortBy="#{course.subject}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{course.subject}" />
				</rich:column>

				<rich:column filterBy="#{course.teacherLastName}"
					rendered="#{link=='course' || link == 'school' }" filterEvent="onkeyup"
					sortBy="#{course.teacherLastName}">
					<f:facet name="header">
						<h:outputText value="#{msg.teacher}" />
					</f:facet>
					<h:outputText
						value="#{course.teacherLastName} #{course.teacherFirstName} " />
				</rich:column>

				<rich:column filterBy="#{course.beginDate}" filterEvent="onkeyup"
					sortBy="#{course.beginDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.beginDate}" />
					</f:facet>
					<h:outputText value="#{course.beginDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.maxMark}" />
					</f:facet>
					<h:outputText value="#{course.maxMark}">
						<f:convertNumber pattern="#{configurationBean.markFormat}" />
					</h:outputText>
				</rich:column>
				<rich:column rendered="#{link != 'school'}">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{courseBean.edit}" 
						reRender="gestionCourse, teacherCoursePanel,coursePanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{course.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="deleteC"
						action="#{courseBean.delete}"
						rendered="#{link=='course'}"
						reRender="gestionCourse, courses, courseResultPanel"
						oncomplete="#{rich:component('courseResultPanel')}.show();">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{course.id}" />
					</a4j:commandLink>
					
					<a4j:commandLink ajaxSingle="true" id="deleteT"
						action="#{courseBean.deleteTeacherCourse}"
						rendered="#{link=='teacher'}"
						reRender="gestionCourse, courses, courseResultPanel"
						oncomplete="#{rich:component('courseResultPanel')}.show();">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{course.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
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
</a4j:form>

<rich:modalPanel id="courseResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{courseBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{courseBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('courseResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>

<a4j:outputPanel id="courseImportFileOutputPanel">
	<rich:modalPanel id="courseImportFilePanel" rendered="true" height="300">
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
						fileUploadListener="#{courseBean.pieceslistener}"
						maxFilesQuantity="5" id="uploadFiles" listWidth="250"
						listHeight="70" immediateUpload="#{courseBean.autoUpload}"
						addControlLabel="#{msg.importCoursesFromExcel}"
						clearAllControlLabel="#{msg.removeAll }"
						clearControlLabel="#{msg.remove }"
						stopEntryControlLabel="#{msg.stop}"
						uploadControlLabel="#{msg.upload}"
						allowFlash="#{courseBean.useFlash}">
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
									value="#{courseBean.errorMessage}" rows="3" cols="50">
								</h:inputTextarea>
							</font>
						</p>
				
						<p><a4j:commandButton value="#{msg.close }" immediate="true"
							action="#{courseBean.clearMessages}"
							oncomplete="#{rich:component('courseImportFilePanel')}.hide();" /></p>
					</a4j:form>
			    </h:panelGroup>
	</rich:modalPanel>
</a4j:outputPanel>