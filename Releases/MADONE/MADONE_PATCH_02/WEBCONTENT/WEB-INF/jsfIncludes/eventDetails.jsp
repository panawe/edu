<a4j:region>
	<a4j:outputPanel id="gestionDisciplineType">
	<rich:panel>
		<f:facet name="header">
        	<h:outputFormat value="#{msg.detailsHeader}">
        		 <f:param value="#{msg.event}"/>
        	</h:outputFormat>
	    </f:facet>
    	<table class="table">
			<tr>
				<td> 
					<h:inputHidden value="#{eventTypeBean.eventType.id}" />
          			<h:outputText value="#{msg.name}" />
          		</td>
          		<td>
          			<h:inputText id="eventName" value="#{eventTypeBean.eventType.name}" 
          				size="30" maxlength="50" onchange="convertToUpperCase(this);">
            			<rich:ajaxValidator event="onblur"/>
          			</h:inputText>
          		</td>
          		<td>             
          			<font color="#FF0000"><rich:message for="name" /></font>                            
		  		</td>
		  	</tr>
		  	<tr>
				<td>
					<h:outputText value="#{msg.showOnGradeReport}" />
				</td>
				<td>
					<h:selectOneMenu id="showOnGradeReport" value="#{eventTypeBean.eventType.showOnGradeReport}">
						<f:selectItem itemValue="0" itemLabel="#{msg.no}" />
						<f:selectItem itemValue="1" itemLabel="#{msg.yes}" />
					</h:selectOneMenu>
					<font color="#FF0000"><rich:message for="showOnGradeReport" /></font>
				</td>
			</tr>
		  	
		</table>
	        
	    <a4j:commandButton value="#{msg.save}" action="#{eventTypeBean.insert}" 
	    					rendered="#{eventTypeBean.userHasWriteAccess}" 
	    					reRender="eventTypes, gestionDisciplineType" /> 
	    <SPACER TYPE=HORIZONTAL SIZE=50>
	    <a4j:region>  
        	<a4j:commandButton value="#{msg.clear}" action="#{eventTypeBean.clear}" 
        						reRender="gestionDisciplineType"/> 
        </a4j:region>                          		
	</rich:panel>
</a4j:outputPanel>
</a4j:region>
