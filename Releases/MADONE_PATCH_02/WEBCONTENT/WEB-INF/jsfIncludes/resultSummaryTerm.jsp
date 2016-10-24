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
						action="#{classementBean.fetchTermsResults}"
						oncomplete="if (#{classementBean.rowCount <= 0}) #{rich:component('resultSearch')}.show();"
						reRender="resultats, summaryGrid" /></td>

				</tr>
			</table>

		</a4j:region>

		<a4j:region>
			<rich:panel id="resultats">
				<f:facet name="header">
					<h:outputText 
				rendered="#{classementBean.rowCount > 0}"
						value="#{classementBean.termResult.yearName } || #{classementBean.termResult.className} || Moyenne: #{classementBean.termResult.moyenne} || Forte Moyenne:  #{classementBean.termResult.maxMoyenne} || Faible Moyenne:  #{classementBean.termResult.minMoyenne}"></h:outputText>
				</f:facet>

				<rich:dataGrid value="#{classementBean.termSummaries}" 
				rendered="#{classementBean.rowCount > 0}"
					id="summaryGrid" var="smry" columns="5" elements="15"
					width="100%">
					<rich:panel bodyClass="pbody">
						<f:facet name="header">
							<h:outputText
								value="#{smry.student.firstName} #{smry.student.lastName}"></h:outputText>
						</f:facet>
						<h:panelGrid columns="2">
							<h:outputText value="#{msg.averageMark }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.mark}">
								<f:convertNumber pattern="#{configurationBean.markFormat}" />
							</h:outputText>
							<h:outputText value="#{msg.rank }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.rankNbr}" />
							<h:outputText value="#{msg.grade }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.gradeName}" />
							<h:outputText value="#{msg.decision }" styleClass="label"></h:outputText>
							<h:outputText value="#{smry.decision}" />
							
							<a4j:commandLink ajaxSingle="true" id="modify"
								action="#{classementBean.getTermDetails}"
								oncomplete="#{rich:component('resultTermPanelStudent')}.show();"
								reRender="resultTermPanelStudent" value="#{msg.modify }">
								<f:param name="id" value="#{smry.id}" />
							</a4j:commandLink>
							
							<a4j:commandLink ajaxSingle="true" id="viewAll"
								action="#{classementBean.getTermMarks}"
								oncomplete="#{rich:component('resultViewPanelStudent')}.show();"
								reRender="resultViewPanelStudent" value="#{msg.viewAllMarks }">
								<f:param name="id" value="#{smry.id}" />
								<f:param name="studentId" value="#{smry.student.id}" />
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
				
				
		<rich:modalPanel id="resultTermPanelStudent" autosized="true" width="800" height="300">	
				<f:facet name="header">
				<h:outputText value="#{classementBean.termSmry.student.firstName} #{classementBean.termSmry.student.lastName}" />
				</f:facet>
				<f:facet name="controls">
					<h:panelGroup>
						<h:graphicImage value="/images/close.png" id="hidelinkTerm"
							styleClass="hidelink" />
						<rich:componentControl for="resultTermPanelStudent" attachTo="hidelinkTerm"
							operation="hide" event="onclick" />
					</h:panelGroup>
				</f:facet>	
				<a4j:outputPanel ajaxRendered="true">
					<h:panelGroup id="infoImageHeaderTerm2">
						<a4j:mediaOutput element="img" session="false"
							mimeType="image/gif" style="width:100px; height:100px;"
							createContent="#{classementBean.paintStudent}"
							value="#{classementBean.random}" cacheable="false">
						</a4j:mediaOutput>
					</h:panelGroup>
					<h:outputText
						value="#{classementBean.termSmry.student.firstName} #{classementBean.termSmry.student.lastName}" />
				</a4j:outputPanel>	
				<a4j:form>					
						<h:panelGrid columns="2">
							<h:outputText value="#{msg.averageMark }" styleClass="label"></h:outputText>
							<h:outputText value="#{classementBean.termSmry.mark}">
								<f:convertNumber pattern="#{configurationBean.markFormat}" />
							</h:outputText>
							<h:outputText value="#{msg.rank }" styleClass="label"></h:outputText>
							<h:outputText value="#{classementBean.termSmry.rankNbr}" />
		
							<h:outputText value="#{msg.grade }" styleClass="label" />
							<h:outputText value="#{classementBean.termSmry.gradeName}" />
		
							<h:outputText value="#{msg.decision }" styleClass="label" />
							<h:inputText value="#{classementBean.termSmry.decision}" size="50"/>
		
							<h:outputText value="#{msg.comment }" styleClass="label" />
							<h:inputTextarea id="comment11" value="#{classementBean.termSmry.comment}" rows="3" cols="50" />
		
						</h:panelGrid>
						<p><a4j:commandButton value="#{msg.save }"
							action="#{classementBean.modifyTermDecision}"
							oncomplete=" #{rich:component('resultTermPanelStudent')}.hide();"
							reRender="resultats" /> <rich:spacer width="50" height="10"
							title="" /> 
							<a4j:commandButton value="#{msg.close }"
							action="#{classementBean.doIt}"
							oncomplete=" #{rich:component('resultTermPanelStudent')}.hide();" /></p>
					
				</a4j:form>
		</rich:modalPanel>
				
				
		<rich:modalPanel id="resultViewPanelStudent" autosized="true" width="900"
			height="600">
			<f:facet name="header">
				<h:outputText value="#{classementBean.student.firstName} #{classementBean.student.middleName} #{classementBean.student.lastName} " />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage value="/images/close.png" id="hidelink"
						styleClass="hidelink" />
					<rich:componentControl for="resultViewPanelStudent" attachTo="hidelink"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<a4j:form>
				<a4j:outputPanel ajaxRendered="true">
					<table>
						<tr>
							<td>
								<a4j:mediaOutput element="img" session="false"
									mimeType="image/gif" style="width:100px; height:100px;"
									createContent="#{classementBean.paintStudent}"
									value="#{classementBean.random}" cacheable="false">
								</a4j:mediaOutput>
							</td>
							<td>
								<h:panelGrid columns="2">
									<h:outputText value="#{msg.averageMark }:" styleClass="label"></h:outputText>
									<h:outputText value="#{classementBean.termSmry.mark}">
										<f:convertNumber pattern="#{configurationBean.markFormat}" />
									</h:outputText>
									<h:outputText value="#{msg.rank }:" styleClass="label"></h:outputText>
									<h:outputText value="#{classementBean.termSmry.rankNbr}" />
									<h:outputText value="#{msg.grade }:" styleClass="label"></h:outputText>
									<h:outputText value="#{classementBean.termSmry.gradeName}" />
									<h:outputText value="#{msg.decision }:" styleClass="label"></h:outputText>
									<h:outputText value="#{classementBean.termSmry.decision}" />
								</h:panelGrid>
							</td>
						</tr>
					</table>
				</a4j:outputPanel>

				<rich:scrollableDataTable id="averages" width="900px" height="300px"
					value="#{classementBean.averages}" var="average"
					sortMode="single">

					<rich:column id="subjectName">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Matiere" />
						</f:facet>
						<h:outputText value="#{average.subjectName}"/>
					</rich:column>
					<rich:column id="maxMark">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Note Sur" />
						</f:facet>
						<h:outputText value="#{average.maxMark}" />
					</rich:column>
					<rich:column id="classMark">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Moyenne de la classe" />
						</f:facet>
						<h:outputText value="#{average.classMark}" >
							<f:convertNumber pattern="#{configurationBean.markFormat}" />
						</h:outputText>
					</rich:column>
					<rich:column id="classRatio">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="%" />
						</f:facet>
						<h:outputText value="#{average.classRatio}" />
					</rich:column>
					<rich:column id="examMark">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Moyenne Examen" />
						</f:facet>
						<h:outputText value="#{average.examMark}" >
							<f:convertNumber pattern="#{configurationBean.markFormat}" />
						</h:outputText>
					</rich:column>
					<rich:column id="examRatio">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="%" />
						</f:facet>
						<h:outputText value="#{average.examRatio}" />
					</rich:column>
					<rich:column id="averageMark">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Moyenne" />
						</f:facet>
						<h:outputText value="#{average.averageMark}">
							<f:convertNumber pattern="#{configurationBean.markFormat}" />
						</h:outputText>
					</rich:column>
					<rich:column id="teacherName">
						<f:facet name="header">
							<h:outputText styleClass="headerText" value="Professeur" />
						</f:facet>
						<h:outputText value="#{average.teacherName}" />
					</rich:column>
				</rich:scrollableDataTable>

				<p><a4j:commandButton value="#{msg.close }"
					action="#{classementBean.doIt}"
					oncomplete=" #{rich:component('resultViewPanelStudent')}.hide();" /></p>
			</a4j:form>
		</rich:modalPanel> 
		<rich:modalPanel id="resultSearch" autosized="true" width="300">
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
		</rich:modalPanel>
		<rich:modalPanel id="waitStudent" autosized="true" width="200"
			height="120" moveable="false" resizeable="false">
			<f:facet name="header">
				<h:outputText value="#{msg.operationInProgress }" />
			</f:facet>
			<h:outputText value="#{msg.oneMomentPlease }" />
		</rich:modalPanel>