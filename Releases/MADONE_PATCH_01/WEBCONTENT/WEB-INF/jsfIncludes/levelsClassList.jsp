<a4j:form>
<a4j:region>
	<a4j:outputPanel id="levelClasses">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="3" value="#{levelClassBean.levelClasses}" var="levelClass"
			rendered="#{levelClassBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.levelClasses}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column filterBy="#{levelClass.name}" filterEvent="onkeyup" sortBy="#{levelClass.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{levelClass.name}" />
		    </rich:column>

		    <rich:column filterBy="#{levelClass.level.name}" filterEvent="onkeyup" sortBy="#{levelClass.level.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.level}"/>
	            </f:facet>
		            <h:outputText value="#{levelClass.level.name}" />
		    </rich:column>
		        
		    <rich:column >
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>  
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{levelClassBean.edit}" reRender="ClassName">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{levelClass.id}"/>
		        </a4j:commandLink>  
		        
		        <rich:toolTip for="modify" value="#{msg.select}"/>      
		    </rich:column>
		        
		    <f:facet name="footer">
	            <rich:datascroller id="ds"></rich:datascroller>
	        </f:facet>
		</rich:dataTable>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>