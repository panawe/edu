<a4j:form>
<a4j:region>
	<a4j:outputPanel id="answers">
		<rich:dataTable rows="15" value="#{questionBean.answers}"
			var="answer" rendered="#{questionBean.rowCount>0}"
			reRender="ds" rowKeyVar="row"
			style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.listHeader}">
					<f:param value="#{msg.answers}" />
				</h:outputFormat>
			</f:facet>

			<rich:column filterBy="#{answer.seqAnswer}" filterEvent="onkeyup"
				sortBy="#{answer.seqAnswer}" width="20">
				<f:facet name="header">
					<h:outputText value="#{msg.sequence}" />
				</f:facet>
				<h:outputText value="#{answer.seqAnswer}" />
			</rich:column>

			<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.answer}" />
				</f:facet>
				<h:outputText escape="false"
					value="#{answer.body}">
				</h:outputText>
			</rich:column>


			<rich:column width="20">
				<f:facet name="header">
					<h:outputText value="#{msg.correct}" />
				</f:facet>
				<h:outputText value="#{answer.correct}" />
			</rich:column>


			<rich:column width="60">
				<f:facet name="header">
					<h:outputText value="#{msg.actions }" />
				</f:facet>
				<a4j:commandLink ajaxSingle="true" id="modify"
					action="#{questionBean.editAnswer}" reRender="answerDetail">
					<h:graphicImage value="images/edit.gif" style="border:0" />
					<f:param name="id" value="#{answer.id}" />
				</a4j:commandLink>
				
				<rich:spacer width="20" height="10" title="" />
				
				<a4j:commandLink ajaxSingle="true" id="delete"
					action="#{questionBean.deleteAnswer}" reRender="answerDetail,answers">
					<h:graphicImage value="/images/delete.gif" style="border:0" />
					<f:param name="id" value="#{answer.id}" />
				</a4j:commandLink>

				<rich:toolTip for="modify" value="#{msg.modify}" />
				<rich:toolTip for="delete" value="#{msg.delete}" />
			</rich:column>

			<f:facet name="footer">
				<rich:datascroller id="ds"></rich:datascroller>
			</f:facet>
		</rich:dataTable>
		<br />

		<font color="#FF0000"> <error> <h:outputText
			value="#{questionBean.errorMessage}" /> </error> </font>
		<font color="#00FF00"> <success> <h:outputText
			value="#{questionBean.successMessage}" /> </success> </font>
		<br />
	</a4j:outputPanel>
</a4j:region>
</a4j:form>

<a4j:form>
<a4j:region>
	<a4j:outputPanel id="answerDetail">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.answer}" />
				</h:outputFormat>
			</f:facet>
			<table class="table">


				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.answer}" /></td>
						<td><rich:editor value="#{questionBean.answer.body}"
							theme="advanced" plugins="save,paste" width="700">

							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline, cut,copy,paste,pasteword" />
							<f:param name="theme_advanced_toolbar_location" value="top" />
							<f:param name="theme_advanced_toolbar_align" value="left" /> 
					</rich:editor></td>
					</a4j:region>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.correct}" /></td>
					<td><h:selectBooleanCheckbox id="correctAnswer"
						value="#{questionBean.answer.correct}"
						title="#{msg.correct}">
					</h:selectBooleanCheckbox></td>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.sequence}" /></td>
					<td><h:inputText id="score2"
						value="#{questionBean.answer.seqAnswer}">
					</h:inputText></td>
				</tr>


			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{questionBean.addAnswer}" reRender="answers,answerDetail" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{questionBean.clearAnswer}" reRender="answerDetail" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>
