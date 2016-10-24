<a4j:form>
<a4j:region>
	<a4j:outputPanel id="questions">
		<rich:dataTable rows="15" value="#{questionBean.questions}" var="question"
			rendered="#{questionBean.rowCount>0}" reRender="ds" rowKeyVar="row"
			style="overflow: hidden; width: 75%; white-space: nowrap;">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.questions}"/>
	        	</h:outputFormat>
	        </f:facet>

		    <rich:column  filterBy="#{question.school.name}" filterEvent="onkeyup" sortBy="#{question.school.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.school}"/>
	            </f:facet>
		            <h:outputText value="#{question.school.name}" />
		    </rich:column>

		    <rich:column  filterBy="#{question.subject.name}" filterEvent="onkeyup" sortBy="#{question.subject.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.subject}"/>
	            </f:facet>
		            <h:outputText value="#{question.subject.name}" />
		    </rich:column>

			<rich:column  filterBy="#{question.level.name}" filterEvent="onkeyup" sortBy="#{question.level.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.level}"/>
	            </f:facet>
		            <h:outputText value="#{question.level.name}" />
		    </rich:column>
		    		        
			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.question}" />
				</f:facet>
				<h:outputText escape="false"
					value="#{question.body}">
				</h:outputText>
			</rich:column>

		    <rich:column  filterBy="#{question.rating.name}" filterEvent="onkeyup" sortBy="#{question.rating.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.rating}"/>
	            </f:facet>
		            <h:outputText value="#{question.rating.name}" />
		    </rich:column>
		    
		     <rich:column   sortBy="#{question.score}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.score}"/>
	            </f:facet>
		            <h:outputText value="#{question.score}" />
		    </rich:column>
		    				    
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{questionBean.edit}" reRender="questionDetail,questionPanel">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{question.id}"/>
		        </a4j:commandLink>  
		           <rich:spacer width="20" height="10" title="" />
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{courseBean.delete}" reRender="questionDetail">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{question.id}"/>
		        </a4j:commandLink>
		        
		        <rich:toolTip for="modify" value="#{msg.modify}"/>      
                <rich:toolTip for="delete" value="#{msg.delete}"/> 
		    </rich:column>
		        
		    <f:facet name="footer">
	            <rich:datascroller id="ds"></rich:datascroller>
	        </f:facet>
		</rich:dataTable>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>