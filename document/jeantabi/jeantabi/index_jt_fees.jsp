<%@include file="jeantabi/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear">
	<a4j:form>
	      <h1>Des frais abordables pour les parents<rich:spacer width="30" height="10"
		title="" /><a4j:commandLink ajaxSingle="true" id="print"		 
		oncomplete="#{rich:component('printTuition')}.show();">
		<h:graphicImage value="jeantabi/images/printer.png" style="border:0" />
	</a4j:commandLink></h1>

	<a4j:region>
		<a4j:outputPanel id="tuitions">
			<rich:dataTable
				style="overflow: hidden; width: 100%; white-space: wrap;" rows="5"
				value="#{tuitionBean.currentYearTuitions}" var="tuition"
				rendered="#{tuitionBean.rowCountY>0}" reRender="ds" rowKeyVar="row">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.tuitions}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{tuition.level.name}" filterEvent="onkeyup"
					sortBy="#{tuition.level.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.level}" />
					</f:facet>
					<h:outputText value="#{tuition.level.name}" />
				</rich:column>

				<rich:column filterBy="#{tuition.tuitionType.name}" filterEvent="onkeyup"
					sortBy="#{tuition.tuitionType.name}">
					<f:facet name="header">
						<h:outputText value="#{msg.tuitionType}" />
					</f:facet>
					<h:outputText value="#{tuition.tuitionType.name}" />
				</rich:column>
								
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.description}" />
					</f:facet>
					<h:outputText value="#{tuition.description}" />
				</rich:column>


				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.amount}" />
					</f:facet>
					<h:outputText value="#{tuition.amount}">
						<f:convertNumber pattern="### ### ### ### CFA" />
					</h:outputText>
				</rich:column>
								
				<rich:column sortBy="#{tuition.dueDate}">
					<f:facet name="header">
						<h:outputText value="#{msg.dueDate}" />
					</f:facet>
					<h:outputText value="#{tuition.dueDate}">
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</h:outputText>
				</rich:column>
	
				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>


			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
<rich:modalPanel id="printTuition" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.print}" />
		</f:facet>
				<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink44"
					styleClass="hidelink" />
				<rich:componentControl for="printTuition" attachTo="hidelink44"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<p><h:commandButton id="view" value="#{msg.viewPdf }"
				action="#{tuitionBean.print}" /></p>
		</a4j:form>
	</rich:modalPanel>
	<!-- ####################################################################################################### -->
	</div>
	</div>
	</div>
	<!-- ####################################################################################################### -->

</f:view>
<%@include file="jeantabi/includes/footer.jsp"%>