<a4j:region>
	<a4j:outputPanel id="exemptions">
		<rich:dataTable rows="5" value="#{exemptionBean.exemptions}" var="exemption"
			rendered="#{exemptionBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.exemptions}"/>
	        	</h:outputFormat>
	        </f:facet>
			 <rich:column filterBy="#{exemption.course.levelClass.name}" filterEvent="onkeyup" sortBy="#{exemption.course.levelClass.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.classe}"/>
	            </f:facet>
		            <h:outputText value="#{exemption.course.levelClass.name}" />
		    </rich:column>
		    
			<rich:column filterBy="#{exemption.course.subject.name}" filterEvent="onkeyup" sortBy="#{exemption.course.subject.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.subject}"/>
	            </f:facet>
		            <h:outputText value="#{exemption.course.subject.name}" />
		    </rich:column>
		    
		    <rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.comments}"/>
	            </f:facet>
		            <h:outputText value="#{exemption.comments}" />
		    </rich:column>
		    
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" 
		        	rendered="#{exemption.school.id == user.school.id }"
		        	action="#{exemptionBean.edit}" reRender="gestionExemption">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{exemption.id}"/>
		        </a4j:commandLink>  
		         <rich:spacer width="20" height="10" title="" />
		        <a4j:commandLink ajaxSingle="true" id="delete" 
		        	rendered="#{exemption.school.id == user.school.id }"
		        	action="#{exemptionBean.delete}" reRender="gestionExemption, exemptions">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{exemption.id}"/>
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
				<h:outputText value="#{exemptionBean.errorMessage}"/>		
	 		</error>
		</font>
		<font color="#00FF00">
			<success>
				<h:outputText value="#{exemptionBean.successMessage}" />
			</success>
		</font>
		<br/>
	</a4j:outputPanel>
</a4j:region>
