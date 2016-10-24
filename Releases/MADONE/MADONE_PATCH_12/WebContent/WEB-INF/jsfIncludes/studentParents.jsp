<a4j:form>
<a4j:commandButton value="#{msg.addParent}"
	action="#{studentBean.searchParents}" onclick="buttonClicked = true;"
	reRender="parentShutle,parentsPanel"
	oncomplete="#{rich:component('parentsPanel')}.show();" />
<rich:spacer width="40" height="10" title="" />
<a4j:commandButton value="#{msg.newParent}"
	action="#{studentBean.doNothing}" onclick="buttonClicked = true;"
	reRender="newParentPanel"
	oncomplete="#{rich:component('newParentPanel')}.show();" />
	
<%@include file="/WEB-INF/jsfIncludes/parentAssignedToStudentList.jsp"%>

</a4j:form>

<rich:modalPanel id="parentsPanel" autosized="true" width="300" >
	<f:facet name="header">
		<h:outputText value="#{msg.addParent}" />
	</f:facet>
		<p><%@include file="/WEB-INF/jsfIncludes/studentParentDetails.jsp"%>
		</p>
	<a4j:form>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{parentBean.doNothing}" reRender="parents"
			oncomplete="#{rich:component('parentsPanel')}.hide()" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="newParentPanel" autosized="true" width="500">
	<f:facet name="header">
		<h:outputText value="#{msg.newParent}" />
	</f:facet>
	<a4j:form>
		<table class="table">

			<tr>
				<td><h:outputText value="#{msg.parentType}">
						<font color="#FF0000">*</font>
					</h:outputText></td>
				<td><h:selectOneMenu required="true"
						value="#{parentBean.parent.parentType}"
						binding="#{parentBean.mySecondValue}">
						<f:selectItems value="#{parentBean.configsByGroupName}" />
						<f:attribute name="groupName" value="PARENT_TYPE" />
					</h:selectOneMenu></td>
				<td><font color="#FF0000"><rich:message for="parentType" /></font>
				</td>
			</tr>

			<tr>
				<td><h:inputHidden value="#{parentBean.parent.id}" /> <h:outputText
						value="#{msg.name}:" /></td>
				<td><h:inputText id="lastName"
						value="#{parentBean.parent.lastName}" size="50" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="lastName" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.firstName}:" /></td>
				<td><h:inputText id="firstName"
						value="#{parentBean.parent.firstName}" size="50" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="firstName" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.middleName}:" /></td>
				<td><h:inputText id="middleName"
						value="#{parentBean.parent.middleName}" size="25" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="middleName" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.address}:" /></td>
				<td><h:inputText id="address"
						value="#{parentBean.parent.address}" size="50" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="address" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.city}:" /></td>
				<td><h:inputText id="city" value="#{parentBean.parent.city}"
						size="50" maxlength="50" onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="city" /></font></td>
			</tr>
			<tr>
				<a4j:region>
					<td><h:outputText value="#{msg.country}:" /><font
						color="#FF0000">*</font></td>
					<td><rich:comboBox id="country"
							value="#{parentBean.countryName}"
							defaultLabel="#{msg.enterListDefaultValue}"
							suggestionValues="#{countryBean.allCountries}"
							requiredMessage="#{msg.requiredMessage}" required="true">
						</rich:comboBox></td>
					<td><font color="#FF0000"><rich:message for="country" /></font></td>
				</a4j:region>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.phone}:" /></td>
				<td><h:inputText id="telephone"
						value="#{parentBean.parent.telephone}" size="20" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="telephone" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.email}:" /></td>
				<td><h:inputText id="email" value="#{parentBean.parent.email}"
						size="50" maxlength="50" onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="email" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.profession}:" /></td>
				<td><h:inputText id="profession"
						value="#{parentBean.parent.profession}" size="20" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="profession" /></font>
				</td>
			</tr>
			<tr>
				<td><h:outputText value="#{msg.workPlace}:" /></td>
				<td><h:inputText id="workPlace"
						value="#{parentBean.parent.workPlace}" size="20" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
				<td><font color="#FF0000"><rich:message for="workPlace" /></font>
				</td>
			</tr>

		</table>

		<a4j:commandButton value="#{msg.save}" action="#{parentBean.insert}"
			rendered="#{ schoolBean.userHasWriteAccess }"
			reRender="parents, gestionParent" />
		<SPACER TYPE=HORIZONTAL SIZE=50> <a4j:commandButton
			value="#{msg.clear}" action="#{parentBean.clear}"
			reRender="gestionParent, students" /> <SPACER TYPE=HORIZONTAL
			SIZE=50> <a4j:commandButton value="#{msg.close }"
			action="#{parentBean.doNothing}" reRender="parents"
			oncomplete="#{rich:component('newParentPanel')}.hide()" />
	</a4j:form>

</rich:modalPanel>
