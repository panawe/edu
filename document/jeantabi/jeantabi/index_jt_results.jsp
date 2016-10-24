<%@include file="jeantabi/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear">

	<h1>Selectionnez les parametres pour voir les resultats. Veuillez
	vous connecter pour voir les resultats detailles</h1>
	<a4j:form>
	<rich:panel id="bla">
		<a4j:region>
			<table>
				<tr>
					<td><h:outputText value="#{msg.classe}" /></td>
					<td><h:outputText value="#{msg.year }" /></td>
					<td></td>
				</tr>
				<tr>
					<td><rich:comboBox id="levelClass"
						value="#{classementBean.className}"
						suggestionValues="#{levelClassBean.allLevelClasses}">
					</rich:comboBox></td>

					<td><rich:comboBox id="schoolYear"
						value="#{classementBean.year}"
						suggestionValues="#{schoolYearBean.allSchoolYears}">
					</rich:comboBox></td>

					<td><a4j:commandButton value="#{msg.search}"
						onclick="buttonClicked = true; " id="searchButtom"
						action="#{classementBean.fetchAnnualResults}"
						oncomplete="if (#{classementBean.rowCount <= 0}) #{rich:component('resultSearch')}.show();"
						reRender="bla,resultats,summaryGrid" /></td>
				</tr>
			</table>

		</a4j:region>

		<a4j:region>
			<rich:panel id="resultats" rendered="#{classementBean.rowCount > 0}">

				<rich:dataGrid value="#{classementBean.yearSummaries}"
					id="summaryGrid" var="smry" columns="4" elements="8" width="100%">
					<rich:panel bodyClass="pbody">
						<f:facet name="header">
							<h:outputText
								value="#{smry.student.firstName} #{smry.student.lastName}"></h:outputText>
						</f:facet>
						<h:panelGrid columns="2">

							<h:outputText value="#{msg.averageMark }" styleClass="label"></h:outputText>

							<h:outputText value="#{smry.mark}">
								<f:convertNumber pattern="###.##" />
							</h:outputText>
							<h:outputText value="#{msg.rank }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.rankNbr}" />
							<h:outputText value="#{msg.grade }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.gradeName}" />
							<h:outputText value="#{msg.decision }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.decision}" />

						</h:panelGrid>
					</rich:panel>
					<f:facet name="footer">
						<rich:datascroller></rich:datascroller>
					</f:facet>
				</rich:dataGrid>

			</rich:panel>
			<a4j:status
				onstart="if (buttonClicked) {#{rich:component('waitStudent')}.show()}"
				onstop="buttonClicked = false; #{rich:component('waitStudent')}.hide()" />
		</a4j:region>
		</rich:panel> 
	</a4j:form> <rich:modalPanel id="resultSearch" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<a4j:form>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="#{msg.close }"
				action="#{classementBean.doIt}"
				oncomplete=" #{rich:component('resultSearch')}.hide();" /></p>
		</a4j:form>
	</rich:modalPanel> <rich:modalPanel id="waitStudent" autosized="true" width="200"
		height="120" moveable="false" resizeable="false">
		<f:facet name="header">
			<h:outputText value="#{msg.operationInProgress }" />
		</f:facet>
		<h:outputText value="#{msg.oneMomentPlease }" />
	</rich:modalPanel> <!-- ####################################################################################################### -->
	</div>
	</div>
	</div>
	<!-- ####################################################################################################### -->

</f:view>
<%@include file="jeantabi/includes/footer.jsp"%>