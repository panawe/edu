<a4j:form><a4j:region>
	<a4j:outputPanel id="suppliers">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{supplierBean.suppliers}" var="supplier"
			rendered="#{supplierBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header" >
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.suppliers}"/>
	        	</h:outputFormat>
	        </f:facet>
		    		    
		    <rich:column  filterBy="#{supplier.name}" filterEvent="onkeyup" sortBy="#{supplier.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{supplier.name}" />
		    </rich:column>
		        
		    <rich:column filterBy="#{supplier.contactName}" filterEvent="onkeyup" sortBy="#{supplier.contactName}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.contactName}"/>
	            </f:facet>
		            <h:outputText value="#{supplier.contactName}" />
		    </rich:column>
		    
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
	            
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{supplierBean.edit}" reRender="gestionSupplier">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{supplier.id}"/>
		        </a4j:commandLink>  
		        
		        <rich:spacer width="20" height="10" title="" />
		        
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{supplierBean.delete}" reRender="gestionSupplier, suppliers">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{supplier.id}"/>
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
		<h:outputText value="#{supplierBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{supplierBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region></a4j:form>
