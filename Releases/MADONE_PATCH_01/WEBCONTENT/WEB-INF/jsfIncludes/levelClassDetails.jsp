<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionLevelClass">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.classe}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				
    				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.level}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="level"
							suggestionValues="#{levelBean.allLevels}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{levelClassBean.levelName}" width="300px" /> <font
							color="#FF0000"><rich:message for="level" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.effectif}" /><font color="#FF0000">*</font></td>
						<td><h:inputText
							value="#{levelClassBean.levelClass.nbrStudents}" /></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.capacity}" /><font color="#FF0000">*</font></td>
						<td><h:inputText
							value="#{levelClassBean.levelClass.capacity}" /></td>
					</tr>
					
					<tr>
						<td><h:inputHidden value="#{levelClassBean.levelClass.id}" />
						<h:outputText value="#{msg.name}" /><font color="#FF0000">*</font></td>
						<td><h:inputText id="name2"
							value="#{levelClassBean.levelClass.name}" size="75"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="name2" /></font>
						</td>
					</tr>
					
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.teacher }"/></td>
							<td><rich:comboBox id="teacher"
								value="#{levelClassBean.teacherName}"
								suggestionValues="#{teacherBean.teacherMLF}">
							</rich:comboBox> <font color="#FF0000"><rich:message for="teacher" /></font></td>
						</a4j:region>
					</tr>
								
								

				</table>

				<a4j:commandButton value="#{msg.save}" rendered = "#{ schoolBean.userHasWriteAccess }"
					action="#{levelClassBean.insert}"
					reRender="levelClasses, gestionLevelClass" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{levelClassBean.clear}" reRender="gestionLevelClass" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>