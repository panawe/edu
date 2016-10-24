<a4j:form>
<a4j:region>
	<a4j:outputPanel id="gestionReceivedCorrespondence">
		<rich:panel  style="overflow: hidden; width: 90%; white-space: nowrap;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.correspondence}"/>
	        	</h:outputFormat>
		    </f:facet>
    		<table class="table">
    			<tr>
					<td><h:outputText
						value="#{msg.mailSubject}" /><font color="#FF0000">*</font></td>
					<td><h:inputText id="name" value="#{correspondenceBean.receivedCorrespondence.correspondence.subject}"
						size="60" maxlength="250" >
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
					<td><font color="#FF0000"><rich:message for="name" /></font>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<h:inputHidden
						value="#{correspondenceBean.receivedCorrespondence.id}" />
						<h:inputHidden
						value="#{correspondenceBean.receivedCorrespondence.correspondence.id}" /> <h:outputText
						value="#{msg.message}" /><font color="#FF0000">*</font><rich:editor id="description"
						value="#{correspondenceBean.receivedCorrespondence.correspondence.description}"
						theme="advanced" plugins="save,paste" width="600">

						<f:param name="theme_advanced_buttons1"
							value="bold,italic,underline, cut,copy,paste,pasteword" />

						<f:param name="theme_advanced_toolbar_location" value="top" />

						<f:param name="theme_advanced_toolbar_align" value="left" />
						
					</rich:editor></td>
					<td><font color="#FF0000"><rich:message
						for="description" /></font></td>
				</tr>
				<tr>
					<td colspan="2">
						<h:selectBooleanCheckbox id="sendEmail"
							value="#{correspondenceBean.sendEmail}"
							title="#{msg.sendEmail}">
						</h:selectBooleanCheckbox>
						<h:outputText value="#{msg.sendEmail}" /> 
					</td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}"
				rendered="#{((studentBean.student.school.id == user.school.id && link=='student')||(teacherBean.teacher.school.id == user.school.id && link=='teacher')) && correspondenceBean.userHasWriteAccess}"
				action="#{correspondenceBean.insertStudentCorrespondence}"
				reRender="correspondences, gestionCorrespondence, correspondenceResultPanel, gestionReceivedCorrespondence"
				oncomplete="#{rich:component('correspondenceResultPanel')}.show();" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
				rendered="#{((studentBean.student.school.id == user.school.id && link=='student')||(teacherBean.teacher.school.id == user.school.id && link=='teacher')) && correspondenceBean.userHasWriteAccess}"
					action="#{correspondenceBean.clearStudentCorrespondence}"
					reRender="gestionCorrespondence, gestionReceivedCorrespondence, correspondenceResultPanel" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>

<rich:modalPanel id="correspondenceResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{correspondenceBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{correspondenceBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('correspondenceResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>