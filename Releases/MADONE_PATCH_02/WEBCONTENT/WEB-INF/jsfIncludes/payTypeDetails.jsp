<a4j:region>
	<a4j:outputPanel id="gestionPayType">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;" >
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.payType}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{payTypeBean.payType.id}" />
          			<h:outputText value="#{msg.name}"/><font color="#FF0000">*</font> 
          		</td>
          		<td>
          			<h:inputText id="name6" value="#{payTypeBean.payType.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name6" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{payTypeBean.insert}" 
	    					rendered="#{payTypeBean.userHasWriteAccess}" 
	    					reRender="payTypes, gestionPayType" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{payTypeBean.clear}" 
        						reRender="gestionPayType"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
