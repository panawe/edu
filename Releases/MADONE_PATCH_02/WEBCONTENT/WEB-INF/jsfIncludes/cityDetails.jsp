<a4j:region>
	<a4j:outputPanel id="gestionCity">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;" >
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.detailCity}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{cityBean.city.id}" />
          			<h:outputText value="#{msg.name}:" />
          		</td>
          		<td>
          			<h:inputText id="name2" value="#{cityBean.city.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name2" /></font>                            
		  		</td>
		  	</tr>
		  	
		  	<tr>
				<td>
         			<h:outputText value="#{msg.country}:" />
         		</td>
         		<td><rich:comboBox id="country" suggestionValues="#{countryBean.allCountries}"
					directInputSuggestions="true" defaultLabel="#{msg.enterListDefaultValue}"
					value="#{cityBean.countryName}" />
					<font color="#FF0000"><rich:message for="country" /></font>
				</td>
			</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{cityBean.insert}" 
	    					rendered="#{cityBean.userHasWriteAccess}" 
	    					reRender="cities, gestionCity" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{cityBean.clear}" 
        						reRender="gestionCity"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
