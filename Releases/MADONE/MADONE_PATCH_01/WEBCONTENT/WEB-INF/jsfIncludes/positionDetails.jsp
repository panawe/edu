<a4j:region>
	<a4j:outputPanel id="gestionPosition">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.position}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{positionBean.position.id}" />
          			<h:outputText value="#{msg.name}:" />
          		</td>
          		<td>
          			<h:inputText id="name" value="#{positionBean.position.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{positionBean.insert}" 
	    					rendered="#{positionBean.userHasWriteAccess}" 
	    					reRender="positions, gestionPosition" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{positionBean.clear}" 
        						reRender="gestionPosition"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
