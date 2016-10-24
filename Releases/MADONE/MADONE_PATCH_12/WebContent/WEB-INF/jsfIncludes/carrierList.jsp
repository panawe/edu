<a4j:form><a4j:region>
	<a4j:outputPanel id="carriers">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{carrierBean.carriers}" var="carrier"
			rendered="#{carrierBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header" >
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.carriers}"/>
	        	</h:outputFormat>
	        </f:facet>
		    		    
		    <rich:column filterBy="#{carrier.name}" filterEvent="onkeyup" sortBy="#{carrier.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{carrier.name}" />
		    </rich:column>
		        
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{carrierBean.edit}" reRender="gestionCarrier">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{carrier.id}"/>
		        </a4j:commandLink>  
		         
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{carrierBean.delete}" reRender="gestionCarrier, carriers">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{carrier.id}"/>
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
		<h:outputText value="#{carrierBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{carrierBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region></a4j:form>
