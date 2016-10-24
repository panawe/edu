<a4j:form><a4j:region>
	<a4j:outputPanel id="brands">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{brandBean.brands}" var="brand"
			rendered="#{brandBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header" >
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.brands}"/>
	        	</h:outputFormat>
	        </f:facet>
		    
		    <rich:column  filterBy="#{brand.name}" filterEvent="onkeyup" sortBy="#{brand.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{brand.name}" />
		    </rich:column>
		        
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
	            
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{brandBean.edit}" reRender="gestionBrand">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{brand.id}"/>
		        </a4j:commandLink>  
		        
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{brandBean.delete}" reRender="gestionBrand, brands">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{brand.id}"/>
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
		<h:outputText value="#{brandBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{brandBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region></a4j:form>
