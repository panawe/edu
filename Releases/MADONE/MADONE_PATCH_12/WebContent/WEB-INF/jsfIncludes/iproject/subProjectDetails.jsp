<a4j:form><a4j:region>
	<a4j:outputPanel id="gestionSubProject">
		<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.subProject}"/>
	        	</h:outputFormat>
		    </f:facet>
			<table class="table">
				<tr>
					<td><h:outputText value="#{msg.subProjectCode}" /><font color="#FF0000">*</font></td>
					<td>
						<h:inputText id="subProjectDetailsSubProjectCode"
							value="#{subProjectBean.subProject.subProjectCode}" size="30"
							requiredMessage="#{msg.requiredMessage}" required="true" maxlength="50">
							<rich:ajaxValidator event="onblur" />
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsSubProjectCode" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.description}" /></td>
					<td>
						<h:inputTextarea id="subProjectDetailsDescription"
							value="#{subProjectBean.subProject.description}"  rows="5" cols="100" >
						</h:inputTextarea>
					</td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsDescription" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.estimatedStartDate}" /></td>
					<td><rich:calendar id="subProjectDetailsEstimatedStartDate"
							value="#{subProjectBean.subProject.estimatedStartDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsEstimatedStartDate" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.estimatedEndDate}" /></td>
					<td><rich:calendar id="subProjectDetailsEstimatedEndDate"
							value="#{subProjectBean.subProject.estimatedEndDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsEstimatedEndDate" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.actualStartDate}" /></td>
					<td><rich:calendar id="subProjectDetailsActualStartDate"
							value="#{subProjectBean.subProject.actualStartDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsActualStartDate" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.actualEndDate}" /></td>
					<td><rich:calendar id="subProjectDetailsActualEndDate"
							value="#{subProjectBean.subProject.actualEndDate}" locale="fr"
							popup="true" datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px, border-color : blue;">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsActualEndDate" /></font></td>
				</tr>
				
				<tr>
					<td><h:outputText value="#{msg.budget}" /></td>
					<td>
						<h:inputText id="subProjectDetailsBudget"
							value="#{subProjectBean.subProject.budget}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsBudget" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.billHours}" /></td>
					<td>
						<h:inputText id="subProjectDetailsBillHours"
							value="#{subProjectBean.subProject.billHours}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsBillHours" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.nonBillHours}" /></td>
					<td>
						<h:inputText id="subProjectDetailsNonBillHours"
							value="#{subProjectBean.subProject.nonBillHours}"  size="12" maxlength="12" >
						</h:inputText>
					</td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsNonBillHours" /></font></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.status}" /></td>
					<td><h:selectOneMenu id="subProjectDetailsStatus"
						value="#{subProjectBean.subProject.status}"
						binding="#{subProjectBean.mySecondValue}">
						<f:selectItems
							value="#{subProjectBean.configurationsByGroupName}" />
						<f:attribute name="groupName" value="PROJECT_STATUS" />
					</h:selectOneMenu></td>
					<td><font color="#FF0000"><rich:message for="subProjectDetailsStatus" /></font>
					</td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}" action="#{subProjectBean.insert}"
				reRender="subProjects, gestionSubProject, subProjectResultPanel1" oncomplete="#{rich:component('subProjectResultPanel1')}.show();"/>
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{subProjectBean.clear}" reRender="gestionSubProject, subProjectResultPanel1" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region></a4j:form>

<rich:modalPanel id="subProjectResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{subProjectBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{subProjectBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close}" immediate="true"
			oncomplete="#{rich:component('subProjectResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
