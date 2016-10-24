<%@include file="/WEB-INF/includes/header.jsp"%>

<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>


	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->

	<tr>
		<td align="center" valign="top">
		

			<table border="0" cellspacing="0" cellpadding="0">
				<tr>

					<td align="justify" valign="top">
						<table height="350">
							<tr>
								<td valign="top"><a4j:form>
										<a4j:region>

											<rich:panel bodyClass="pbody" id="myTests"
												style="width: 300px;">
												<f:facet name="header">
													<h:outputText value="#{msg.myTests}"
														style="font-size : smaller;"></h:outputText>
												</f:facet>
												<h:outputText rendered="#{empty userBean.myPendingTests}"
													value="#{msg.noTest }" styleClass="label"></h:outputText>

												<h:panelGrid columns="2" style="font-size : smaller;"
													rendered="#{not empty userBean.myPendingTests}">
													<h:outputText value="#{msg.title}" styleClass="label"></h:outputText>
													<h:outputText value="#{userBean.userTest.test.title}" />

													<h:outputText value="#{msg.subject }" styleClass="label"></h:outputText>
													<h:outputText
														value="#{userBean.userTest.test.subject.name}" />

													<h:outputText value="#{msg.level }" styleClass="label"></h:outputText>
													<h:outputText value="#{userBean.userTest.test.level.name}" />

													<h:outputText value="#{msg.duration }" styleClass="label"></h:outputText>
													<h:outputText
														value="#{userBean.userTest.test.duration} #{msg.minutes }" />

													<h:outputText value="#{msg.dueDate }" styleClass="label"></h:outputText>
													<h:outputText value="#{userBean.userTest.test.dueDate}">
														<f:convertDateTime
															pattern="#{configurationBean.dateFormat}" />
													</h:outputText>

													<h:outputText value="" styleClass="label"></h:outputText>
													<a4j:commandLink ajaxSingle="true" id="modify"
														action="#{userBean.startTest}"
														oncomplete="#{rich:component('testPanel')}.show();"
														reRender="testPanel" value="#{msg.startTest }"
														rendered="#{not userBean.userTest.completed}">
														<f:param name="id" value="#{userBean.userTest.id}" />
													</a4j:commandLink>

													<a4j:commandLink ajaxSingle="true" id="printTestResults"
														action="#{userBean.selectUserTest}" reRender="testPanel"
														value="#{msg.viewResults }"
														rendered="#{userBean.userTest.completed}"
														oncomplete="#{rich:component('printTestResults')}.show();">
														<f:param name="id" value="#{userBean.userTest.id}" />
													</a4j:commandLink>
													<h:outputText value="" styleClass="label"></h:outputText>
													<a4j:commandLink ajaxSingle="true" id="getNextExam"
														action="#{userBean.getNextExam}" reRender="myTests"> 
														 <h:graphicImage value="images/next2.png" style="border:0"/>
													</a4j:commandLink>

												</h:panelGrid>
												
												
											</rich:panel>

										</a4j:region>
									</a4j:form></td>
							</tr>

							<tr>
								<td align="justify" valign="bottom"><a4j:form>
										<a4j:region>

											<rich:panel bodyClass="pbody" id="myMarks"
												style="width: 300px;">
												<f:facet name="header">
													<h:outputText value="#{msg.myRecentMarks}"
														style="font-size : smaller;"></h:outputText>
												</f:facet>
												<h:outputText rendered="#{empty userBean.myRecentMarks}"
													value="#{msg.noMark }" styleClass="label"></h:outputText>
												<h:panelGrid columns="2" style="font-size : smaller;"
													rendered="#{not empty userBean.myRecentMarks}">
													<h:outputText value="#{msg.examType}" />
													<h:outputText value="#{userBean.mark.exam.examType.name}" />

													<h:outputText value="#{msg.description}" />
													<h:outputText value="#{userBean.mark.exam.name}" />

													<h:outputText value="#{msg.examDate}" />
													<h:outputText value="#{userBean.mark.exam.examDate}">
														<f:convertDateTime
															pattern="#{configurationBean.dateFormat}" />
													</h:outputText>

													<h:outputText value="#{msg.course}" />
													<h:outputText
														value="#{userBean.mark.exam.course.subject.name}" />

													<h:outputText value="#{msg.mark}" />
													<h:outputText
														value="#{userBean.mark.mark} / #{userBean.mark.exam.course.maxMark}" />

													<h:outputText value="#{msg.grade}" />
													<h:outputText value="#{userBean.mark.grade.name}" />

													<h:outputText value="" styleClass="label"></h:outputText>
													<a4j:commandLink ajaxSingle="true" id="getNextMark"
														action="#{userBean.getNextMark}" reRender="myMarks"> 
														 <h:graphicImage value="images/next2.png" style="border:0"/>
													</a4j:commandLink>
												</h:panelGrid>
											</rich:panel>

										</a4j:region>
									</a4j:form></td>
							</tr>
						</table>
					</td>

					<td align="center" valign="middle"><img alt=""
						src="images/center.jpg"></td>
					<td align="justify" valign="top">
						<table height="350">


							<tr>

								<td align="justify" valign="top"><a4j:form>
										<a4j:region>

											<rich:panel bodyClass="pbody" id="myDemands"
												style="width: 300px;">
												<f:facet name="header">
													<h:outputText value="#{msg.myDemands}"
														style="font-size : smaller;"></h:outputText>
												</f:facet>
												<h:outputText rendered="#{empty userBean.myRecentDemands}"
													value="#{msg.noDemand }" styleClass="label"></h:outputText>

												<h:panelGrid columns="2" style="font-size : smaller;"
													rendered="#{not empty userBean.myRecentDemands}">

													<h:outputText value="#{msg.product}" />
													<h:outputText value="#{userBean.demand.product.name}" />

													<h:outputText value="#{msg.requestDate}" />
													<h:outputText value="#{userBean.demand.requestDate}">
														<f:convertDateTime
															pattern="#{configurationBean.dateFormat}" />
													</h:outputText>

													<h:outputText value="#{msg.possibleReturnedDate}" />
													<h:outputText
														value="#{userBean.demand.possibleReturnedDate}">
														<f:convertDateTime
															pattern="#{configurationBean.dateFormat}" />
													</h:outputText>

													<h:outputText value="#{msg.status}" />
													<h:outputText value="#{userBean.demand.statusDesc}" />

													<h:outputText value="#{msg.comment}" />
													<h:outputText escape="true"
														value="#{userBean.demand.comment}" />

													<h:outputText value="" styleClass="label"></h:outputText>
													<a4j:commandLink ajaxSingle="true" id="getNextDemand"
														action="#{userBean.getNextDemand}" reRender="myDemands"> 
														 <h:graphicImage value="images/next2.png" style="border:0"/>
													</a4j:commandLink>
												</h:panelGrid>
											</rich:panel>

										</a4j:region>
									</a4j:form></td>
							</tr>
							<tr>

								<td align="justify" valign="bottom"><a4j:form>
										<a4j:region>
											<rich:panel bodyClass="pbody" id="myNews"
												style="width: 300px;">
												<f:facet name="header">
													<h:outputText value="#{msg.alerts}"
														style="font-size : smaller;"></h:outputText>
												</f:facet>
												<h:outputText rendered="#{empty userBean.myNews}"
													value="#{msg.noALert}" styleClass="label"></h:outputText>
												<h:panelGrid columns="2" style="font-size : smaller;"
													rendered="#{not empty userBean.myNews }">

													<h:outputText value="#{msg.alertType }" styleClass="label"></h:outputText>
													<h:outputText value="#{userBean.news.newsType}" />

													<h:outputText value="#{msg.date }" styleClass="label"></h:outputText>
													<h:outputText value="#{userBean.news.newsDate}">
														<f:convertDateTime
															pattern="#{configurationBean.dateFormat}" />
													</h:outputText>

													<h:outputText value="#{msg.description }"
														styleClass="label"></h:outputText>
													<h:outputText value="#{userBean.news.message}"
														escape="false" />

													<h:outputText value="" styleClass="label"></h:outputText>
													<a4j:commandLink ajaxSingle="true" id="getNextNews"
														action="#{userBean.getNextNews}" reRender="myNews"> 
														 <h:graphicImage value="images/next2.png" style="border:0"/>
													</a4j:commandLink>
													
												</h:panelGrid>
											</rich:panel>

										</a4j:region>
									</a4j:form></td>

							</tr>

						</table>
					</td>
				</tr>
			</table> <rich:modalPanel id="testPanel" resizeable="true" height="600"
				autosized="false" width="800">
				<f:facet name="header">
					<h:outputText
						value="#{msg.testInProgress} | #{userBean.currentTest.title }" />
				</f:facet>
				<div style="width: 100%; height: 100%; overflow: auto;">
					<a4j:outputPanel id="renderMe">

						<a4j:form>
							<a4j:region>
								<rich:panel header="#{msg.time }"
									rendered="#{userBean.currentSequence>0 and userBean.currentSequence<= userBean.nbrQuestions  }">
									<a4j:region>
										<a4j:outputPanel id="progressPanel">

											<rich:progressBar mode="ajax" value="#{userBean.duration}"
												style="width:700px; height:15px" interval="30000"
												label="#{userBean.duration}" enabled="true" minValue="-1"
												maxValue="#{userBean.currentTest.duration }"
												reRenderAfterComplete="progressPanel">
												<h:outputText
													value="#{msg.minutesElapsed }: {value}  / {maxValue}" />
												<rich:spacer width="10" height="10" title="" />
												<h:outputText value="#{msg.result} : "
													rendered="#{userBean.currentTest.showLiveScore }" />
												<h:outputText value="#{userBean.currentUserTest.score}"
													rendered="#{userBean.currentTest.showLiveScore }" />
												<rich:spacer width="5" height="10" title="" />
												<h:outputText value="#{msg.over}"
													rendered="#{userBean.currentTest.showLiveScore }" />
												<rich:spacer width="5" height="10" title="" />
												<h:outputText value="#{userBean.currentTest.score}"
													rendered="#{userBean.currentTest.showLiveScore }" />


												<f:facet name="initial">
													<br />
													<h:outputText value="" />

												</f:facet>
												<f:facet name="complete">
													<br />
													<h:outputText value="#{msg.timeOver }" />

												</f:facet>
											</rich:progressBar>

										</a4j:outputPanel>
									</a4j:region>
								</rich:panel>
							</a4j:region>
						</a4j:form>

						<a4j:form>
							<a4j:region>
								<rich:panel header="#{msg.description }"
									rendered="#{userBean.currentSequence==0 }">
									<h:outputText value="#{userBean.currentTest.description }"
										escape="false" rendered="#{userBean.currentSequence==0 }" />
								</rich:panel>

								<rich:panel header="#{msg.beginNote}"
									rendered="#{userBean.currentSequence==0 }">
									<h:outputText value="#{userBean.currentTest.beginMessage }"
										escape="false" rendered="#{userBean.currentSequence==0 }" />
								</rich:panel>

								<rich:panel header="#{msg.endNote}"
									rendered="#{userBean.currentSequence==userBean.nbrQuestions+1 }">

									<h:outputText value="#{userBean.currentTest.endMessage }"
										escape="false"
										rendered="#{userBean.currentSequence==userBean.nbrQuestions+1 }" />
								</rich:panel>

								<rich:panel header="#{msg.result}"
									rendered="#{userBean.currentSequence==userBean.nbrQuestions+1 }">
									<table>
										<tr>
											<td><h:outputText value="#{msg.beginDate}" /></td>
											<td><h:outputText
													value="#{userBean.currentUserTest.beginDate}">
													<f:convertDateTime
														pattern="#{configurationBean.dateTimeFormat}" />
												</h:outputText></td>
										</tr>
										<tr>
											<td><h:outputText value="#{msg.endDate}" /></td>
											<td><h:outputText
													value="#{userBean.currentUserTest.endDate}">
													<f:convertDateTime
														pattern="#{configurationBean.dateTimeFormat}" />
												</h:outputText></td>
										</tr>
										<tr>
											<td><h:outputText value="#{msg.duration}" /></td>
											<td><h:outputText
													value="#{userBean.currentUserTest.duration} #{msg.minutes }" />
											</td>
										</tr>
										<tr>
											<td><h:outputText value="#{msg.rightAnswers}" /></td>
											<td><h:outputText
													value="#{userBean.currentUserTest.right}" /></td>
										</tr>
										<tr>
											<td><h:outputText value="#{msg.wrongAnswers}" /></td>
											<td><h:outputText
													value="#{userBean.currentUserTest.wrong}" /></td>
										</tr>


										<tr>
											<td><h:outputText value="#{msg.score}" /></td>
											<td><h:outputText
													value="#{userBean.currentUserTest.score}" /> <rich:spacer
													width="5" height="10" title="" /> <h:outputText
													value="#{msg.over}" /> <rich:spacer width="5" height="10"
													title="" /> <h:outputText
													value="#{userBean.currentTest.score}" /></td>
										</tr>

										<tr>
											<td><h:outputText value="#{msg.certificateScore}" /></td>
											<td><h:outputText
													value="#{userBean.currentTest.certificateScore}" /></td>
										</tr>
										<tr>
											<td><h:outputText value="#{msg.result}" /></td>
											<td><h:outputText value="#{msg.youFailed}"
													rendered="#{useBean.currentUserTest.score<userBean.currentTest.certificateScore }" />
												<h:outputText value="#{msg.youPassed}"
													rendered="#{userBean.currentUserTest.score>=userBean.currentTest.certificateScore }" />
											</td>
										</tr>

										<tr>
											<td></td>
											<td><h:commandButton id="view"
													value="#{msg.viewDetailsPdf }"
													action="#{userBean.showUserTestDetails}"
													rendered="#{userBean.currentTest.showAllAnswers }" /></td>
										</tr>
									</table>

								</rich:panel>

								<rich:panel header="#{msg.question} #{userBean.questionHeader}"
									rendered="#{userBean.currentSequence>0 and userBean.currentSequence<= userBean.nbrQuestions  }">
									<h:outputText
										value="#{userBean.currentQuestion.question.body }"
										escape="false"
										rendered="#{userBean.currentSequence>0 and userBean.currentSequence<= userBean.nbrQuestions  }" />

								</rich:panel>

								<rich:dataTable rows="100" value="#{userBean.currentAnswers}"
									var="answer" rowKeyVar="row"
									rendered="#{userBean.currentSequence>0 and userBean.currentSequence<= userBean.nbrQuestions }"
									style="overflow: hidden; width: 100%; white-space: nowrap;">
									<f:facet name="header">
										<h:outputFormat value="#{msg.answers }">
											<f:param value="#{userBean.answerHeader }" />
										</h:outputFormat>
									</f:facet>

									<rich:column>
										<f:facet name="header">
											<h:outputText value="#{msg.answer }" />
										</f:facet>
										<h:outputText value="#{answer.body}" escape="false" />
									</rich:column>

									<rich:column width="60">
										<f:facet name="header">
											<h:outputText value="correct?" />
										</f:facet>
										<h:selectBooleanCheckbox id="checked"
											value="#{answer.checked}">
											<a4j:support action="#{userBean.changeAnswer}"
												event="onclick" immediate="true" id="ChangeAnswer">
												<f:param name="id" value="#{answer.id}" />
											</a4j:support>
										</h:selectBooleanCheckbox>
									</rich:column>

								</rich:dataTable>

								<rich:panel header="#{msg.actions}">
									<a4j:commandButton value="#{msg.startTest }"
										rendered="#{userBean.currentSequence==0 }"
										action="#{userBean.fetchQuestion}"
										reRender="renderMe,progressPanel" />

									<a4j:region>
										<a4j:commandButton value="#{msg.submit }"
											rendered="#{userBean.currentSequence>0 and userBean.currentSequence<= userBean.nbrQuestions  }"
											action="#{userBean.fetchQuestion}"
											reRender="renderMe,progressPanel" />
									</a4j:region>
									<rich:spacer width="200" height="10" title="" />
									<a4j:commandButton value="#{msg.continueLater }"
										rendered="#{userBean.currentTest.canContinueLater and userBean.currentSequence>0 and userBean.currentSequence<= userBean.nbrQuestions }"
										action="#{userBean.saveTemp}" reRender="renderMe"
										oncomplete="#{rich:component('testPanel')}.hide();" />

									<a4j:commandButton value="#{msg.close }"
										rendered="#{userBean.currentSequence==userBean.nbrQuestions+1 }"
										action="#{userBean.testDone}" reRender="testGrid1"
										oncomplete="#{rich:component('testPanel')}.hide();" />

								</rich:panel>
							</a4j:region>
						</a4j:form>
					</a4j:outputPanel>
				</div>
			</rich:modalPanel> <rich:modalPanel id="printTestResults" autosized="true" width="300">
				<f:facet name="header">
					<h:outputText value="#{msg.print}" />
				</f:facet>
				<a4j:form>
					<p>
						<h:commandButton id="viewss" value="#{msg.viewPdf }"
							action="#{userBean.showUserTestDetails}" />
					</p>
					<p></p>
					<p>
						<a4j:commandButton value="#{msg.close }"
							oncomplete="#{rich:component('printTestResults')}.hide();" />
					</p>
				</a4j:form>
			</rich:modalPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>

