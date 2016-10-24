<a4j:region>
	<a4j:outputPanel id="schoolTypes">
		<rich:dataTable style="overflow: hidden; width: 500px; white-space: nowrap;" rows="5" value="#{schoolTypeBean.schoolTypes}" var="schoolType"
			rendered="#{schoolTypeBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header" >
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.schoolTypes}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column  filterBy="#{schoolType.name}" filterEvent="onkeyup" sortBy="#{schoolType.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{schoolType.name}" />
		    </rich:column>
		        
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions}"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{schoolTypeBean.edit}" reRender="gestionSchoolType">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{schoolType.id}"/>
		        </a4j:commandLink> 
		         
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{schoolTypeBean.delete}" reRender="gestionSchoolType, schoolTypes">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{schoolType.id}"/>
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
				<h:outputText value="#{schoolTypeBean.errorMessage}"/>		
	 		</error>
		</font>
		<font color="#00FF00">
			<success>
				<h:outputText value="#{schoolTypeBean.successMessage}" />
			</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
