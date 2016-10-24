<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="userProfile">
			<rich:panel header="#{msg.profile }"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<table class="table">
					<tr>
						<td><h:inputHidden value="#{userBean.user.userName}" /> <h:outputText
							value="#{msg.userName } " /></td>
						<td><h:inputText id="nomUtilisateur"
							disabled="#{link != 'security' }"
							value="#{userBean.user.userName}" /></td>
						<td><font color="#FF0000"><rich:message
							for="nomUtilisateur" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.password }" /></td>
						<td><h:inputSecret id="motDePasse"
							value="#{userBean.user.password}" maxlength="15" size="30">
							<rich:ajaxValidator event="onblur" />
						</h:inputSecret></td>
						<td><font color="#FF0000"><rich:message
							for="motDePasse" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.name }" /></td>
						<td><h:inputText id="nom" value="#{userBean.user.lastName}"
							maxlength="50" size="35" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="nom" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.firstName } " /></td>
						<td><h:inputText id="prenom"
							value="#{userBean.user.firstName}" maxlength="50" size="35"
							onchange="convertFirstLetterToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="prenom" /></font>
						</td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.email }" /></td>
						<td><h:inputText id="e-mail" value="#{userBean.user.email}"
							maxlength="50" size="50">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="e-mail" /></font>
						</td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.phone }" /></td>
						<td><h:inputText id="telephone"
							value="#{userBean.user.phone}" maxlength="30" size="20">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message
							for="telephone" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.position}" /></td>
						<td><rich:comboBox id="position"
							suggestionValues="#{positionBean.positions}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{userBean.positionName}" /></td>

						<td><font color="#FF0000"><rich:message for="position" /></font></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.language}" /></td>
						<td><h:selectOneMenu id="currentLocale"
							value="#{userBean.user.currentLocale}"
							binding="#{userBean.myValue}">
							<f:selectItems value="#{userBean.configurationsByGroupName}" />
							<f:attribute name="groupName" value="LOCALE" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message
							for="currentLocale" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.pageSkin }" /></td>
						<td><h:selectOneMenu id="pageSkin"
							value="#{userBean.user.pageSkin}">
							<f:selectItem itemValue="plain" itemLabel="#{msg.plain }" />
							<f:selectItem itemValue="emeraldTown"
								itemLabel="#{msg.emeraldTown }" />
							<f:selectItem itemValue="blueSky" itemLabel="#{msg.blueSky }" />
							<f:selectItem itemValue="wine" itemLabel="#{msg.wine }" />
							<f:selectItem itemValue="japanCherry"
								itemLabel="#{msg.japanCherry}" />
							<f:selectItem itemValue="ruby" itemLabel="#{msg.ruby }" />
							<f:selectItem itemValue="classic" itemLabel="#{msg.classic}" />
							<f:selectItem itemValue="deepMarine"
								itemLabel="#{msg.deepMarine }" />
							<f:selectItem itemValue="laguna" itemLabel="#{msg.laguna}" />
						</h:selectOneMenu></td>
						<td><font color="#FF0000"><rich:message for="pageSkin" /></font>
						</td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save }"
					action="#{userBean.saveProfile}" rendered="#{link == 'security'}"
					reRender="userProfile, users,userProfileResultPanel"
					oncomplete="#{rich:component('userProfileResultPanel')}.show();">
					<f:param name="provenance" value="security" />
				</a4j:commandButton>

				<a4j:commandButton value="#{msg.save}"
					action="#{userBean.saveProfile}"
					rendered="#{(link=='student' && studentBean.student.school.id == user.school.id && studentBean.userHasWriteAccess)||(studentBean.student.user.id == user.id)}"
					reRender="userProfile,userProfileResultPanel"
					oncomplete="#{rich:component('userProfileResultPanel')}.show();">
					<f:param name="provenance" value="student" />
				</a4j:commandButton>

				<a4j:commandButton value="#{msg.save}"
					action="#{userBean.saveProfile}"
					rendered="#{(link=='teacher' && teacherBean.teacher.school.id == user.school.id && teacherBean.userHasWriteAccess)||(teacherBean.teacher.user.id == user.id)}"
					reRender="userProfile,userProfileResultPanel"
					oncomplete="#{rich:component('userProfileResultPanel')}.show();">
					<f:param name="provenance" value="teacher" />
				</a4j:commandButton>

				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						rendered="#{link == 'security'}" action="#{userBean.clear}"
						reRender="userProfile, users" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="userProfileResultPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>

		<font color="#FF0000"> <error> <h:outputText
			value="#{userBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{userBean.successMessage}" /> </success> </font>
		<br />

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('userProfileResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>