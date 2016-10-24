<a4j:region>
	<a4j:outputPanel id="gestionDisease">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;" >
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.disease}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{diseaseBean.disease.id}" />
          			<h:outputText value="#{msg.name}:" />
          		</td>
          		<td>
          			<h:inputText id="name1" value="#{diseaseBean.disease.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name1" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{diseaseBean.insert}" 
	    					rendered="#{diseaseBean.userHasWriteAccess}" 
	    					reRender="diseases, gestionDisease" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{diseaseBean.clear}" 
        						reRender="gestionDisease"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
