<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="pastCourses">
			<rich:dataTable rows="5" value="#{courseBean.pastCourses}" var="course"
				rendered="#{courseBean.pastCourseCnt>0}" reRender="ds" rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.courses}" />
					</h:outputFormat>
				</f:facet>
				<rich:column filterBy="#{course.school.name}"
					filterEvent="onkeyup" sortBy="#{course.school.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{course.school.name}" />
				</rich:column>
				
				<rich:column filterBy="#{course.levelClass.name}"
					filterEvent="onkeyup" sortBy="#{course.levelClass.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.levelClass}" />
					</f:facet>
					<h:outputText value="#{course.levelClass.name}" />
				</rich:column>

				<rich:column filterBy="#{course.subject.name}" filterEvent="onkeyup"
					sortBy="#{course.subject.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.subject}" />
					</f:facet>
					<h:outputText value="#{course.subject.name}" />
				</rich:column>

				<rich:column filterBy="#{course.beginDate}" filterEvent="onkeyup"
					sortBy="#{course.beginDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.beginDate}" />
					</f:facet>
					<h:outputText value="#{course.beginDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column filterBy="#{course.endDate}" filterEvent="onkeyup"
					sortBy="#{course.endDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.endDate}" />
					</f:facet>
					<h:outputText value="#{course.endDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText>
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.maxMark}" />
					</f:facet>
					<h:outputText value="#{course.maxMark}">
						<f:convertNumber pattern="#{configurationBean.markFormat}" />
					</h:outputText>
				</rich:column>

				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />
			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>