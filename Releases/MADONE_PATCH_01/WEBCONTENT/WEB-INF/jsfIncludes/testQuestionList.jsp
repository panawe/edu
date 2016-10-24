
<a4j:form>
	<a4j:region>
		<table width="75%">

			<tr>
				<td><h:outputText value="#{msg.subject }" /></td>
				<td><h:outputText value="#{msg.level }" /></td>
				<td><h:outputText value="#{msg.showMyQuestionsOnly}" /></td>
				<td></td>
			</tr>
			<tr>
				<td><rich:comboBox id="subject1"
					value="#{testBean.subjectNameR}"
					suggestionValues="#{subjectBean.allSubjects}">
				</rich:comboBox></td>
				<td><rich:comboBox id="level1" value="#{testBean.levelNameR}"
					suggestionValues="#{levelBean.allLevels}">
				</rich:comboBox></td>
				<td><h:selectBooleanCheckbox id="showMyQuestionsOnly"
					value="#{testBean.showMyQuestionsOnly}"
					title="#{msg.showMyQuestionsOnly}">
				</h:selectBooleanCheckbox></td>
				<td><a4j:commandButton value="#{msg.search}"
					action="#{testBean.fetchQuestions}" reRender="questionsList"
					oncomplete="if (#{testBean.questionCount <= 0}) #{rich:component('questionResultPanel')}.show(); else #{rich:component('questionsList')}.show();" />

				</td>

				<td><a4j:commandButton value="#{msg.generateQuestions}"
					oncomplete="#{rich:component('questionGenerationPanel')}.show();" />

				</td>

			</tr>
		</table>
	</a4j:region>
