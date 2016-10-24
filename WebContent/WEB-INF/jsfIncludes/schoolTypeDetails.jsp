<a4j:region>
	<a4j:outputPanel id="gestionSchoolType">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.schoolType}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{schoolTypeBean.schoolType.id}" />
          			<h:outputText value="#{msg.name}:" />
          		</td>
          		<td>
          			<h:inputText id="name5" value="#{schoolTypeBean.schoolType.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name5" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{schoolTypeBean.insert}" 
	    					rendered="#{schoolTypeBean.userHasWriteAccess}" 
	    					reRender="schoolTypes, gestionSchoolType" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{schoolTypeBean.clear}" 
        						reRender="gestionSchoolType"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
