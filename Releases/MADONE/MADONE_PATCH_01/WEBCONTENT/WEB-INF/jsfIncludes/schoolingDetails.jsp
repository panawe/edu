<a4j:form><a4j:region>
	<a4j:outputPanel id="gestionSchooling">
		<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.schooling}"/>
	        	</h:outputFormat>
		    </f:facet>
			<table class="table">
				<tr>
					<td><h:outputText value="#{msg.date}" /><font color="#FF0000">*</font></td>
					<td><rich:calendar id="descriptionDate"
						value="#{schoolingBean.schooling.eventDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						style="width:200px">
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message
						for="schoolingDate" /></font></td>
				</tr>
								<!-- Discipline Type Suggestion Box -->
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.type}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="eventType"
							value="#{schoolingBean.eventTypeName}"
							defaultLabel="#{msg.enterListDefaultValue}"
							suggestionValues="#{eventTypeBean.allEventTypes}">

						</rich:comboBox></td>
						<td><font color="#FF0000"><rich:message for="eventType" /></font></td>
					</a4j:region>
				</tr>
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.term}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="term"
							value="#{schoolingBean.termName}"
							defaultLabel="#{msg.enterListDefaultValue}"
							suggestionValues="#{termBean.allTerms}">

						</rich:comboBox></td>
						<td><font color="#FF0000"><rich:message for="term" /></font></td>
					</a4j:region>
				</tr>				
				<tr>
					<td><h:inputHidden value="#{schoolingBean.schooling.id}" /> <h:outputText
						value="#{msg.description}" /></td>
					<td><h:inputTextarea id="description"
						value="#{schoolingBean.schooling.description}" rows ="5"
						cols="50" >
					</h:inputTextarea></td>
					<td><font color="#FF0000"><rich:message
						for="description" /></font></td>
				</tr>


			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{schoolingBean.insert}"
				rendered="#{schoolingBean.userHasWriteAccess && ((studentBean.student.school.id == user.school.id && link=='student')||(teacherBean.teacher.school.id == user.school.id && link=='teacher'))}"
				reRender="schoolings, gestionSchooling, schoolingResultPanel1" oncomplete="#{rich:component('schoolingResultPanel1')}.show();"/>
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
			rendered="#{(studentBean.student.school.id == user.school.id && link=='student')||(teacherBean.teacher.school.id == user.school.id && link=='teacher')}"
					action="#{schoolingBean.clear}" reRender="gestionSchooling, schoolingResultPanel1" />
			</a4j:region>
			<br/><br/><br/><br/><br/><br/>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region></a4j:form>

<rich:modalPanel id="schoolingResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{schoolingBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{schoolingBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('schoolingResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
