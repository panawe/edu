<a4j:form><a4j:region>
	<a4j:outputPanel id="gestionUserProject">
		<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.resource}"/>
	        	</h:outputFormat>
		    </f:facet>
		    
		    <a4j:outputPanel id="projectUserOutputPanel">
				<table>
					<tr>
						<td>
							<a4j:region>
								<a4j:commandButton value="#{msg.choose} #{msg.resource}"
								action="#{userProjectBean.addUsers}"
								oncomplete="#{rich:component('resultPanelUers')}.show()"
								reRender="resultPanelUers">
								<f:param name="pageProvenance" value="USER_PROJECT"/>
							</a4j:commandButton>
							</a4j:region>
						</td>
					</tr>
					<tr>
						<td>
							<h:inputHidden value="#{userProjectBean.userProject.user.id}" /> 
							<h:outputText rendered="#{not empty userProjectBean.userProject.user.id}" value="#{msg.firstName}: #{userProjectBean.userProject.user.firstName}" />
						</td>
						<td>
							<h:outputText rendered="#{not empty userProjectBean.userProject.user.id}" value="#{msg.lastName}: #{userProjectBean.userProject.user.lastName}" />
						</td>
					</tr>
				</table>
			</a4j:outputPanel>
			
			<table class="table">
				<tr>
					<td><h:outputText value="#{msg.position}" /></td>
					<td><rich:comboBox id="userProjectDetailsPositionName"
						suggestionValues="#{positionBean.positions}"
						directInputSuggestions="true"
						defaultLabel="#{msg.enterListDefaultValue}"
						value="#{userProjectBean.positionName}" /></td>

					<td><font color="#FF0000"><rich:message for="userProjectDetailsPositionName" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.hourlyRate}" /></td>
					<td>
						<h:inputText id="userProjectDetailsHourlyRate"
							value="#{userProjectBean.userProject.hourlyRate}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="userProjectDetailsHourlyRate" /></font></td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}" action="#{userProjectBean.insert}"
				reRender="userProjects, gestionUserProject, userProjectResultPanel1" oncomplete="#{rich:component('userProjectResultPanel1')}.show();"/>
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{userProjectBean.clear}" reRender="gestionUserProject, userProjectResultPanel1" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region></a4j:form>

<rich:modalPanel id="resultPanelUers" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.selectResource}" />
	</f:facet>
	<a4j:form>
		<p><%@include file="/WEB-INF/jsfIncludes/userList.jsp"%>
		</p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{userProjectBean.addProjects}"
			reRender="projectUserOutputPanel"
			oncomplete="#{rich:component('resultPanelUers')}.hide()" /></p>
	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="userProjectResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{userProjectBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{userProjectBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close}" immediate="true"
			oncomplete="#{rich:component('userProjectResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