</a4j:form>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="questions">
			<rich:dataTable rows="15" value="#{testBean.testQuestions}"
				var="tQuestion" rendered="#{testBean.beOrNotBe}" reRender="ds"
				rowKeyVar="row" id="AssignedQuestions"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.questions}" />
					</h:outputFormat>
				</f:facet>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.question}" />
					</f:facet>
					<h:outputText value="#{tQuestion.question.body}" escape="false" />
				</rich:column>


				<rich:column sortBy="#{tQuestion.score}">
					<f:facet name="header">
						<h:outputText value="#{msg.score}" />
					</f:facet>
					<h:outputText value="#{tQuestion.score}" />
				</rich:column>

				<rich:column filterBy="#{tQuestion.question.rating.name}"
					filterEvent="onkeyup" sortBy="#{tQuestion.question.rating.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.rating}" />
					</f:facet>
					<h:outputText value="#{tQuestion.question.rating.name}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.sequence}" />
					</f:facet>
					<h:outputText value="#{tQuestion.sequence}">
					</h:outputText>
				</rich:column>

				<rich:column width="60">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{testBean.editQuestion}" reRender="viewQuestion,answers"
						oncomplete="#{rich:component('viewQuestion')}.show();">
						<h:graphicImage value="images/view.gif" style="border:0" />
						<f:param name="id" value="#{tQuestion.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{testBean.deleteQuestion}" reRender="questions">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{tQuestion.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>

<rich:modalPanel id="questionGenerationPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<a4j:outputPanel>

			<table width="70%">

				<tr>
					<td><h:outputText value="#{msg.subject }" /></td>
					<td><h:outputText value="#{msg.level }" /></td>
					<td><h:outputText value="#{msg.showMyQuestionsOnly}" /></td>
					<td><h:outputText value="#{msg.nbrOfQuestions}" /></td>
					<td><h:outputText value="#{msg.pointPerQuestion}" /></td>
				</tr>
				<tr>
					<td><rich:comboBox id="subject11"
						value="#{testBean.subjectNameG}"
						suggestionValues="#{subjectBean.allSubjects}">
					</rich:comboBox></td>
					<td><rich:comboBox id="level11" value="#{testBean.levelNameG}"
						suggestionValues="#{levelBean.allLevels}">
					</rich:comboBox></td>
					<td><h:selectBooleanCheckbox id="showMyQuestionsOnly1"
						value="#{testBean.showMyQuestionsOnlyG}"
						title="#{msg.showMyQuestionsOnly}">
					</h:selectBooleanCheckbox></td>

					<td><h:inputText id="nbrOfQuestions"
						value="#{testBean.nbrOfQuestions}">
					</h:inputText></td>
					<td><h:inputText id="pointPerQuestion"
						value="#{testBean.pointPerQuestion}">
					</h:inputText></td>

				</tr>

				<tr>
					<td></td>
					<td></td>
					<td><a4j:commandButton value="#{msg.close }"
						oncomplete="#{rich:component('questionGenerationPanel')}.hide();" /></td>
					<td><a4j:commandButton value="#{msg.generateQuestions}"
						reRender="questions" action="#{testBean.generateQuestions}"
						oncomplete="#{rich:component('questionGenerationPanel')}.hide();" /></td>
				</tr>
			</table>

		</a4j:outputPanel>
	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="questionResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><h:outputText value="#{msg.noResultFound}" /></p>
		<p></p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{testBean.doNothing}" reRender="onlineTestPanel"
			oncomplete="#{rich:component('questionResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="viewQuestion" autosized="true" width="700">
	<f:facet name="header">
		<h:outputText value="#{msg.question}" />
	</f:facet>
	<a4j:form>
		<a4j:region>
			<a4j:outputPanel id="answers">
				<h:outputText escape="false" value="#{testBean.question.body}" />
				<h:outputText value="#{msg.score } " />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<h:outputText value="#{testBean.question.score }" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<h:inputText value="#{testBean.newScore }"
					rendered="#{testBean.tQuestionSelected }" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:commandButton value="#{msg.changeScore }"
					action="#{testBean.changeScore }"
					reRender="scoreChangeError,scoreChangeSuccess,questions"
					rendered="#{testBean.tQuestionSelected }" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<h:outputText value="#{testBean.errorMessage }"
					id="scoreChangeError" rendered="#{testBean.tQuestionSelected }" />
				<h:outputText value="#{testBean.successMessage }"
					id="scoreChangeSuccess" rendered="#{testBean.tQuestionSelected }" />
				<br />

				<rich:dataTable rows="5" value="#{testBean.answers}" var="answer"
					rendered="#{not empty testBean.answers}" reRender="ds"
					rowKeyVar="row"
					style="overflow: hidden; width: 75%; white-space: nowrap;">
					<f:facet name="header">
						<h:outputFormat value="#{msg.listHeader}">
							<f:param value="#{msg.answers}" />
						</h:outputFormat>
					</f:facet>

					<rich:column>
						<f:facet name="header">
							<h:outputText value="#{msg.answer}" />
						</f:facet>
						<h:outputText escape="false" value="#{answer.body}">
						</h:outputText>
					</rich:column>

					<rich:column>
						<f:facet name="header">
							<h:outputText value="#{msg.correct}" />
						</f:facet>
						<h:outputText value="#{answer.correct}" />
					</rich:column>
					<f:facet name="footer">
						<rich:datascroller id="ds"></rich:datascroller>
					</f:facet>
				</rich:dataTable>

			</a4j:outputPanel>

			<p><a4j:commandButton value="#{msg.close }"
				oncomplete="#{rich:component('viewQuestion')}.hide();" /></p>
		</a4j:region>
	</a4j:form>
</rich:modalPanel>



<rich:modalPanel id="questionsList" resizeable="false" height="400"
	autosized="false" width="850">
	<f:facet name="header">
		<h:outputText value="#{msg.questions}" />
	</f:facet>
	<a4j:form>
		<a4j:region>
			<a4j:outputPanel>
				<rich:scrollableDataTable width="800px" height="300px"
					value="#{testBean.questions}" var="question" sortMode="single"
					selection="#{testBean.selectedQuestions}" rowKeyVar="id">

					<rich:column width="600">
						<f:facet name="header">
							<h:outputText value="#{msg.question}" />
						</f:facet>
						<h:outputText escape="false" value="#{question.body}">
						</h:outputText>
					</rich:column>

					<rich:column width="75" filterBy="#{question.rating.name}"
						filterEvent="onkeyup" sortBy="#{question.rating.name}">
						<f:facet name="header">
							<h:outputText value="#{msg.rating}" />
						</f:facet>
						<h:outputText value="#{question.rating.name}" />
					</rich:column>

					<rich:column width="75" sortBy="#{question.score}">
						<f:facet name="header">
							<h:outputText value="#{msg.score}" />
						</f:facet>
						<h:outputText value="#{question.score}" />
					</rich:column>

					<rich:column width="50" sortBy="#{question.score}">
						<a4j:commandLink ajaxSingle="true" id="view"
							action="#{testBean.showQuestionBody}" reRender="viewQuestion"
							oncomplete="#{rich:component('viewQuestion')}.show();">
							<h:graphicImage value="images/view.gif" style="border:0" />
							<f:param name="id" value="#{question.id}" />

						</a4j:commandLink>
					</rich:column>
				</rich:scrollableDataTable>
				<br />
				<a4j:commandButton value="#{msg.saveSelection }"
					reRender="questions" action="#{testBean.addQuestions}"
					oncomplete="#{rich:component('questionsList')}.hide();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:commandButton value="#{msg.close }"
					oncomplete="#{rich:component('questionsList')}.hide();" />
			</a4j:outputPanel>
		</a4j:region>
	</a4j:form>
</rich:modalPanel>
