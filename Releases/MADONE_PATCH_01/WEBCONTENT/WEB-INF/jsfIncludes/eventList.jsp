<a4j:region>
	<a4j:outputPanel id="eventTypes">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{eventTypeBean.eventTypes}" var="eventType"
			rendered="#{eventTypeBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.events}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column filterBy="#{eventType.name}" filterEvent="onkeyup" sortBy="#{eventType.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{eventType.name}" />
		    </rich:column>
		    
		    <rich:column filterBy="#{eventType.showOnGradeReport}" filterEvent="onkeyup"
				sortBy="#{eventType.showOnGradeReport}" width="60">
				<f:facet name="header">
					<h:outputText value="#{msg.showOnGradeReport}" />
				</f:facet>
				<h:outputText rendered="#{eventType.showOnGradeReport == '1'}" value="#{msg.yes}" />
				<h:outputText rendered="#{eventType.showOnGradeReport == '0'}" value="#{msg.no}" />
			</rich:column>	        
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{eventTypeBean.edit}" reRender="gestionDisciplineType">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{eventType.id}"/>
		        </a4j:commandLink>  
		         
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{eventTypeBean.delete}" reRender="gestionDisciplineType, eventTypes">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{eventType.id}"/>
		        </a4j:commandLink>
		        
		        <rich:toolTip for="modify" value="#{msg.modify}"/>      
                <rich:toolTip for="delete" value="#{msg.delete}"/> 
		    </rich:column>
		        
		    <f:facet name="footer">
	            <rich:datascroller id="ds"></rich:datascroller>
	        </f:facet>
		</rich:dataTable>
			   <br/>
			   
		<font color="#FF0000">
		<error>		
		<h:outputText value="#{eventTypeBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{eventTypeBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
