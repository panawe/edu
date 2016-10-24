
			<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{studentBean.selectedParents}" var="parent"
				 reRender="ds" rowKeyVar="row">
			    <f:facet name="header" >
		        	<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.parents}"/>
		        	</h:outputFormat>
		        </f:facet>
			        
			    <rich:column filterBy="#{parent.lastName}" filterEvent="onkeyup" sortBy="#{parent.lastName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.lastName}"/>
		            </f:facet>
			            <h:outputText value="#{parent.lastName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{parent.firstName}" filterEvent="onkeyup" sortBy="#{parent.firstName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.firstName}"/>
		            </f:facet>
			            <h:outputText value="#{parent.firstName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{parent.middleName}" filterEvent="onkeyup" sortBy="#{parent.middleName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.middleName}"/>
		            </f:facet>
			            <h:outputText value="#{parent.middleName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{parent.telephone}" filterEvent="onkeyup" sortBy="#{parent.telephone}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.phone}"/>
		            </f:facet>
			            <h:outputText value="#{parent.telephone}" />
			    </rich:column>
			    		      
			    <rich:column filterBy="#{parent.profession}" filterEvent="onkeyup" sortBy="#{parent.profession}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.profession}"/>
		            </f:facet>
			            <h:outputText value="#{parent.profession}" />
			    </rich:column>
			    
			    <rich:column filterBy="#{parent.workPlace}" filterEvent="onkeyup" sortBy="#{parent.workPlace}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.workPlace}"/>
		            </f:facet>
			            <h:outputText value="#{parent.workPlace}" />
			    </rich:column>
			    
			     <rich:column>
			    	<f:facet name="header">
		                <h:outputText value="#{msg.parentType}"/>
		            </f:facet>
			            <h:outputText value="#{parent.parentTypeText}" />
			    </rich:column>
			        
			    <f:facet name="footer">
		            <rich:datascroller id="ds"></rich:datascroller>
		        </f:facet>
			</rich:dataTable>
