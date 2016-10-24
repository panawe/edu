<a4j:region>
	<a4j:outputPanel id="gestionExemption" rendered="#{studentBean.student.school.id == user.school.id}">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.exemption}" />
				</h:outputFormat>
			</f:facet>

			<table class="table">

				<!-- Subject Suggestion Box -->
				<tr>

					<td>
					<table>
						<tr>
							<a4j:region>
								<td><h:outputText value="#{msg.subject}" /></td>
								<td><rich:comboBox id="subject"
									value="#{exemptionBean.subjectName}"
									suggestionValues="#{exemptionBean.subjectsForLevel}">
									<a4j:support event="onselect"
										action="#{exemptionBean.fetchTeacher}"
										reRender="exemptionInfoImage" />
								</rich:comboBox> <font color="#FF0000"><rich:message for="subject" /></font></td>
							</a4j:region>
						</tr>
						<tr>
							<td><h:outputText value="#{msg.comments}" /></td>
							<td><h:inputTextarea id="exemptionComments"
								value="#{exemptionBean.exemption.comments}" rows="5" cols="50">
							</h:inputTextarea></td>
							<td><font color="#FF0000"><rich:message
								for="exemptionComments" /></font></td>
						</tr>
						<tr>
							<td valign="top"><a4j:commandButton value="#{msg.save}"
								action="#{exemptionBean.insert}"
								rendered="#{studentBean.student.school.id == user.school.id && studentBean.userHasWriteAccess}"
								reRender="exemptions, gestionExemption" /> 
								<SPACER TYPE=HORIZONTAL SIZE=50> <a4j:region>
								<a4j:commandButton value="#{msg.clear}"
								rendered="#{studentBean.student.school.id == user.school.id && studentBean.userHasWriteAccess}"
									action="#{exemptionBean.clear}" reRender="gestionExemption" />
							</a4j:region></td>
						</tr>
					</table>
					</td>
					<td>
					<table>
						<tr>
							<td><a4j:region>
								<h:panelGroup id="exemptionInfoImage">
									<a4j:mediaOutput id="exemptionTeacherPhoto" element="img"
										mimeType="image/gif" style="width:100px; height:100px;"
										createContent="#{exemptionBean.paint}"
										value="#{exemptionBean.random}" cacheable="false">
									</a4j:mediaOutput>
									<br/>
									<h:outputText value="#{msg.teacher } : " />
									<h:outputText id="exemptionFirstName"
										value="#{exemptionBean.teacher.firstName}" />
									<SPACER TYPE=HORIZONTAL SIZE=50>
									<h:outputText id="exemptionLastName"
										value="#{exemptionBean.teacher.lastName}" />
								</h:panelGroup>
							</a4j:region></td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
