<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top" align="center"><a4j:form>
				<a4j:region>


					<a4j:outputPanel id="viewTimeTables">

						<h:outputText value="#{msg.employee}:" />
						<font color="red"> <h:outputText
								value="#{timeEntryBean.user.firstName}" /> <rich:spacer
								width="5" height="10" title="" /> <h:outputText
								value="#{timeEntryBean.user.lastName}" />
						</font>
						<rich:spacer width="10" height="10" title="" />
						<a4j:commandButton action="#{timeEntryBean.doNothing}"
							value="#{msg.changeEmployee}" reRender="selectUserPanel"
							oncomplete="#{rich:component('selectUserPanel')}.show();" />

						<rich:spacer width="100" height="10" title="" />
						<a4j:commandButton action="#{timeEntryBean.getPreviousWeek}"
							value="#{msg.previousWeek}" reRender="viewTimeTables" />
						<rich:spacer width="100" height="10" title="" />
						<a4j:commandButton action="#{timeEntryBean.saveAll}"
							value="#{msg.saveAll}" reRender="viewTimeTables,timeEntryResultPanel"
							oncomplete="#{rich:component('timeEntryResultPanel')}.show();" />
						<rich:spacer width="100" height="10" title="" />
						<a4j:commandButton action="#{timeEntryBean.getNextWeek}"
							value="#{msg.nextWeek}" reRender="viewTimeTables" />

						<br>

						<rich:dataTable
							style="overflow: hidden; width: 75%; white-space: nowrap;"
							rows="50" value="#{timeEntryBean.timeEntryViews}" var="timeEntry"
							reRender="ds" rowKeyVar="row">
							<f:facet name="header">
								<h:outputFormat value="#{msg.timeEntry}">
								</h:outputFormat>
							</f:facet>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">
									<h:outputText value="#{msg.clientCode}" />
								</f:facet>
								<h:inputText size="10" value="#{timeEntry.clientCode}"
									disabled="#{timeEntry.locked}"
									onchange="convertToUpperCase(this);" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">
									<h:outputText value="#{msg.projectCode}" />
								</f:facet>
								<h:inputText size="10" value="#{timeEntry.projectCode}"
									disabled="#{timeEntry.locked}"
									onchange="convertToUpperCase(this);" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">
									<h:outputText value="#{msg.subProjectCode}" />
								</f:facet>
								<h:inputText size="10" value="#{timeEntry.subProjectCode}"
									disabled="#{timeEntry.locked}"
									onchange="convertToUpperCase(this);" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">
									<h:outputText value="#{msg.billable}" />
								</f:facet>
								<h:selectBooleanCheckbox value="#{timeEntry.bill}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">


									<h:outputText value="#{timeEntryBean.sundayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.sunHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>
							<rich:column style="vertical-align:middle;">
								<f:facet name="header">

									<h:outputText value="#{timeEntryBean.mondayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.monHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">
									<h:outputText value="#{timeEntryBean.tuesdayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.tueHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">

									<h:outputText value="#{timeEntryBean.wednesdayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.wedHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">

									<h:outputText value="#{timeEntryBean.thursdayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.thuHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">

									<h:outputText value="#{timeEntryBean.fridayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.friHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;">
								<f:facet name="header">

									<h:outputText value="#{timeEntryBean.saturdayD}">
										<f:convertDateTime pattern="EEE dd/MM/yy" />
									</h:outputText>
								</f:facet>
								<h:inputText size="5" value="#{timeEntry.satHours}"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column style="vertical-align:middle;" width="200">
								<f:facet name="header">
									<h:outputText value="#{msg.description}" />
								</f:facet>

								<h:inputTextarea id="descriptiion"
									value="#{timeEntry.description}" rows="2" cols="50"
									disabled="#{timeEntry.locked}" />
							</rich:column>

							<rich:column width="90">
								<f:facet name="header">
									<h:outputText value="#{msg.actions }" />
								</f:facet>

								<a4j:commandLink id="saveRow" action="#{timeEntryBean.saveRow}"
									reRender="viewTimeTables,timeEntryResultPanel"
									oncomplete="#{rich:component('timeEntryResultPanel')}.show();">
									<h:graphicImage value="/images/save.png" style="border:0" />
									<f:param name="id" value="#{timeEntry.id}" />
								</a4j:commandLink>

								<rich:spacer width="20" height="10" title="" />

								<a4j:commandLink ajaxSingle="true" id="addRow"
									action="#{timeEntryBean.addRow}" reRender="viewTimeTables">
									<h:graphicImage value="images/add.png" style="border:0" />
								</a4j:commandLink>

								<rich:spacer width="20" height="10" title="" />

								<a4j:commandLink ajaxSingle="true" id="deleteRow"
									action="#{timeEntryBean.deleteRow}" reRender="viewTimeTables,timeEntryResultPanel">
									<h:graphicImage value="/images/deleteRow.gif" style="border:0" />
									<f:param name="id" value="#{timeEntry.id}" />
								</a4j:commandLink>

								<rich:toolTip for="deleteRow" value="#{msg.deleteRow}" />
								<rich:toolTip for="saveRow" value="#{msg.saveRow}" />
								<rich:toolTip for="addRow" value="#{msg.addRow}" />
							</rich:column>


							<f:facet name="footer">
								<rich:datascroller id="ds"></rich:datascroller>

							</f:facet>

						</rich:dataTable>

					</a4j:outputPanel>
				</a4j:region>
			</a4j:form> <rich:modalPanel id="selectUserPanel" autosized="true" width="300">
				<f:facet name="header">
					<h:outputText value="#{msg.employee}" />
				</f:facet>
				<f:facet name="controls">
					<h:panelGroup>
						<h:graphicImage value="/images/close.png" id="hidelink11"
							styleClass="hidelink" />
						<rich:componentControl for="selectUserPanel" attachTo="hidelink11"
							operation="hide" event="onclick" />
					</h:panelGroup>
				</f:facet>

				<%@include file="/WEB-INF/jsfIncludes/userListTimeEntry.jsp"%>

			</rich:modalPanel> <rich:modalPanel id="timeEntryResultPanel" autosized="true"
				width="300">
				<f:facet name="header">
					<h:outputText value="#{msg.result}" />
				</f:facet>
				<a4j:form>
					<p>
						<font color="#FF0000"> <error> <h:outputText
								value="#{timeEntryBean.errorMessage}" /> </error>
						</font> <font color="#00FF00"> <success> <h:outputText
								value="#{timeEntryBean.successMessage}" /> </success>
						</font>
					</p>

					<p>
						<a4j:commandButton value="#{msg.close}" immediate="true"
							action="#{timeEntryBean.clearMessages }"
							oncomplete="#{rich:component('timeEntryResultPanel')}.hide();" />
					</p>
				</a4j:form>
			</rich:modalPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>