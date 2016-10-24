<a4j:form>
<a4j:region>
	<a4j:outputPanel id="correspondences">
		<rich:dataTable rows="3" value="#{correspondenceBean.correspondences}"
			var="correspondence" rendered="#{correspondenceBean.correspondanceCount>0}"
			reRender="ds" rowKeyVar="row">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.correspondences}"/>
	        	</h:outputFormat>
			</f:facet>

			<rich:column filterEvent="onkeyup"
				sortBy="#{correspondence.correspondenceDate}">
				<f:facet name="header">
					<h:outputText value="#{msg.sendDate}" />
				</f:facet>
				<h:outputText value="#{correspondence.correspondenceDate}">
					<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
				 </h:outputText>
			</rich:column>
			
			<rich:column filterBy="#{correspondence.subject}"  filterEvent="onkeyup"
				sortBy="#{correspondence.subject}">
				<f:facet name="header">
					<h:outputText value="#{msg.mailSubject}" />
				</f:facet>
				<h:outputText value="#{correspondence.subject}"/>
			</rich:column>
			
			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.message}" />
				</f:facet>
 
				 <h:outputText escape="false"
					value="#{correspondence.description}">
				</h:outputText>
				 
			</rich:column>

			<rich:column width="60">
				<f:facet name="header">
					<h:outputText value="#{msg.actions }" />
				</f:facet>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{correspondenceBean.edit}"
					reRender="gestionCorrespondence,correspondanceTabPanel">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{correspondence.id}" />
				</a4j:commandLink>
				<rich:spacer width="20" height="10" title="" />
				<a4j:commandLink ajaxSingle="true" id="delete"
					action="#{correspondenceBean.delete}"
					reRender="gestionCorrespondence, correspondences">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{correspondence.id}" />
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

