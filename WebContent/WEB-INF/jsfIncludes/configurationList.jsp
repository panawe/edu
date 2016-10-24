<a4j:region>
	<a4j:outputPanel id="configurations"  style="width=75%;">
	    <rich:dataTable rows="10" value="#{configurationBean.configurations}" var="configuration"
	        rendered="#{configurationBean.rowCount>0}" reRender="ds" rowKeyVar="row"
	        style="overflow: hidden; width: 75%; white-space: nowrap;">
	        <f:facet name="header">
                <h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.configurations}"/>
	        	</h:outputFormat>
            </f:facet>
	        
	         <rich:column filterBy="#{configuration.groupName}" filterEvent="onkeyup" sortBy="#{configuration.groupName}">
	            <f:facet name="header">
                <h:outputText value="#{msg.groupName }"/>
            </f:facet>
	            <h:outputText value="#{configuration.groupName}" />
	        </rich:column>
	        
	        <rich:column filterBy="#{configuration.name}" filterEvent="onkeyup" sortBy="#{configuration.name}">
	            <f:facet name="header">
                <h:outputText value="#{msg.name }"/>
            </f:facet>
	            <h:outputText value="#{configuration.name}" />
	        </rich:column>
	        <rich:column sortBy="#{configuration.value}">
	            <f:facet name="header">
                <h:outputText value="#{msg.value }"/>
            </f:facet>
	            <h:outputText value="#{configuration.value}" />
	        </rich:column>
	        
	        <rich:column sortBy="#{configuration.description}">
	            <f:facet name="header">
                <h:outputText value="#{msg.description}"/>
            </f:facet>
	            <h:outputText value="#{configuration.description}" />
	        </rich:column>
	        
	        <rich:column width="60">
	            <f:facet name="header">
                <h:outputText value="Actions"/>
            	</f:facet>
	            <a4j:commandLink ajaxSingle="true" id="Changer" action="#{configurationBean.edit}" 
	            	  reRender="gestionConfiguration">
	            	<h:graphicImage value="/images/edit.gif" style="border:0"/>
	            	<f:param name="id" value="#{configuration.id}"/>
	            </a4j:commandLink>  
	            
	             <rich:spacer width="20" height="10" title="" />
	             
	            <a4j:commandLink ajaxSingle="true" id="Supprimer" action="#{configurationBean.delete}" 
	            	  reRender="configurations, gestionConfiguration">
	            	<h:graphicImage value="/images/delete.gif" style="border:0"/>
	            	<f:param name="id" value="#{configuration.id}"/>
	            </a4j:commandLink>
	            
	            <rich:toolTip for="Changer" value="Changer"/>      
                <rich:toolTip for="Supprimer" value="Supprimer"/> 
	        </rich:column>
	        
	        <f:facet name="footer">
                <rich:datascroller id="ds"></rich:datascroller>
            </f:facet>
	    </rich:dataTable>
	    
	    <br/>
	    
	    <font color="#FF0000">
		<error>		
		<h:outputText value="#{configurationBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{configurationBean.successMessage}" />
		</success>
		</font>

	    <br/>
	</a4j:outputPanel>
</a4j:region>