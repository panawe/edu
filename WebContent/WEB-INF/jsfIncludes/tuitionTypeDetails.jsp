<a4j:region>
	<a4j:outputPanel id="gestionTuitionType">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;" >
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.tuitionType}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{tuitionTypeBean.tuitionType.id}" />
          			<h:outputText value="#{msg.name}"/><font color="#FF0000">*</font> 
          		</td>
          		<td>
          			<h:inputText id="name6" value="#{tuitionTypeBean.tuitionType.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name6" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{tuitionTypeBean.insert}" 
	    					rendered="#{schoolBean.userHasWriteAccess}" 
	    					reRender="tuitionTypes, gestionTuitionType" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{tuitionTypeBean.clear}" 
        						reRender="gestionTuitionType"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
