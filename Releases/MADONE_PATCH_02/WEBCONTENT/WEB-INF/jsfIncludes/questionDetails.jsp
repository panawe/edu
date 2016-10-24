<a4j:form>
<a4j:region>
	<a4j:outputPanel id="questionDetail">
		<rich:panel style="overflow: hidden; width: 100%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.question}" />
				</h:outputFormat>
			</f:facet>
			<table class="table">

				<!-- Level Class Suggestion Box -->
				<tr>
					<a4j:region>
						<h:inputHidden value="#{questionBean.question.id}" />
						<td><h:outputText value="#{msg.subject }" /></td>
						<td><rich:comboBox id="subject1"
							value="#{questionBean.subjectName}"
							suggestionValues="#{subjectBean.allSubjects}">
						</rich:comboBox></td>
					</a4j:region>
				</tr>
				<tr>
					<a4j:region>
						 
						<td><h:outputText value="#{msg.level }" /></td>
						<td><rich:comboBox id="level"
							value="#{questionBean.levelName}"
							suggestionValues="#{levelBean.allLevels}">
						</rich:comboBox></td>
					</a4j:region>
				</tr>
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.question}" /></td>
						<td><rich:editor value="#{questionBean.question.body}"
							theme="advanced" plugins="save,paste" width="700">

							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline, cut,copy,paste,pasteword" />
							<f:param name="theme_advanced_toolbar_location" value="top" />
							<f:param name="theme_advanced_toolbar_align" value="left" />ssss
					</rich:editor></td>
					</a4j:region>
				</tr>

				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.answerExplannation}" /></td>
						<td><rich:editor
							value="#{questionBean.question.answerExplannation}"
							theme="advanced" plugins="save,paste" width="700">

							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline, cut,copy,paste,pasteword" />
							<f:param name="theme_advanced_toolbar_location" value="top" />
							<f:param name="theme_advanced_toolbar_align" value="left" />ssss
					</rich:editor></td>
					</a4j:region>
				</tr>
				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.rating}" /></td>
						<td><rich:comboBox id="rating"
							value="#{questionBean.ratingName}"
							suggestionValues="#{ratingBean.allRatings}">
						</rich:comboBox></td>
					</a4j:region>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.displayNbrAnswer}" /></td>
					<td><h:selectBooleanCheckbox id="displayNbrAnswer"
						value="#{questionBean.question.displayNbrAnswer}"
						title="#{msg.displayNbrAnswer}">
					</h:selectBooleanCheckbox></td>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.makePublic}" /></td>
					<td><h:selectBooleanCheckbox id="isPublic"
						value="#{questionBean.question.isPublic}"
						title="#{msg.makePublic}">
					</h:selectBooleanCheckbox></td>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.score}" /></td>
					<td><h:inputText id="score1"
						value="#{questionBean.question.score}">
					</h:inputText></td>
				</tr>

			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{questionBean.insert}" reRender="questions,questionDetail,questionModalPanel" 
				oncomplete="#{rich:component('questionModalPanel')}.show();"/>
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{questionBean.clear}" reRender="questionDetail" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>

<rich:modalPanel id="questionModalPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<br />

		<font color="#FF0000"> <error> <h:outputText
			value="#{questionBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{questionBean.successMessage}" /> </success> </font>

		<br /><br />
		<a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('questionModalPanel')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>