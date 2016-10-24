<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="bulletinPanel">
			<rich:tab id="schoolDetail" label="#{msg.printing}">
				<a4j:form>
					<a4j:region>
						<table>
							<tr>
								<td><h:outputText value="#{msg.classe}" /></td>
								<td><h:outputText value="#{msg.year }" /></td>
								<td><h:outputText value="#{msg.term}" /></td>
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

								<td><rich:comboBox id="term"
									value="#{classementBean.termName}"
									suggestionValues="#{termBean.allTerms}" /></td>

								<td><a4j:commandButton value="#{msg.search}"
									rendered="#{classementBean.userHasWriteAccess}"
									onclick="buttonClicked = true; " id="searchButtom"
									action="#{classementBean.fetchTermResults}"
									oncomplete="if (#{classementBean.rowCount <= 0}) #{rich:component('resultSearch')}.show();"
									reRender="resultats,summaryGrid,bulletinPanel" /></td>

							</tr>
						</table>

					</a4j:region>

					<a4j:region>
						<rich:panel id="resultats"
							rendered="#{classementBean.rowCount > 0}">
							<f:facet name="header">
								<h:outputText
									value="#{classementBean.termResult.yearName } || #{classementBean.termResult.termName} || Moyenne: #{classementBean.termResult.moyenne} || Forte Moyenne:  #{classementBean.termResult.maxMoyenne} || Faible Moyenne:  #{classementBean.termResult.minMoyenne}"></h:outputText>
							</f:facet>

							<rich:dataGrid value="#{classementBean.resultSummaries}"
								id="summaryGrid" var="smry" columns="5" elements="5"
								width="100%">
								<rich:panel bodyClass="pbody">
									<f:facet name="header">
										<h:outputText value="#{smry.studentName}"></h:outputText>
									</f:facet>
									<h:panelGrid columns="2">
										<h:outputText value="#{msg.averageMark }" styleClass="label"></h:outputText>
										<h:outputText value="#{smry.moyenne}">
											<f:convertNumber pattern="#{configurationBean.markFormat}" />
										</h:outputText>
										<h:outputText value="#{msg.rank }" styleClass="label"></h:outputText>
										<h:outputText value="#{smry.rank}" />
										<a4j:commandLink ajaxSingle="true" id="modify"
											action="#{classementBean.getDetails}"
											oncomplete="#{rich:component('resultPanelStudent')}.show();"
											reRender="resultPanelStudent" value="#{msg.viewAllMarks }">

											<f:param name="id" value="#{smry.studentId}" />
										</a4j:commandLink>
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
				</a4j:form>
			</rich:tab>
		</rich:tabPanel> <rich:modalPanel id="resultPanelStudent" autosized="true" width="800"
			height="300">
			<f:facet name="header">
				<h:outputText value="#{classementBean.resultSmry.studentName} " />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage value="/images/close.png" id="hidelink"
						styleClass="hidelink" />
					<rich:componentControl for="resultPanelStudent" attachTo="hidelink"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<a4j:form>
				<a4j:outputPanel ajaxRendered="true">
					<h:panelGroup id="infoImageHeader2">
						<a4j:mediaOutput element="img" session="false"
							mimeType="image/gif" style="width:100px; height:100px;"
							createContent="#{classementBean.paintStudent}"
							value="#{classementBean.random}" cacheable="false">
						</a4j:mediaOutput>
					</h:panelGroup>
				</a4j:outputPanel>

				<rich:scrollableDataTable id="carList" width="800px" height="300px"
					value="#{classementBean.resultSmry.termResultDtl}" var="notes"
					sortMode="single">

					<rich:column id="subjectName">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Matiere" />
						</f:facet>
						<h:outputText value="#{notes.subjectName}" />
					</rich:column>
					<rich:column id="maxMark">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Note Sur" />
						</f:facet>
						<h:outputText value="#{notes.maxMark}" />
					</rich:column>
					<rich:column id="moyenneClasse">
						<f:facet name="header">
							<h:outputText styleClass="headerText"
								value="Moyenne de la classe" />
						</f:facet>
						<h:outputText value="#{notes.moyenneClasse}" />
					</rich:column>
					<rich:column id="ratioClass">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="%" />
						</f:facet>
						<h:outputText value="#{notes.ratioClass}" />
					</rich:column>
					<rich:column id="moyenneExam">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Moyenne Examen" />
						</f:facet>
						<h:outputText value="#{notes.moyenneExam}" />
					</rich:column>
					<rich:column id="ratioExam">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="%" />
						</f:facet>
						<h:outputText value="#{notes.ratioExam}" />
					</rich:column>
					<rich:column id="moyenne">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Moyenne" />
						</f:facet>
						<h:outputText value="#{notes.moyenne}" />
					</rich:column>
					<rich:column id="teacherName">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Professeur" />
						</f:facet>
						<h:outputText value="#{notes.teacherName}" />
					</rich:column>
				</rich:scrollableDataTable>

				<p><a4j:commandButton value="#{msg.close }"
					action="#{classementBean.doIt}"
					oncomplete=" #{rich:component('resultPanelStudent')}.hide();" /></p>
			</a4j:form>
		</rich:modalPanel> <rich:modalPanel id="resultSearch" autosized="true" width="300">
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
		</rich:modalPanel></td>
	</tr>



	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>