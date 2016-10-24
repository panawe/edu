<a4j:form><a4j:region>
	<a4j:outputPanel id="gestionClient">
		<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.client}"/>
	        	</h:outputFormat>
		    </f:facet>
			<table class="table">
				<tr>
					<td><h:outputText value="#{msg.clientCode}" /><font color="#FF0000">*</font></td>
					<td>
						<h:inputText id="clientDetailsClientCode"
							value="#{clientBean.client.clientCode}" size="30"
							requiredMessage="#{msg.requiredMessage}" required="true"
							maxlength="50">
							<rich:ajaxValidator event="onblur" />
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsClientCode" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.name}" /><font color="#FF0000">*</font></td>
					<td>
						<h:inputText id="clientDetailsName"
							value="#{clientBean.client.name}" size="30"
							requiredMessage="#{msg.requiredMessage}" required="true"
							maxlength="50">
							<rich:ajaxValidator event="onblur" />
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsName" /></font></td>
				</tr>				
				<tr>
					<td><h:inputHidden value="#{clientBean.client.id}" /> <h:outputText value="#{msg.contactName}" /></td>
					<td>
						<h:inputText id="clientDetailsContactName"
							value="#{clientBean.client.contactName}"  size="50" maxlength="250" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsContactName" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.address}" /></td>
					<td>
						<h:inputText id="clientDetailsAddress"
							value="#{clientBean.client.address}"  size="50" maxlength="75" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsContactAddress" /></font></td>
				</tr>
				<!-- Country Suggestion Box -->
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.country}" /></td>
						<td><rich:comboBox id="clientDetailsCountry"
								value="#{clientBean.countryName}"
								defaultLabel="#{msg.enterListDefaultValue}"
								suggestionValues="#{countryBean.allCountries}">
							</rich:comboBox>
						</td>
						<td><font color="#FF0000"><rich:message for="clientDetailsCountry" /></font></td>
					</a4j:region>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.city}" /></td>
					<td>
						<h:inputText id="clientDetailsCity"
							value="#{clientBean.client.city}"  size="50" maxlength="150" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsContactCity" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.phone}" /></td>
					<td>
						<h:inputText id="clientDetailsPhone"
							value="#{clientBean.client.phone}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsContactPhone" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.fax}" /></td>
					<td>
						<h:inputText id="clientDetailsFax"
							value="#{clientBean.client.fax}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsContactFax" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.email}" /></td>
					<td>
						<h:inputText id="clientDetailsEmail"
							value="#{clientBean.client.email}"  size="30" maxlength="30" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsContactEmail" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.website}" /></td>
					<td>
						<h:inputText id="clientDetailsWebsite"
							value="#{clientBean.client.website}"  size="50" maxlength="100" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="clientDetailsWebsite" /></font></td>
				</tr>
				
			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{clientBean.insert}"
				reRender="clients, gestionClient, clientResultPanel1" oncomplete="#{rich:component('clientResultPanel1')}.show();"/>
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{clientBean.clear}" reRender="gestionClient, clientResultPanel1" />
			</a4j:region>
			<br/><br/><br/><br/><br/><br/>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region></a4j:form>

<rich:modalPanel id="clientResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{clientBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{clientBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('clientResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
