<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionExam">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.exam}" />
					</h:outputFormat>
				</f:facet>

				<table class="table">
					<tr>
						<td>
						<table>
							<tr>
								<td><h:outputText value="#{msg.examDate}" /><font color="#FF0000">* </font></td>

								<td><rich:calendar id="examDate"
									value="#{examBean.exam.examDate}" locale="fr" popup="true"
									datePattern="dd/MM/yyyy" showFooter="false"
									showApplyButton="false" cellWidth="24px" cellHeight="22px"
									style="width:200px">
									<f:convertDateTime pattern="dd/MM/yyyy" />
								</rich:calendar></td>
							</tr>
							<tr>
								<td><h:inputHidden value="#{examBean.exam.id}" /> <h:outputText
									value="#{msg.description}" /></td>
								<td><h:inputText id="name" value="#{examBean.exam.name}"
									size="30" maxlength="50" onchange="convertToUpperCase(this);">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
								<td><font color="#FF0000"><rich:message for="name" /></font>
								</td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.examType}" /><font color="#FF0000">* </font></td>
								<td><rich:comboBox id="examType"
									value="#{examBean.examTypeName}"
									suggestionValues="#{examTypeBean.allExamTypes}" /> <font
									color="#FF0000"><rich:message for="examType" /></font></td>
							</tr>
							<tr>
								<td><h:outputText value="#{msg.term}" /><font color="#FF0000">* </font></td>
								<td><rich:comboBox id="term" value="#{examBean.termName}"
									suggestionValues="#{termBean.allTerms}" /> <font
									color="#FF0000"><rich:message for="term" /></font></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.year }" /><font color="#FF0000">* </font></td>
								<td><rich:comboBox id="schoolYear" value="#{examBean.year}"
									suggestionValues="#{schoolYearBean.allSchoolYears}">
								</rich:comboBox></td>
							</tr>
							<tr>
								<a4j:region>
									<td><h:outputText value="#{msg.subject}" /><font color="#FF0000">* </font></td>
									<td><rich:comboBox id="subject"
										value="#{examBean.subjectName}"
										suggestionValues="#{subjectBean.allSubjects}">
										<a4j:support event="onselect"
											action="#{examBean.fetchTeacher}" reRender="infoImage" />
									</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>
								</a4j:region>
							</tr>

							<tr>

								<a4j:region>

									<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">* </font></td>
									<td><rich:comboBox id="levelClass"
										value="#{examBean.levelClassName}"
										suggestionValues="#{levelClassBean.allLevelClasses}">
										<a4j:support event="onselect"
											action="#{examBean.fetchTeacher}" reRender="infoImage" />
									</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>

								</a4j:region>
							</tr>
							
							<tr>
								<td><h:outputText value="#{msg.maxMarkForEntry}" /><font color="#FF0000">* </font></td>
								<td><h:inputText id="ratio1" value="#{examBean.exam.maxMark}"
									size="30" maxlength="6">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
							</tr>
							
							<tr>
								<td><h:outputText value="#{msg.ratio}" /><font color="#FF0000">* </font></td>
								<td><h:inputText id="ratio" value="#{examBean.exam.ratio}"
									size="30" maxlength="6">
									<rich:ajaxValidator event="onblur" />
								</h:inputText></td>
							</tr>

							<tr>
								<td><h:outputText value="#{msg.accountFor }" /><font color="#FF0000">* </font></td>
								<td><h:selectOneMenu id="evaluationType"
									value="#{examBean.exam.evaluationType}">
									<f:selectItem itemValue="0" itemLabel="#{msg.classMark }" />
									<f:selectItem itemValue="1" itemLabel="#{msg.examMark }" />
								</h:selectOneMenu></td>

							</tr>

							<tr>
								<td><h:outputText value="#{msg.publish }" /></td>

								<td><h:selectBooleanCheckbox id="publishMark"
									value="#{examBean.exam.publishMarks}" title="#{msg.publish}">
								</h:selectBooleanCheckbox></td>
							</tr>

						</table>
						</td>
						<td valign="top"><a4j:region>
							<h:panelGroup id="infoImage">
								<a4j:mediaOutput id="TeacherPhoto" element="img"
									mimeType="image/gif" style="width:100px; height:100px;"
									createContent="#{examBean.paint}" value="#{examBean.random}"
									cacheable="false">
								</a4j:mediaOutput>

								<br />
						Prof:
						<h:outputText id="firstName" value="#{examBean.teacher.firstName}" />
								<SPACER TYPE=HORIZONTAL SIZE=50>
								<h:outputText id="lastName" value="#{examBean.teacher.lastName}" />
							</h:panelGroup>
						</a4j:region></td>
					</tr>
				</table>

				<a4j:commandButton value="#{msg.save}" action="#{examBean.insert}"
					rendered="#{ examBean.userHasWriteAccess }"
					oncomplete="#{rich:component('examResultPanel1')}.show();"
					reRender="exams, gestionExam,examResultPanel1" />
				<rich:spacer width="20" height="10" title="" />
				
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}" action="#{examBean.clear}"
						reRender="gestionExam" />
				</a4j:region>

				<rich:spacer width="20" height="10" title="" />
				
				<a4j:commandButton id="recalculate" value="#{msg.recalculateAllMarks}" action="#{examBean.recalculateAllMarks}"
					rendered="#{examBean.exam.id > 0 && examBean.userHasWriteAccess &&1<0 }"
					oncomplete="#{rich:component('examResultPanel1')}.show();"
					reRender="exams, gestionExam,examResultPanel1" />
					
				<a4j:commandButton id="copy" value="#{msg.copyExam}" action="#{examBean.copyExam}"
					rendered="#{examBean.exam.id > 0 && examBean.userHasWriteAccess }"
					oncomplete="#{rich:component('examResultPanel1')}.show();"
					reRender="exams, gestionExam,examResultPanel1" />
					
				<rich:spacer width="20" height="10" title="" />

				<a4j:commandLink ajaxSingle="true" id="approver"
					rendered="#{examBean.exam.id > 0 && examBean.exam.course.teacher.user.id==user.id && examBean.userHasWriteAccess }"
					action="#{examBean.approveAllMarks}"
					reRender="students,examResultApprovals"
					oncomplete="#{rich:component('examResultApprovals')}.show()">
					<h:graphicImage value="images/approve.gif" style="border:0" />
				</a4j:commandLink>
	
				<rich:toolTip for="approver" value="#{msg.approveAll}" />
				<rich:toolTip for="recalculate" value="#{msg.recalculateAllCoefficientMarks}" />
				<br />
				<br />
				<br />
				<br />
			</rich:panel>

		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="examResultApprovals" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{examBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{examBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			reRender="notes,students"
			oncomplete="#{rich:component('examResultApprovals')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>


<rich:modalPanel id="examResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{examBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{examBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('examResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>