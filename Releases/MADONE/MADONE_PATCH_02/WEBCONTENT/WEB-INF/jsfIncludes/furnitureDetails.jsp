<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionFurniture">
			<rich:panel id="furniturePanel"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.furniture}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				
    				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.schoolYear}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="schoolYear"
							suggestionValues="#{schoolYearBean.allSchoolYears}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{furnitureBean.schoolYearName}" width="300px" /> <font
							color="#FF0000"><rich:message for="schoolYear" /></font></td>
					</tr>
					
					<tr>
						<td><h:outputText value="#{msg.level}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="level"
							suggestionValues="#{levelBean.allLevels}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{furnitureBean.levelName}" width="300px" /> <font
							color="#FF0000"><rich:message for="level" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.subject}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="subject"
							suggestionValues="#{subjectBean.allSubjects}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{furnitureBean.subjectName}" width="300px" /> <font
							color="#FF0000"><rich:message for="subject" /></font></td>
					</tr>

					<tr>
						<td colspan="2"><h:outputText
							value="#{msg.description}" /><rich:editor
							value="#{furnitureBean.furniture.description}" plugins="save,paste" width="700">
						</rich:editor></td>
						<td><font color="#FF0000"><rich:message for="objective" /></font></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}" rendered = "#{ furnitureBean.userHasWriteAccess && link == 'school'}"
					action="#{furnitureBean.insert}"
					reRender="furnitures, gestionFurniture" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{furnitureBean.clear}" reRender="gestionFurniture" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>