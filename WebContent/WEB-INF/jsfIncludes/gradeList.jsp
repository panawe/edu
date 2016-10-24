<a4j:region>
	<a4j:outputPanel id="grades" >
		<rich:dataTable rows="10" value="#{gradeBean.grades}" var="grade"
			rendered="#{gradeBean.rowCount>0}" reRender="ds" rowKeyVar="row" style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.grades}"/>
	        	</h:outputFormat>
			</f:facet>

			<rich:column filterBy="#{grade.name}" filterEvent="onkeyup"
				sortBy="#{grade.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.name}" />
				</f:facet>
				<h:outputText value="#{grade.name}" />
			</rich:column>

			<rich:column filterBy="#{grade.beginRange}" filterEvent="onkeyup"
				sortBy="#{grade.beginRange}">
				<f:facet name="header">
					<h:outputText value="#{msg.minMark}" />
				</f:facet>
				<h:outputText value="#{grade.beginRange}" />
			</rich:column>
			
			<rich:column filterBy="#{grade.endRange}" filterEvent="onkeyup"
				sortBy="#{grade.endRange}">
				<f:facet name="header">
					<h:outputText value="#{msg.maxMark}" />
				</f:facet>
				<h:outputText value="#{grade.endRange}" />
			</rich:column>

			<rich:column width="60" >
				<f:facet name="header">
					<h:outputText value="#{msg.actions }" />
				</f:facet>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{gradeBean.edit}" reRender="gestionGrade">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{grade.id}" />
				</a4j:commandLink>
				
				<rich:spacer width="20" height="10" title="" />
				
				<a4j:commandLink ajaxSingle="true" id="delete"
					action="#{gradeBean.delete}" reRender="gestionGrade, grades">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{grade.id}" />
				</a4j:commandLink>

				<rich:toolTip for="modify" value="#{msg.modify}" />
				<rich:toolTip for="delete" value="#{msg.delete}" />
			</rich:column>

			<f:facet name="footer">
				<rich:datascroller id="ds"></rich:datascroller>
			</f:facet>
		</rich:dataTable>
		<br />

		<font color="#FF0000"> <error> <h:outputText
			value="#{gradeBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{gradeBean.successMessage}" /> </success> </font>

		<br />
	</a4j:outputPanel>
</a4j:region>
