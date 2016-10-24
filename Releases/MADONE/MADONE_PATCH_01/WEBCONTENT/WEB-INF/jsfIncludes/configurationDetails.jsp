<a4j:region>
	<a4j:outputPanel id="gestionConfiguration">
        <rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
        	<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.configuration}"/>
	        	</h:outputFormat>
	    	</f:facet>
        	<table class="table">
        		<tr>
					<td> 
						<h:inputHidden value="#{configurationBean.configuration.id}" />
          				<h:outputText value="#{msg.groupName}" />
          			</td>
          			<td>
			          	<h:inputText id="groupName" value="#{configurationBean.configuration.groupName}" 
			          		size="30" maxlength="50" onchange="convertToUpperCase(this);">
			            	<rich:ajaxValidator event="onblur"/>
			          	</h:inputText>
			        </td>
			        <td>              
          				<font color="#FF0000"><rich:message for="groupName" /></font>                            
		  			</td>
		  		</tr>
				<tr>
					<td> 
         				<h:outputText value="#{msg.name}" />
          			</td>
          			<td>
			          	<h:inputText id="confName" value="#{configurationBean.configuration.name}" 
			          		size="30" maxlength="50" onchange="convertToUpperCase(this);">
			            	<rich:ajaxValidator event="onblur"/>
			          	</h:inputText>
			        </td>
			        <td>              
          				<font color="#FF0000"><rich:message for="confName" /></font>                            
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<h:outputText value="#{msg.value }" />
		  			</td>
		  			<td>
			          	<h:inputText id="value" value="#{configurationBean.configuration.value}" 
			          		size="50" maxlength="200">
			          	</h:inputText>
			         </td>
			          <td>              
          				<font color="#FF0000"><rich:message for="value" /></font>                            
		  			</td>
			     </tr>
			     
			     <tr>
		  			<td>
		  				<h:outputText value="#{msg.description }" />
		  			</td>
		  			<td>
			          	<h:inputText id="description" value="#{configurationBean.configuration.description}" 
			          		size="50" maxlength="200">
			          	</h:inputText>
			         </td>
			          <td>              
          				<font color="#FF0000"><rich:message for="description" /></font>                            
		  			</td>
			     </tr>
			</table>
			
	        <a4j:commandButton value="Sauvegarder" action="#{configurationBean.insert}"
	        			rendered="#{schoolBean.userHasWriteAccess}" 
	        			reRender="configurations, gestionConfiguration" />  
	        <SPACER TYPE=HORIZONTAL SIZE=50>	
          	<a4j:region>  
            	<a4j:commandButton value="Effacer" action="#{configurationBean.clear}" 
            				reRender="gestionConfiguration"/>  
           	</a4j:region>                         		
        </rich:panel>
    </a4j:outputPanel>
</a4j:region>