<%@include file="madone/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear">
<a4j:form>
	<h1>Liste des Fournitures <rich:spacer width="30" height="10"
		title="" /><a4j:commandLink ajaxSingle="true" id="print"
		oncomplete="#{rich:component('printFourniture')}.show();">
		<h:graphicImage value="madone/images/printer.png" style="border:0" />
	</a4j:commandLink></h1>
	
		<a4j:region>
			<a4j:outputPanel id="furnitures">
				<rich:dataTable
					style="overflow: hidden; width: 100%; white-space: wrap;" rows="10"
					value="#{furnitureBean.currentYearFurnitures}" var="furniture"
					rendered="#{furnitureBean.rowCountY>0}" reRender="ds"
					rowKeyVar="row">
					<f:facet name="header">
						<h:outputFormat value="#{msg.furniture}" />
					</f:facet>

					<rich:column filterBy="#{furniture.level.name}"
						filterEvent="onkeyup" sortBy="#{furniture.level.name}">
						<f:facet name="header">
							<h:outputText value="#{msg.level}" />
						</f:facet>
						<h:outputText value="#{furniture.level.name}" />
					</rich:column>

					<rich:column filterBy="#{furniture.subject.name}"
						filterEvent="onkeyup" sortBy="#{furniture.subject.name}">
						<f:facet name="header">
							<h:outputText value="#{msg.subject}" />
						</f:facet>
						<h:outputText value="#{furniture.subject.name}" />
					</rich:column>

					<rich:column>
						<f:facet name="header">
							<h:outputText value="#{msg.furniture}" />
						</f:facet>
						<h:outputText escape="false" value="#{furniture.description}" />

					</rich:column>

					<f:facet name="footer">
						<rich:datascroller id="ds"></rich:datascroller>
					</f:facet>
				</rich:dataTable>

			</a4j:outputPanel>
		</a4j:region>
	</a4j:form> <rich:modalPanel id="printFourniture" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.print}" />
		</f:facet>
				<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink33"
					styleClass="hidelink" />
				<rich:componentControl for="printFourniture" attachTo="hidelink33"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<p><h:commandButton id="view" value="#{msg.viewPdf }"
				action="#{furnitureBean.print}" /></p>
		</a4j:form>
	</rich:modalPanel> <!-- ####################################################################################################### -->
	</div>
	</div>
	</div>
	<!-- ####################################################################################################### -->

</f:view>
<%@include file="madone/includes/footer.jsp"%>