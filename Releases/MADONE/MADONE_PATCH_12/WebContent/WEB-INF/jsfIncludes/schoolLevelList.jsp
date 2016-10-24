<a4j:region>
	<a4j:outputPanel id="schoolLevels">
		<rich:dataTable style="overflow: hidden; width: 500px; white-space: nowrap;" rows="5" value="#{schoolLevelBean.schoolLevels}" var="schoolLevel"
			rendered="#{schoolLevelBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header" >
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.schoolLevels}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column width="400px" filterBy="#{schoolLevel.name}" filterEvent="onkeyup" sortBy="#{schoolLevel.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{schoolLevel.name}" />
		    </rich:column>
		        
		    <rich:column width="35">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions}"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{schoolLevelBean.edit}" reRender="gestionSchoolLevel">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{schoolLevel.id}"/>
		        </a4j:commandLink>  
		         <SPACER TYPE=HORIZONTAL SIZE=50>
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{schoolLevelBean.delete}" reRender="gestionSchoolLevel, schoolLevels">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{schoolLevel.id}"/>
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
				<h:outputText value="#{schoolLevelBean.errorMessage}"/>		
	 		</error>
		</font>
		<font color="#00FF00">
			<success>
				<h:outputText value="#{schoolLevelBean.successMessage}" />
			</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
