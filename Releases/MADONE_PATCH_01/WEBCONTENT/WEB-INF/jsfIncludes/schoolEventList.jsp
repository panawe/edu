<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="schoolEvents"
			rendered="#{schoolEventBean.rowCount > 0}">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
					<f:param value="#{msg.events}" />
				</h:outputFormat>
			</f:facet>

			<rich:dataGrid value="#{schoolEventBean.schoolEvents}" rendered="#{link == 'school'}"
				id="schoolEventGrid" var="schoolEvent" columns="4" elements="8"
				align="top">
				<rich:panel bodyClass="pbody">
					<f:facet name="header">
						<h:outputText value="#{schoolEvent.title}"></h:outputText>
					</f:facet>
					<h:panelGrid columns="2" >
						<h:outputText value="#{msg.beginDateTime}" styleClass="label"></h:outputText>
						<h:outputText value="#{schoolEvent.beginDateTime}">
							<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
						</h:outputText>

						<h:outputText value="#{msg.endDateTime}" styleClass="label"></h:outputText>
						<h:outputText value="#{schoolEvent.endDateTime}">
							<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
						</h:outputText>

						<a4j:commandLink ajaxSingle="true" id="readMore"
							rendered="#{schoolEvent.showDescriptionLink}"
							action="#{schoolEventBean.edit}"
							oncomplete="#{rich:component('schoolEventDescriptionResultPanel')}.show();"
							reRender="schoolEventDescriptionResultPanel"
							value="#{msg.readMore}">

							<f:param name="id" value="#{schoolEvent.id}" />
						</a4j:commandLink>
						<h:outputText escape="false"
							value="#{schoolEvent.shortDescription}" />

					</h:panelGrid>

					<br />
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{schoolEventBean.edit}"
						rendered="#{schoolEventBean.canModify}"
						reRender="gestionSchoolEvent">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{schoolEvent.id}" />
					</a4j:commandLink>

					<rich:spacer width="25" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="deleteC"
						rendered="#{schoolEventBean.canModify}"
						action="#{schoolEventBean.delete}" reRender="schoolEvent"
						oncomplete="#{rich:component('eventResultPanel')}.show();">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{schoolEvent.id}" />
					</a4j:commandLink>
					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="readMore" value="#{msg.readMoreDescription}" />
				</rich:panel>
				<f:facet name="footer">
					<rich:datascroller></rich:datascroller>
				</f:facet>
			</rich:dataGrid>


			<rich:dataGrid value="#{schoolEventBean.futureSchoolEvents}" rendered="#{link != 'school'}"
				id="futureSchoolEventGrid" var="schoolEvent" columns="4" elements="8"
				align="top">
				<rich:panel bodyClass="pbody">
					<f:facet name="header">
						<h:outputText value="#{schoolEvent.title}"></h:outputText>
					</f:facet>
					<h:panelGrid columns="2" >
						<h:outputText value="#{msg.beginDateTime}" styleClass="label"></h:outputText>
						<h:outputText value="#{schoolEvent.beginDateTime}">
							<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
						</h:outputText>

						<h:outputText value="#{msg.endDateTime}" styleClass="label"></h:outputText>
						<h:outputText value="#{schoolEvent.endDateTime}">
							<f:convertDateTime pattern="#{configurationBean.dateTimeFormat}" />
						</h:outputText>

						<a4j:commandLink ajaxSingle="true" id="readMore"
							rendered="#{schoolEvent.showDescriptionLink}"
							action="#{schoolEventBean.edit}"
							oncomplete="#{rich:component('schoolEventDescriptionResultPanel')}.show();"
							reRender="schoolEventDescriptionResultPanel"
							value="#{msg.readMore}">

							<f:param name="id" value="#{schoolEvent.id}" />
						</a4j:commandLink>
						<h:outputText escape="false"
							value="#{schoolEvent.shortDescription}" />

					</h:panelGrid>

					<br />
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{schoolEventBean.edit}"
						rendered="#{schoolEventBean.canModify}"
						reRender="gestionSchoolEvent">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{schoolEvent.id}" />
					</a4j:commandLink>

					<rich:spacer width="25" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="deleteC"
						rendered="#{schoolEventBean.canModify}"
						action="#{schoolEventBean.delete}" reRender="schoolEvent"
						oncomplete="#{rich:component('eventResultPanel')}.show();">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{schoolEvent.id}" />
					</a4j:commandLink>
					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="readMore" value="#{msg.readMoreDescription}" />
				</rich:panel>
				<f:facet name="footer">
					<rich:datascroller></rich:datascroller>
				</f:facet>
			</rich:dataGrid>
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>

<rich:modalPanel id="eventResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{schoolEventBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{schoolEventBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('eventResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="schoolEventDescriptionResultPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.description}" />
	</f:facet>
	<a4j:form>
		<p><h:outputText escape="false"
			value="#{schoolEventBean.schoolEvent.description}">
		</h:outputText></p>
		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('schoolEventDescriptionResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>