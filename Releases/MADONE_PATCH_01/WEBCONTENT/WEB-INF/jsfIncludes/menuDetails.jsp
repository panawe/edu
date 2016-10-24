<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionMenu">
			<rich:panel  style="overflow: hidden; width: 85%; white-space: nowrap;" >
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.menu}" />
					</h:outputFormat>
				</f:facet>
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>. 
		    	<table class="table">
			    	<tr>
						<td> 
							<h:inputHidden value="#{menuBean.menu.id}" />
				        	<h:outputText value="#{msg.name}:" />
				        </td>
				        <td>
			       			<h:inputText id="name" value="#{menuBean.menu.name}" size="75" maxlength="50">
			         			<rich:ajaxValidator event="onblur"/>
			       			</h:inputText>
				        </td>
				        <td>             
				        	<font color="#FF0000"><rich:message for="name" /></font>                            
				  		</td>
				  	</tr>
				  	
			    	<tr>
						<td><h:outputText value="#{msg.parentName}" /></td>
						<td><h:selectOneMenu id="menuParentId" value="#{menuBean.menuParentId}">
							<f:selectItems value="#{menuBean.parentMenus}" />
						</h:selectOneMenu></td>
					</tr>
				 
				  	<tr>
						<td> 
				        	<h:outputText value="#{msg.description}:" />
				        </td>
				        <td>
			       			<h:inputText id="description" value="#{menuBean.menu.description}" size="75" maxlength="50">
			         			<rich:ajaxValidator event="onblur"/>
			       			</h:inputText>
				        </td>
				        <td>             
				        	<font color="#FF0000"><rich:message for="desscription" /></font>                            
				  		</td>
				  	</tr>
				  	
				  	<tr>
						<td> 
				        	<h:outputText value="#{msg.url}:" />
				        </td>
				        <td>
			       			<h:inputText id="url" value="#{menuBean.menu.url}" size="75" maxlength="100">
			         			<rich:ajaxValidator event="onblur"/>
			       			</h:inputText>
				        </td>
				        <td>             
				        	<font color="#FF0000"><rich:message for="url" /></font>                            
				  		</td>
				  	</tr>
				 </table>
				 
				<a4j:commandButton value="#{msg.save}"
				
					action="#{menuBean.insert}"
					reRender="menus, gestionMenu" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{menuBean.clear}" reRender="gestionMenu" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>