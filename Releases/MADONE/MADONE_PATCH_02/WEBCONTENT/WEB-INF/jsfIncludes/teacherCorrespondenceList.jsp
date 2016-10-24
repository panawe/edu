<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="receivedCorrespondences">
			<rich:dataTable rows="2" value="#{correspondenceBean.receivedCorrespondences}"
				var="receivedCorrespondence" rendered="#{correspondenceBean.rowCount>0}"
				reRender="ds" rowKeyVar="row"  style="overflow: hidden; width: 75%; white-space: nowrap;" >
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.correspondences}"/>
		        	</h:outputFormat>
				</f:facet>
	
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
				
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.message}" />
					</f:facet>
				 	<rich:editor readonly="true" width="500"
							value="#{receivedCorrespondence.correspondence.description}">
					</rich:editor>
				</rich:column>
	
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{correspondenceBean.editTeacherCorrespondence}"
						reRender="gestionReceivedCorrespondence"
						rendered="#{receivedCorrespondence.correspondence.sent==0 }">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{receivedCorrespondence.id}" />
					</a4j:commandLink>
					<SPACER TYPE=HORIZONTAL SIZE=50>
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{correspondenceBean.deleteTeacherCorrespondence}"
						reRender="gestionReceivedCorrespondence, receivedCorrespondences"
						rendered="#{receivedCorrespondence.correspondence.sent==0 }">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{receivedCorrespondence.id}" />
					</a4j:commandLink>
	
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>
	
				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />
	
			<font color="#FF0000"> <error> <h:outputText
				value="#{correspondenceBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{correspondenceBean.successMessage}" /> </success> </font>
	
			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>