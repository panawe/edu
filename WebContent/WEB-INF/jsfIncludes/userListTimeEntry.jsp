<a4j:form>
	<a4j:region>
		<table width="50%">
			<tr>
				<td><h:outputText value="#{msg.userName }" /></td>
				<td width="30%">
					<h:inputText onkeyup="convertToUpperCase(this);" value="#{userBean.userName}" /> 	
				</td>
				<td><h:outputText value="#{msg.firstName }" /></td>
				<td width="30%">
					<h:inputText onkeyup="convertToUpperCase(this);" value="#{userBean.firstName}" /> 	
				</td>
				<td><h:outputText value="#{msg.lastName }" /></td>
				<td width="30%">
					<h:inputText onkeyup="convertToUpperCase(this);" value="#{userBean.lastName}" /> 	
				</td>
				<td>
					<a4j:commandButton value="#{msg.search}" action="#{userBean.getSearchedUsers}" reRender="users" 
						oncomplete="if (#{userBean.activeUsersCount <= 0}) #{rich:component('resultPanelUser')}.show();" >
						<f:param name="action" value="search"/>
					</a4j:commandButton>
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<h:outputText value="#{msg.allActiveUsers }" /> 
					<h:selectBooleanCheckbox id="selectAllActiveUsers"
						value="#{userBean.selectAllActiveUsers}"
						title="#{msg.allActiveUsers }">
					</h:selectBooleanCheckbox>
				</td>
			</tr>
		</table>
	</a4j:region>

	<a4j:region>
		<a4j:outputPanel id="users">
			<rich:dataTable rows="5" value="#{userBean.activeUsers}" var="user"
				rendered="#{userBean.activeUsersCount>0}" reRender="ds" rowKeyVar="row"
				 style="overflow: hidden; width: 75%; white-space: nowrap;" >
			    <f:facet name="header">
		        	<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.userName}"/>
		        	</h:outputFormat>
		        </f:facet>
			    	
			    <rich:column filterBy="#{user.userName}" filterEvent="onkeyup" sortBy="#{user.username}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.userName}"/>
		            </f:facet>
			            <h:outputText value="#{user.userName}" />
			    </rich:column>
			    <rich:column filterBy="#{user.firstName}" filterEvent="onkeyup" sortBy="#{user.firstName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.firstName}"/>
		            </f:facet>
			            <h:outputText value="#{user.firstName}" />
			    </rich:column>
			    			        
			    <rich:column filterBy="#{user.lastName}" filterEvent="onkeyup" sortBy="#{user.lastName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.lastName}"/>
		            </f:facet>
			            <h:outputText value="#{user.lastName}" />
			    </rich:column>
			   	<rich:column>
			    	<f:facet name="header">
		                <h:outputText value="#{msg.phone}"/>
		            </f:facet>
			            <h:outputText value="#{user.phone}" />
			    </rich:column> 	
			    <rich:column>
			        <f:facet name="header">
		                <h:outputText value="#{msg.actions }"/>
		            </f:facet>
		            <a4j:commandLink ajaxSingle="true" id="selectUser" 
		            action="#{timeEntryBean.changeEmployee}" reRender="viewTimeTables"
		            oncomplete="#{rich:component('selectUserPanel')}.hide()">
			            <h:graphicImage value="images/approve.gif" style="border:0"/>
			            <f:param name="id" value="#{user.id}"/>
			        </a4j:commandLink>  
			        <rich:toolTip for="selectUser" value="#{msg.selectPrompt}"/>      
			    </rich:column>
			        
			    <f:facet name="footer">
		            <rich:datascroller id="ds"></rich:datascroller>
		        </f:facet>
			</rich:dataTable>
				   <br/>
				   
			<font color="#FF0000">
			<error>		
			<h:outputText value="#{userBean.errorMessage}"/>		
	 		</error>
			</font>
			<font color="#00FF00">
			<success>
			<h:outputText value="#{userBean.successMessage}" />
			</success>
			</font>
	
			<br/>
		</a4j:outputPanel>
	</a4j:region>
	
</a4j:form>	
		<rich:modalPanel id="resultPanelUser" autosized="true" width="300">
			<f:facet name="header">
				<h:outputText value="#{msg.result}" />
			</f:facet>
			<p>
				<h:outputText value="#{msg.noResultFound}" />
			</p>
			<p></p>
			<p>
				<a4j:commandButton value="#{msg.close}"
				onclick=" #{rich:component('resultPanelUser')}.hide();" />
			</p>
		</rich:modalPanel>
