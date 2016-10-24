	<a4j:form>
	<a4j:region>

		<a4j:outputPanel id="marks">
			<rich:dataTable rows="15" value="#{studentBean.marks}" var="mark"
				rendered="#{studentBean.markCnt>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.marks}" />
					</h:outputFormat>
				</f:facet>
				<rich:column filterBy="#{mark.schoolYear}" filterEvent="onkeyup"
					sortBy="#{mark.schoolYear}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{mark.schoolYear}" />
				</rich:column>
				
				<rich:column filterBy="#{mark.school}" filterEvent="onkeyup"
					sortBy="#{mark.school}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{mark.school}" />
				</rich:column>

				<rich:column filterBy="#{mark.examName}" filterEvent="onkeyup"
					sortBy="#{mark.examName}">
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{mark.examName}" />
				</rich:column>

				<rich:column filterBy="#{mark.examDate}" filterEvent="onkeyup"
					sortBy="#{mark.examDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.examDate}" />
					</f:facet>
					<h:outputText value="#{mark.examDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>
				
			<rich:column filterBy="#{mark.examType}" filterEvent="onkeyup"
				sortBy="#{mark.examType}">
				<f:facet name="header">
					<h:outputText value="#{msg.examType}" />
				</f:facet>
				<h:outputText value="#{mark.examType}" />
			</rich:column>

			<rich:column filterBy="#{mark.subject}" filterEvent="onkeyup"
				sortBy="#{mark.subject}">
				<f:facet name="header">
					<h:outputText value="#{msg.course}" />
				</f:facet>
				<h:outputText value="#{mark.subject}" />
			</rich:column>

			<rich:column filterBy="#{mark.className}" filterEvent="onkeyup"
				sortBy="#{mark.className}">
				<f:facet name="header">
					<h:outputText value="#{msg.level}" />
				</f:facet>
				<h:outputText value="#{mark.className}" />
			</rich:column>				

				<rich:column  filterBy="#{mark.mark}" filterEvent="onkeyup" sortBy="#{mark.mark}">
					<f:facet name="header">
						<h:outputText value="#{msg.mark}" />
					</f:facet>
					<h:outputText value="#{mark.mark}" />
				</rich:column>
				
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.maxMark}" />
					</f:facet>
					<h:outputText value="#{mark.maxMark}">
						<f:convertNumber pattern="#{configurationBean.markFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column  filterBy="#{mark.grade}" filterEvent="onkeyup" sortBy="#{mark.grade}">
					<f:facet name="header">
						<h:outputText value="#{msg.grade}" />
					</f:facet>
					<h:outputText value="#{mark.grade}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>

			<rich:messages />
			<br />

			<font color="#FF0000"> <error> <h:outputText
				value="#{examBean.errorMessage}" /> </error> </font>
			<font color="#00FF00"> <success> <h:outputText
				value="#{examBean.successMessage}" /> </success> </font>
		</a4j:outputPanel>

	</a4j:region>
	</a4j:form>
