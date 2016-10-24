<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="furnitures">
			<rich:dataTable
				style="overflow: hidden; width: 100%; white-space: wrap;" rows="10"
				value="#{furnitureBean.furnitures}" var="furniture"
				rendered="#{furnitureBean.rowCount>0}" reRender="ds"
				rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.furnitures}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{furniture.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{furniture.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.schoolYear}" />
					</f:facet>
					<h:outputText value="#{furniture.schoolYear.year}" />
				</rich:column>

				<rich:column filterBy="#{furniture.level.name}"
					filterEvent="onkeyup" sortBy="#{furniture.level.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{furniture.level.name}" />
				</rich:column>

				<rich:column filterBy="#{furniture.subject.name}"
					filterEvent="onkeyup" sortBy="#{furniture.subject.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{furniture.subject.name}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText escape="false" value="#{furniture.description}" />
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{furnitureBean.edit}"
						reRender="gestionFurniture, furnitureTab">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{furniture.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{furnitureBean.delete}"
						reRender="furnitures">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{furniture.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
