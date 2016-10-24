<%@include file="madone/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear">
<a4j:form>
	<h1>Un programme toujours actualise<rich:spacer width="30" height="10"
		title="" /><a4j:commandLink ajaxSingle="true" id="print"
		oncomplete="#{rich:component('printCurriculum')}.show();">
		<h:graphicImage value="madone/images/printer.png" style="border:0" />
	</a4j:commandLink></h1>
	
		<a4j:region>
			<a4j:outputPanel id="curriculums">
				<rich:dataTable
					style="overflow: hidden; width: 100%; white-space: wrap;" rows="10"
					value="#{curriculumBean.currentYearCurriculums}" var="curriculum"
					rendered="#{curriculumBean.rowCountY>0}" reRender="ds"
					rowKeyVar="row">
					<f:facet name="header">
						<h:outputFormat value="#{msg.curriculum}" />
					</f:facet>

					<rich:column filterBy="#{curriculum.level.name}"
						filterEvent="onkeyup" sortBy="#{curriculum.level.name}">
						<f:facet name="header">
							<h:outputText value="#{msg.level}" />
						</f:facet>
						<h:outputText value="#{curriculum.level.name}" />
					</rich:column>

					<rich:column filterBy="#{curriculum.subject.name}"
						filterEvent="onkeyup" sortBy="#{curriculum.subject.name}">
						<f:facet name="header">
							<h:outputText value="#{msg.subject}" />
						</f:facet>
						<h:outputText value="#{curriculum.subject.name}" />
					</rich:column>

					<rich:column filterBy="#{curriculum.weekStartDate}"
						filterEvent="onkeyup" sortBy="#{curriculum.weekStartDate}">
						<f:facet name="header">
							<h:outputText value="#{msg.weekStartDate}" />
						</f:facet>
						<h:outputText value="#{curriculum.weekStartDate}">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</h:outputText>
					</rich:column>

					<rich:column filterBy="#{curriculum.weekNumber}"
						filterEvent="onkeyup" sortBy="#{curriculum.weekNumber}">
						<f:facet name="header">
							<h:outputText value="#{msg.weekNumber}" />
						</f:facet>
						<h:outputText value="#{curriculum.weekNumber}" />
					</rich:column>

					<rich:column>
						<f:facet name="header">
							<h:outputText value="#{msg.objective}" />
						</f:facet>
						<h:outputText escape="false" value="#{curriculum.shortObjective}" />

						<a4j:commandLink ajaxSingle="true" id="readMore"
							rendered="#{curriculum.showObjectiveLink}"
							action="#{curriculumBean.edit}"
							oncomplete="#{rich:component('cObjectivePanel')}.show();"
							reRender="cObjectivePanel" value="#{msg.readMore}">

							<f:param name="id" value="#{curriculum.id}" />
						</a4j:commandLink>
					</rich:column>

					<f:facet name="footer">
						<rich:datascroller id="ds"></rich:datascroller>
					</f:facet>
				</rich:dataTable>

			</a4j:outputPanel>
		</a4j:region>
	</a4j:form> <rich:modalPanel id="cObjectivePanel" autosized="true" width="500">
		<f:facet name="header">
			<h:outputText value="#{msg.objective}" />
		</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink222"
					styleClass="hidelink" />
				<rich:componentControl for="cObjectivePanel" attachTo="hidelink222"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<h:outputText escape="false"
				value="#{curriculumBean.curriculum.objective}" />
			</td>

		</a4j:form>
	</rich:modalPanel> <rich:modalPanel id="printCurriculum" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.print}" />
		</f:facet>
				<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink44"
					styleClass="hidelink" />
				<rich:componentControl for="printCurriculum" attachTo="hidelink44"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<p><h:commandButton id="view" value="#{msg.viewPdf }"
				action="#{curriculumBean.print}" /></p>
		</a4j:form>
	</rich:modalPanel><!-- ####################################################################################################### -->
	</div>
	</div>
	</div>
	<!-- ####################################################################################################### -->

</f:view>
<%@include file="madone/includes/footer.jsp"%>