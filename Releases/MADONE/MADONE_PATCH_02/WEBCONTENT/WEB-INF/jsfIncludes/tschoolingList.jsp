<a4j:region>
	<a4j:outputPanel id="schoolings">
		<rich:dataTable rows="5" value="#{schoolingBean.schoolings}" var="schooling"
			rendered="#{schoolingBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.schoolings}"/>
	        	</h:outputFormat>
	        </f:facet>
		        

			<rich:column filterBy="#{schooling.eventType.name}" filterEvent="onkeyup" sortBy="#{schooling.eventType.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.type}"/>
	            </f:facet>
		            <h:outputText value="#{schooling.eventType.name}" />
		    </rich:column>
		    
		   	<rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.description}"/>
	            </f:facet>
		            <h:outputText value="#{schooling.description}" />
		    </rich:column>

		   	<rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.date}"/>
	            </f:facet>
		            <h:outputText value="#{schooling.eventDate}">
		            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
		            </h:outputText>
		    </rich:column>
		        
		    <rich:column>
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{schoolingBean.edit}" reRender="gestionSchooling">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{schooling.id}"/>
		        </a4j:commandLink>  
		         <SPACER TYPE=HORIZONTAL SIZE=50>
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{schoolingBean.deleteForTeacher}" reRender="gestionSchooling, schoolings">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{schooling.id}"/>
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
		<h:outputText value="#{schoolingBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{schoolingBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
