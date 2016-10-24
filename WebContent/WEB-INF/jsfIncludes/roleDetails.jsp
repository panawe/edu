<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionRole">
			<rich:panel  style="overflow: hidden; width: 85%; white-space: nowrap;" >
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.role}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>. 
		    	<table class="table">
			    	<tr>
						<td> 
							<h:inputHidden value="#{roleBean.role.id}" />
				        	<h:outputText value="#{msg.name}:" />
				        </td>
				        <td>
			       			<h:inputText id="name" value="#{roleBean.role.name}" size="75" maxlength="50">
			         			<rich:ajaxValidator event="onblur"/>
			       			</h:inputText>
				        </td>
				        <td>             
				        	<font color="#FF0000"><rich:message for="name" /></font>                            
				  		</td>
				  	</tr>
				  	
				  	<tr>
						<td> 
				        	<h:outputText value="#{msg.description}:" />
				        </td>
				        <td>
			       			<h:inputText id="description" value="#{roleBean.role.description}" size="75" maxlength="50">
			         			<rich:ajaxValidator event="onblur"/>
			       			</h:inputText>
				        </td>
				        <td>             
				        	<font color="#FF0000"><rich:message for="desscription" /></font>                            
				  		</td>
				  	</tr>
				 </table>
				 
				<a4j:commandButton value="#{msg.save}"
				
					action="#{roleBean.insert}"
					reRender="roles, gestionRole" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{roleBean.clear}" reRender="gestionRole" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>