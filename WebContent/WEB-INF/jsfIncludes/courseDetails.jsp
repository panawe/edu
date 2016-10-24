<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionCourse">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.course}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.termBeginDate }" /><font
							color="#FF0000">*</font></td>
						<td><rich:calendar id="beginDate"
							value="#{courseBean.course.beginDate}" locale="fr" popup="true"
							datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							enableManualInput="true" requiredMessage="#{msg.requiredMessage}"
							converterMessage="#{msg.dateConverter}" style="width:200px">
							<rich:ajaxValidator event="onblur" />
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
						<td><font color="#FF0000"><rich:message
							for="beginDate" /></font></td>
					</tr>

					<!-- Level Class Suggestion Box -->
					<tr>
						<a4j:region>
							<h:inputHidden value="#{courseBean.course.id}" />
							<td><h:outputText value="#{msg.levelClass }" /><font
								color="#FF0000">*</font></td>
							<td><rich:comboBox id="levelClass"
								value="#{courseBean.levelClassName}"
								suggestionValues="#{levelClassBean.allLevelClasses}">
							</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font>
							</td>
						</a4j:region>
					</tr>

					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.subject }" /><font
								color="#FF0000">*</font></td>
							<td><rich:comboBox id="subject"
								value="#{courseBean.subjectName}"
								suggestionValues="#{subjectBean.allSubjects}">
							</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>
						</a4j:region>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.maxMark}" /><font
							color="#FF0000">*</font></td>
						<td><h:inputText id="maxMark" style="text-align:right"
							value="#{courseBean.course.maxMark}" size="15" maxlength="10"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="maxMark" /></font></td>
					</tr>

<%
	if ("course".equals(request.getSession().getAttribute("link"))) {
%>
					<tr>
						<a4j:region>
							<td><h:outputText value="#{msg.teacher }"
							rendered="#{link=='course' }" /><font
								color="#FF0000">*</font></td>
							<td><rich:comboBox id="teacher"
							    rendered="#{link=='course' }" 
								value="#{courseBean.teacherName}"
								suggestionValues="#{teacherBean.teacherMLF}">
							</rich:comboBox> <font color="#FF0000"><rich:message for="teacher" /></font></td>
						</a4j:region>
					</tr>
<%
	}
%>
 
					<tr>
						<td><h:outputText value="#{msg.courseGroup}:" /></td>
						<td>
							<h:selectOneMenu id="courseGroup"
								value="#{courseBean.course.groupCode}"
								binding="#{courseBean.myValue}">
								<f:selectItems value="#{courseBean.configurationsByGroupName}" />
								<f:attribute name="groupName" value="COURSE_GROUP" />
							</h:selectOneMenu>
						</td>
						<td><font color="#FF0000"><rich:message for="courseGroup" /></font>
						</td>
					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}" action="#{courseBean.insert}"
					rendered="#{ courseBean.userHasWriteAccess}"
					reRender="courses, gestionCourse, courseResultPanel1"
					oncomplete="#{rich:component('courseResultPanel1')}.show();" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						rendered="#{courseBean.userHasWriteAccess}"
						action="#{courseBean.clear}" reRender="gestionCourse" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="courseResultPanel1" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{courseBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{courseBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('courseResultPanel1')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>