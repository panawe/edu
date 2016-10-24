<a4j:form><a4j:region>
	<a4j:outputPanel id="gestionProject">
		<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.project}"/>
	        	</h:outputFormat>
		    </f:facet>
			<table class="table">
				<tr>
					<td><h:outputText value="#{msg.projectCode}" /><font color="#FF0000">*</font></td>
					<td>
						<h:inputText id="projectDetailsProjectCode"
							value="#{projectBean.project.projectCode}" size="30"
							requiredMessage="#{msg.requiredMessage}" required="true" maxlength="50">
							<rich:ajaxValidator event="onblur" />
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="projectDetailsProjectCode" /></font></td>
				</tr>

				<!-- Country Suggestion Box -->
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.country}" /></td>
						<td><rich:comboBox id="projectDetailsCountry"
								value="#{projectBean.countryName}"
								defaultLabel="#{msg.enterListDefaultValue}"
								suggestionValues="#{countryBean.allCountries}">
							</rich:comboBox>
						</td>
						<td><font color="#FF0000"><rich:message for="projectDetailsCountry" /></font></td>
					</a4j:region>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.city}" /></td>
					<td>
						<h:inputText id="projectDetailsCity"
							value="#{projectBean.project.city}"  size="50" maxlength="150" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="projectDetailsContactCity" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.description}" /></td>
					<td>
						<h:inputTextarea id="projectDetailsDescription"
							value="#{projectBean.project.description}"  rows="5" cols="100" >
						</h:inputTextarea>
					</td>
					<td><font color="#FF0000"><rich:message for="projectDetailsDescription" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.estimatedStartDate}" /></td>
					<td><rich:calendar id="projectDetailsEstimatedStartDate"
							value="#{projectBean.project.estimatedStartDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="projectDetailsBEstimatedStartDate" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.estimatedEndDate}" /></td>
					<td><rich:calendar id="projectDetailsEstimatedEndDate"
							value="#{projectBean.project.estimatedEndDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="projectDetailsEstimatedEndDate" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.actualStartDate}" /></td>
					<td><rich:calendar id="projectDetailsActualStartDate"
							value="#{projectBean.project.actualStartDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="projectDetailsActualStartDate" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.actualEndDate}" /></td>
					<td><rich:calendar id="projectDetailsActualEndDate"
							value="#{projectBean.project.actualEndDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="projectDetailsActualEndDate" /></font></td>
				</tr>
				
				<tr>
					<td><h:outputText value="#{msg.budget}" /></td>
					<td>
						<h:inputText id="projectDetailsBudget"
							value="#{projectBean.project.budget}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="projectDetailsBudget" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.billHours}" /></td>
					<td>
						<h:inputText id="projectDetailsBillHours"
							value="#{projectBean.project.billHours}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="projectDetailsBillHours" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.nonBillHours}" /></td>
					<td>
						<h:inputText id="projectDetailsNonBillHours"
							value="#{projectBean.project.nonBillHours}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="projectDetailsNonBillHours" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.status}" /></td>
					<td><h:selectOneMenu id="projectDetailsStatus"
						value="#{projectBean.project.status}"
						binding="#{projectBean.myValue}">
						<f:selectItems
							value="#{projectBean.configurationsByGroupName}" />
						<f:attribute name="groupName" value="PROJECT_STATUS" />
					</h:selectOneMenu></td>
					<td><font color="#FF0000"><rich:message for="projectDetailsStatus" /></font>
					</td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}" action="#{projectBean.insert}"
				reRender="projects, gestionProject, projectResultPanel1" oncomplete="#{rich:component('projectResultPanel1')}.show();"/>
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{projectBean.clear}" reRender="gestionProject, projectResultPanel1" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region></a4j:form>

<rich:modalPanel id="projectResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{projectBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{projectBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('projectResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
