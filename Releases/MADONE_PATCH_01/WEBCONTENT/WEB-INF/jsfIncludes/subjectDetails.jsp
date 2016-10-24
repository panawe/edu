<a4j:region>
	<a4j:outputPanel id="gestionSubject">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.subject}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table" >
			<tr>
				<td> 
					<h:inputHidden value="#{subjectBean.subject.id}" />
          			<h:outputText value="#{msg.name}:" />
          		</td>
          		<td>
          			<h:inputText id="name3" value="#{subjectBean.subject.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name3" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{subjectBean.insert}" 
	    					rendered = "#{ schoolBean.userHasWriteAccess }" reRender="subjects, gestionSubject" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{subjectBean.clear}" 
        						reRender="gestionSubject"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
