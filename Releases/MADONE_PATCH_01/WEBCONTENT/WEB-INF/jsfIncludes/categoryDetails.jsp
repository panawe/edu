<a4j:form><a4j:region>
	<a4j:outputPanel id="gestionCategory">
	<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;" >
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.category}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{categoryBean.category.id}" />
          			<h:outputText value="#{msg.name}" /><font color="#FF0000">*</font>
          		</td>
          		<td>
          			<h:inputText id="categoryName" value="#{categoryBean.category.name}" 
          				size="75" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="categoryName" /></font>                            
		  		</td>
		  	</tr>
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{categoryBean.insert}" 
	    					rendered = "#{ categoryBean.userHasWriteAccess }"
	    					reRender="categories, gestionCategory" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{categoryBean.clear}" 
        						reRender="gestionCategory"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region></a4j:form>