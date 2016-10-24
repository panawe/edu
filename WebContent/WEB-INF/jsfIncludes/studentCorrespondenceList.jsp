<a4j:form>
<a4j:region>
	<a4j:outputPanel id="correspondences">
		<rich:dataTable rows="2" value="#{correspondenceBean.receivedCorrespondences}"
			var="receivedCorrespondence" rendered="#{correspondenceBean.rowCount>0}"
			reRender="ds" rowKeyVar="row"  style="overflow: hidden; width: 90%; white-space: nowrap;" >
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.correspondences}"/>
	        	</h:outputFormat>
			</f:facet>

			<rich:column filterEvent="onkeyup"
				sortBy="#{receivedCorrespondence.correspondence.school.name}">
				<f:facet name="header">
					<h:outputText value="#{msg.school}" />
				</f:facet>
			 	<h:outputText value="#{receivedCorrespondence.correspondence.school.name}"/>
			</rich:column>
			
			<rich:column filterEvent="onkeyup"
				sortBy="#{receivedCorrespondence.correspondence.correspondenceDate}">
				<f:facet name="header">
					<h:outputText value="#{msg.sendDate}" />
				</f:facet>
				<h:outputText value="#{receivedCorrespondence.correspondence.correspondenceDate}">
				<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
				 </h:outputText>
			</rich:column>
			
			<rich:column filterEvent="onkeyup"
				sortBy="#{receivedCorrespondence.correspondence.subject}">
				<f:facet name="header">
					<h:outputText value="#{msg.mailSubject}" />
				</f:facet>
			 	<h:outputText value="#{receivedCorrespondence.correspondence.subject}"/>
			</rich:column>
			
			
			<rich:column >
				<f:facet name="header">
					<h:outputText value="#{msg.message}" />
				</f:facet>
				<h:outputText value ="#{receivedCorrespondence.correspondence.description}" escape="false"/>

			</rich:column>
			

			<rich:column width="60">
				<f:facet name="header">
					<h:outputText value="#{msg.actions }" />
				</f:facet>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{correspondenceBean.editStudentCorrespondence}"
					reRender="gestionReceivedCorrespondence,correspondence,studentPanel"
					rendered="#{receivedCorrespondence.correspondence.sent==0 && receivedCorrespondence.correspondence.school.id == user.school.id &&correspondenceBean.userHasWriteAccess }">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{receivedCorrespondence.id}" />
				</a4j:commandLink>
				<rich:spacer width="20" height="10" title="" />
				<a4j:commandLink ajaxSingle="true" id="delete"					 
					action="#{correspondenceBean.deleteStudentCorrespondence}"
					reRender="gestionReceivedCorrespondence, receivedCorrespondences"
					rendered="#{receivedCorrespondence.correspondence.sent==0 && receivedCorrespondence.correspondence.school.id == user.school.id &&correspondenceBean.userHasWriteAccess}">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{receivedCorrespondence.id}" />
				</a4j:commandLink>

				<rich:toolTip for="delete" value="#{msg.delete}" />
			</rich:column>

			<f:facet name="footer">
				<rich:datascroller id="ds"></rich:datascroller>
			</f:facet>
		</rich:dataTable>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>