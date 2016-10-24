
<a4j:form>
	<a4j:region>

		<a4j:outputPanel id="marks">
			<rich:dataTable rows="15" value="#{studentBean.bulletins}" var="bull"
				rendered="#{studentBean.bullCnt>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.averages}">
					</h:outputFormat>
				</f:facet>
				<rich:column filterBy="#{bull.schoolYear.year}"
					filterEvent="onkeyup" sortBy="#{bull.schoolYear.year}">
					<f:facet name="header">
						<h:outputText value="#{msg.year}" />
					</f:facet>
					<h:outputText value="#{bull.schoolYear.year}" />
				</rich:column>
				
				<rich:column filterBy="#{bull.term.name}"
					filterEvent="onkeyup" sortBy="#{bull.term.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.term}" />
					</f:facet>
					<h:outputText value="#{bull.term.name}" />
				</rich:column>

				<rich:column filterBy="#{bull.school.name}" filterEvent="onkeyup"
					sortBy="#{bull.school.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{bull.school.name}" />
				</rich:column>

				<rich:column filterBy="#{bull.level.name}" filterEvent="onkeyup"
					sortBy="#{bull.level.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{bull.level.name}" />
				</rich:column>

				<rich:column filterBy="#{bull.className}" filterEvent="onkeyup"
					sortBy="#{bull.className}">
					<f:facet name="header">
						<h:outputText value="#{msg.levelClass}" />
					</f:facet>
					<h:outputText value="#{bull.className}" />
				</rich:column>

				<rich:column filterBy="#{bull.mark}" filterEvent="onkeyup"
					sortBy="#{bull.mark}">
					<f:facet name="header">
						<h:outputText value="#{msg.averageMark}" />

					</f:facet>
					<h:outputText value="#{bull.mark}">
						<f:convertNumber pattern="#{configurationBean.markFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column filterBy="#{bull.rankNbr}" filterEvent="onkeyup"
					sortBy="#{bull.rankNbr}">
					<f:facet name="header">
						<h:outputText value="#{msg.rank}" />
					</f:facet>
					<h:outputText value="#{bull.rankNbr}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.studentCount}" />
					</f:facet>
					<h:outputText value="#{bull.nbrStudent}" />
				</rich:column>

				<rich:column filterBy="#{bull.gradeName}" filterEvent="onkeyup"
					sortBy="#{bull.gradeName}">
					<f:facet name="header">
						<h:outputText value="#{msg.grade}" />
					</f:facet>
					<h:outputText value="#{bull.gradeName}" />
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
		</a4j:outputPanel>

	</a4j:region>
</a4j:form>
