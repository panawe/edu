<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionSchooling">
			<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
				
				<f:facet name="header">
		        	<h:outputFormat value="#{msg.detailsHeader}">
		        		 <f:param value="#{msg.schooling}"/>
		        	</h:outputFormat>
			    </f:facet>
				<table class="table">
					<!-- Discipline Type Suggestion Box -->
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.type}" /></td>
							<td><rich:comboBox id="eventType"
								value="#{schoolingBean.eventTypeName}"
								defaultLabel="#{msg.enterListDefaultValue}"
								suggestionValues="#{eventTypeBean.allEventTypes}">
	
							</rich:comboBox> <font color="#FF0000"><rich:message for="eventType" /></font></td>
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
	
					<tr>
						<td><h:outputText value="#{msg.date}" /></td>
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
				</table>
	
				<a4j:commandButton value="#{msg.save}"
					action="#{schoolingBean.insertForTeacher}"
					reRender="schoolings, gestionSchooling" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{schoolingBean.clear}" reRender="gestionSchooling" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>