<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionCurriculum" rendered="#{curriculumBean.curriculum.id > 0}">
			<rich:panel id="CurriPanel"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.curriculum}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>
				
    				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.schoolYear}" />:</td>
						<td><h:outputText id="schoolYear" value="#{curriculumBean.curriculum.schoolYear.year}"/></font></td>
					</tr>
					
					<tr>
						<td><h:outputText value="#{msg.level}" />:</td>
						<td><h:outputText id="level" value="#{curriculumBean.curriculum.level.name}"/></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.subject}" />:</td>
						<td><h:outputText id="subject" value="#{curriculumBean.curriculum.subject.name}"/></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.weekStartDate}" />:</td>
						<td><h:outputText id="weekStartDate" value="#{curriculumBean.curriculum.weekStartDate}"/></font></td>
					</tr>
								
					<tr>
						<td><h:outputText value="#{msg.weekNumber}" />:</td>
						<td><h:outputText value="#{curriculumBean.curriculum.weekNumber}" /></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.objective}" />:</td>
						<td><h:outputText escape="false" value="#{curriculumBean.curriculum.objective}"/></td>
					</tr>
				</table>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>