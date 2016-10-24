<a4j:form>
	<a4j:region>

		<a4j:outputPanel id="students">
			<rich:dataTable rows="15" value="#{examBean.students}" var="student"
				rendered="#{examBean.rowCount>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.marks}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{student.matricule}" filterEvent="onkeyup"
					sortBy="#{student.matricule}">
					<f:facet name="header">
						<h:outputText value="#{msg.matricule}" />
					</f:facet>
					<h:outputText value="#{student.matricule}" />
				</rich:column>
				
				<rich:column filterBy="#{student.lastName}" filterEvent="onkeyup"
					sortBy="#{student.lastName}">
					<f:facet name="header">
						<h:outputText value="#{msg.lastName}" />
					</f:facet>
					<h:outputText value="#{student.lastName}" />
				</rich:column>

				<rich:column filterBy="#{student.firstName}" filterEvent="onkeyup"
					sortBy="#{student.firstName}">
					<f:facet name="header">
						<h:outputText value="#{msg.firstName}" />
					</f:facet>
					<h:outputText value="#{student.firstName}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.phone}" />
					</f:facet>
					<h:outputText value="#{student.phone}" />
				</rich:column>

				<rich:column filterBy="#{student.mark}" filterEvent="onkeyup"
					sortBy="#{student.mark}">
					<f:facet name="header">
						<h:outputText value="#{msg.mark}" />
					</f:facet>
					<h:outputText value="#{student.mark}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.maxMarkForEntry}" />
					</f:facet>
					<h:outputText value="#{examBean.exam.maxMark}" />
				</rich:column>

				<rich:column filterBy="#{student.grade}" filterEvent="onkeyup"
					sortBy="#{student.grade}">
					<f:facet name="header">
						<h:outputText value="#{msg.grade}" />
					</f:facet>
					<h:outputText value="#{student.grade}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{msg.approved}"
						rendered="#{student.approvedBy>0 }" />
					<h:outputText value="#{msg.pendingApproval}"
						rendered="#{student.approvedBy==0 }" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{examBean.getStudentAndMark}" reRender="notesPannel"
						rendered="#{student.approvedBy==0 || examBean.exam.course.teacher.user.id==user.id}"
						oncomplete="#{rich:component('notesPannel')}.show()">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="approve"
						rendered="#{student.approvedBy==0 && examBean.exam.course.teacher.user.id==user.id}"
						action="#{examBean.approveMark}"
						reRender="students,examResultApproval"
						oncomplete="#{rich:component('examResultApproval')}.show()">
						<h:graphicImage value="images/approve.gif" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>


					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="approve" value="#{msg.approve}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<rich:messages />
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>

<rich:modalPanel id="examResultApproval" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{examBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{examBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			reRender="notes,students"
			oncomplete="#{rich:component('examResultApproval')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="notesPannel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<h:panelGrid columns="2">

			<a4j:outputPanel ajaxRendered="true">

				<h:panelGrid columns="2">

					<h:outputText value="#{msg.lastName} " />
					<h:outputText value="#{examBean.student.lastName}" />
					<h:outputText value="#{msg.firstName} " />
					<h:outputText value="#{examBean.student.firstName}" />

					<h:outputText value="#{msg.mark}" />
					<h:inputText value="#{examBean.student.mark}" />

				</h:panelGrid>

				<rich:message showSummary="true" showDetail="false" for="couleur" />
			</a4j:outputPanel>

			<a4j:outputPanel ajaxRendered="true">
				<h:panelGroup id="infoImage3">
					<a4j:mediaOutput id="StudentPhoto3" element="img"
						mimeType="image/gif" style="width:100px; height:100px;"
						createContent="#{examBean.paintStudent}"
						value="#{examBean.random}" cacheable="false">
					</a4j:mediaOutput>
				</h:panelGroup>
			</a4j:outputPanel>

			<a4j:commandButton value="#{msg.save}" action="#{examBean.saveNote}"
				reRender="students"
				oncomplete="if (#{facesContext.maximumSeverity==null}) #{rich:component('notesPannel')}.hide();" />
			
			<a4j:commandButton value="#{msg.close}" reRender="students"
				oncomplete="if (#{facesContext.maximumSeverity==null}) #{rich:component('notesPannel')}.hide();" />

		</h:panelGrid>
	</a4j:form>
</rich:modalPanel>



