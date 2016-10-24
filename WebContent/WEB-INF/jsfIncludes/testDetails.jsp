<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="testDetails">
			<rich:panel
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.test}" />
					</h:outputFormat>
				</f:facet>


				<table class="table" cellpadding="10">
					<tr>
						<td valign="top">
						<table>

							<tr>
								<td><h:outputText value="#{msg.dueDate}" /></td>

								<td><rich:calendar id="examDate"
									value="#{testBean.test.dueDate}" locale="fr" popup="true"
									datePattern="dd/MM/yyyy" showFooter="false"
									showApplyButton="false" cellWidth="24px" cellHeight="22px"
									style="width:200px">
									<f:convertDateTime pattern="dd/MM/yyyy" />
								</rich:calendar></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.title}" /></td>
								<td><h:inputText id="title" value="#{testBean.test.title}"
									size="50" maxlength="100">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
							</tr>
							<tr>
								<td><h:inputHidden value="#{testBean.test.id}" /> <h:outputText
									value="#{msg.description}" /></td>
								<td><rich:editor value="#{testBean.test.description}"
									theme="advanced" plugins="save,paste" width="400">

									<f:param name="theme_advanced_buttons1"
										value="bold,italic,underline, cut,copy,paste,pasteword" />
									<f:param name="theme_advanced_toolbar_location" value="top" />
									<f:param name="theme_advanced_toolbar_align" value="left" /> 
					</rich:editor></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.testBeginMessage}" /></td>
								<td><rich:editor value="#{testBean.test.beginMessage}"
									theme="advanced" plugins="save,paste" width="400">

									<f:param name="theme_advanced_buttons1"
										value="bold,italic,underline, cut,copy,paste,pasteword" />
									<f:param name="theme_advanced_toolbar_location" value="top" />
									<f:param name="theme_advanced_toolbar_align" value="left" /> 
					</rich:editor></td>
							</tr>

						</table>
						</td>
						<td valign="top">
						<table>

							<tr>

								<td><h:outputText value="#{msg.subject}" /></td>
								<td><rich:comboBox id="subject"
									value="#{testBean.subjectName}" directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									suggestionValues="#{subjectBean.allSubjects}">
								</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>

							</tr>

							<tr>
								<td><h:outputText value="#{msg.level}:" /></td>
								<td><rich:comboBox id="level"
									suggestionValues="#{levelBean.allLevels}"
									directInputSuggestions="true"
									defaultLabel="#{msg.enterListDefaultValue}"
									value="#{testBean.levelName}" /> <font color="#FF0000"><rich:message
									for="level" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.score}" /></td>
								<td><h:outputText id="score" value="#{testBean.test.score}"/>
								 </td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.certificateScore}" /></td>
								<td><h:inputText id="certificateScore"
									value="#{testBean.test.certificateScore}" size="30"
									maxlength="6">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
							</tr>



							<tr>
								<td><h:outputText value="#{msg.duration}" /></td>
								<td><h:inputText id="duration"
									value="#{testBean.test.duration}" size="30" maxlength="6">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.resultDays}" /></td>
								<td><h:inputText id="resultDays"
									value="#{testBean.test.resultDays}" size="30" maxlength="6">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.makePublic}" /></td>
								<td><h:selectBooleanCheckbox id="makePublic"
									value="#{testBean.test.isPublic}" title="#{msg.makePublic}">
								</h:selectBooleanCheckbox></td>
							</tr>


							<tr>
								<td><h:outputText value="#{msg.showAllAnswers}" /></td>
								<td><h:selectBooleanCheckbox id="showAllAnswers"
									value="#{testBean.test.showAllAnswers}"
									title="#{msg.showAllAnswers}">
								</h:selectBooleanCheckbox></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.allowMultipleTrial}" /></td>
								<td><h:selectBooleanCheckbox id="allowMultipleTrial"
									value="#{testBean.test.allowMultipleTrial}"
									title="#{msg.allowMultipleTrial}">
								</h:selectBooleanCheckbox></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.canContinueLater}" /></td>
								<td><h:selectBooleanCheckbox id="canContinueLater"
									value="#{testBean.test.canContinueLater}"
									title="#{msg.canContinueLater}">
								</h:selectBooleanCheckbox></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.showLiveScore}" /></td>
								<td><h:selectBooleanCheckbox id="showLiveScore"
									value="#{testBean.test.showLiveScore}"
									title="#{msg.showLiveScore}">
								</h:selectBooleanCheckbox></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.showPoints}" /></td>
								<td><h:selectBooleanCheckbox id="showPoints"
									value="#{testBean.test.showPoints}"
									title="#{msg.showPoints}">
								</h:selectBooleanCheckbox></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.showRating}" /></td>
								<td><h:selectBooleanCheckbox id="showrating"
									value="#{testBean.test.showRating}" title="#{msg.showRating}">
								</h:selectBooleanCheckbox></td>
							</tr>


							<tr>
								<td><h:outputText value="#{msg.systemGenerated}" /></td>
								<td><h:selectBooleanCheckbox id="systemGenerated"
									value="#{testBean.test.systemGenerated}"
									title="#{msg.systemGenerated}" disabled="true">
								</h:selectBooleanCheckbox></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.testEndMessage}" /></td>
								<td><rich:editor value="#{testBean.test.endMessage}"
									theme="advanced" plugins="save,paste" width="400">

									<f:param name="theme_advanced_buttons1"
										value="bold,italic,underline, cut,copy,paste,pasteword" />
									<f:param name="theme_advanced_toolbar_location" value="top" />
									<f:param name="theme_advanced_toolbar_align" value="left" />ssss
					</rich:editor></td>
							</tr>


						</table>
						</td>
					</tr>
				</table>
				<a4j:commandButton value="#{msg.save}" action="#{testBean.insert}"
					reRender="onlineTestPanel,testResultModalPanel"
					oncomplete="#{rich:component('testResultModalPanel')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}" action="#{testBean.clear}"
						reRender="testDetails" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="testResultModalPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<br />

		<font color="#FF0000"> <error> <h:outputText
			value="#{testBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{testBean.successMessage}" /> </success> </font>

		<br />
		<br />
		<a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('testResultModalPanel')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>