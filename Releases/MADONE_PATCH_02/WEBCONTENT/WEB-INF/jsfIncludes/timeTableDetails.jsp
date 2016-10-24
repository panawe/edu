<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionTimeTable">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.timeTable}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				
    				<table class="table">
    				
	    				<tr>
	    					<h:inputHidden value="#{timeTableBean.timeTable.id}" />
							<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
							<td><rich:comboBox id="schoolYear"
								value="#{timeTableBean.schoolYearName}"
								suggestionValues="#{schoolYearBean.allSchoolYears}">
							</rich:comboBox></td>
						</tr>
	    				
	    				<tr>
							<td><h:outputText value="#{msg.term }" /><font color="#FF0000"></font></td>
							<td><rich:comboBox id="term"
								value="#{timeTableBean.termName}"
								suggestionValues="#{termBean.allTerms}">
							</rich:comboBox></td>
						</tr>
						
						<tr>
							<a4j:region>
								<td><h:outputText value="#{msg.subject}" /><font color="#FF0000">*</font></td>
								<td><rich:comboBox id="subject"
									value="#{timeTableBean.subjectName}"
									suggestionValues="#{subjectBean.allSubjects}">
								</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>
							</a4j:region>
						</tr>
	
						<tr>
							<a4j:region>
								<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
								<td><rich:comboBox id="levelClass"
									value="#{timeTableBean.levelClassName}"
									suggestionValues="#{levelClassBean.allLevelClasses}">
								</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
							</a4j:region>
						</tr>
	
						<tr>
							<td><h:outputText value="#{msg.dayOfWeek}" /><font color="#FF0000">*</font></td>
							<td><h:selectOneMenu id="dayOfWeek"
								value="#{timeTableBean.timeTable.dayOfWeek}"
								binding="#{timeTableBean.myValue}">
								<f:selectItems value="#{timeTableBean.configurationsByGroupName}" />
								<f:attribute name="groupName" value="DAY_OF_WEEK" />
							</h:selectOneMenu></td>
							<td><font color="#FF0000"><rich:message for="dayOfWeek" /></font>
							</td>
						</tr>
						
						<tr>
							<td><h:outputText value="#{msg.beginTime}" /><font color="#FF0000">*</font></td>
							<td><h:inputText
								value="#{timeTableBean.timeTable.beginTime}" /></td>
						</tr>
	
						<tr>
							<td><h:outputText value="#{msg.endTime}" /><font color="#FF0000">*</font></td>
							<td><h:inputText
								value="#{timeTableBean.timeTable.endTime}" /></td>
						</tr>
	
					</table>

				<a4j:commandButton value="#{msg.save}" rendered = "#{ schoolBean.userHasWriteAccess }"
					action="#{timeTableBean.insert}"
					reRender="timeTables, gestionTimeTable" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{timeTableBean.clear}" reRender="gestionTimeTable" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>