<a4j:form>
<a4j:region>
	<a4j:outputPanel id="menus">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{menuBean.menus}" var="menu"
			rendered="#{menuBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.menus}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column filterBy="#{menu.name}" filterEvent="onkeyup" sortBy="#{menu.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{menu.name}" />
		    </rich:column>

			<rich:column filterBy="#{menu.menuParent.name}" filterEvent="onkeyup" sortBy="#{menu.menuParent.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.parentName}"/>
	            </f:facet>
		            <h:outputText value="#{menu.menuParent.name}" />
		    </rich:column>
		    
		    <rich:column filterBy="#{menu.description}" filterEvent="onkeyup" sortBy="#{menu.description}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.description}"/>
	            </f:facet>
		            <h:outputText value="#{menu.description}" />
		    </rich:column>

		    <rich:column filterBy="#{menu.url}" filterEvent="onkeyup" sortBy="#{menu.url}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.url}"/>
	            </f:facet>
		            <h:outputText value="#{menu.url}" />
		    </rich:column>
		        
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{menuBean.edit}" reRender="gestionMenu">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{menu.id}"/>
		        </a4j:commandLink>  
		        
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{menuBean.delete}" reRender="gestionMenu, menus">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{menu.id}"/>
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
		<h:outputText value="#{menuBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{menuBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>