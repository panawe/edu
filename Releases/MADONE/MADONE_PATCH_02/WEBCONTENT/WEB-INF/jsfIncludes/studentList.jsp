
<%
	if ("school".equals(request.getSession().getAttribute("link"))) {
%>
<table width="75%">
	<tr width="100%">
		<td width="20%"><rich:panel bodyClass="info"
				id="levelClassStatisticPanel"
				style="overflow: hidden; width: 100%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputText value="#{msg.studentStatistics }" />
				</f:facet>

				<table>
					<tr>
						<td><strong><h:outputText
									value="#{msg.numberOfBoys}" /> </strong></td>
						<td align="rigth"><strong></strong><font color="red"><h:outputText
									value="#{studentBean.numberOfBoys}" /></font></strong></td>
					</tr>
					<tr>
						<td><strong><h:outputText
									value="#{msg.numberOfGirls}" /> </strong></td>
						<td align="rigth"><strong></strong><font color="red"><h:outputText
									value="#{studentBean.numberOfGirls}" /></font></strong></td>
					</tr>
					<tr>
						<td><strong><h:outputText value="#{msg.maximumAge}" />
						</strong></td>
						<td align="rigth"><strong></strong><font color="red"><h:outputText
									value="#{studentBean.maximumAge}" /></font></strong></td>
					</tr>
					<tr>
						<td><strong><h:outputText value="#{msg.minimumAge}" />
						</strong></td>
						<td align="rigth"><strong></strong><font color="red"><h:outputText
									value="#{studentBean.minimumAge}" /></font></strong></td>
					</tr>
					<tr>
						<td><strong><h:outputText value="#{msg.averageAge}" />
						</strong></td>
						<td align="rigth"><strong></strong><font color="red"><h:outputText
									value="#{studentBean.averageAge}" /></font></strong></td>
					</tr>
				</table>
			</rich:panel></td>
		<td width="20%"></td>
		<td width="20%"><a4j:form>
				<a4j:region>
					<a4j:outputPanel id="countryStatistics">
						<rich:panel style="width:240px;">
							<f:facet name="header">
								<h:outputFormat value="#{msg.countryStatistics}">
								</h:outputFormat>
							</f:facet>

							<rich:scrollableDataTable width="220px" height="110px"
								columnClasses="col" frozenColCount="1"
								value="#{studentBean.countryStatistics}" var="countryStatistic"
								reRender="ds" rowKeyVar="row" sortMode="single">


								<rich:column>
									<f:facet name="header">
										<h:outputText value="#{msg.country}" />
									</f:facet>
									<h:outputText value="#{countryStatistic.name}" />
								</rich:column>

								<rich:column>
									<f:facet name="header">
										<h:outputText value="#{msg.numberOfStudents}" />
									</f:facet>
									<h:outputText value="#{countryStatistic.value}" />
								</rich:column>
							</rich:scrollableDataTable>
						</rich:panel>
					</a4j:outputPanel>
				</a4j:region>
			</a4j:form></td>
		<td width="20%"></td>
		<td width="20%"><a4j:form>
				<a4j:region>
					<rich:panel style="width:240px;">
						<f:facet name="header">
							<h:outputFormat value="#{msg.religionStatistics}">
							</h:outputFormat>
						</f:facet>

						<rich:scrollableDataTable width="220px" height="110px"
							columnClasses="col" frozenColCount="1"
							value="#{studentBean.religionStatistics}" var="religionStatistic"
							reRender="ds" rowKeyVar="row">

							<rich:column sortBy="#{religionStatistic.name}">
								<f:facet name="header">
									<h:outputText value="#{msg.schoolReligion}" />
								</f:facet>
								<h:outputText value="#{religionStatistic.name}" />
							</rich:column>

							<rich:column sortBy="#{religionStatistic.value}">
								<f:facet name="header">
									<h:outputText value="#{msg.numberOfStudents}" />
								</f:facet>
								<h:outputText value="#{religionStatistic.value}" />
							</rich:column>
						</rich:scrollableDataTable>
					</rich:panel>
				</a4j:region>
			</a4j:form></td>
	</tr>
</table>
<br />
<%
	}
%>

<%
	if (!"school".equals(request.getSession().getAttribute("link"))) {
%>
<script type="text/javascript">
function changeMeElement(value) {
	document.getElementById('studentSearchCriteriaForm:exportButton').style.display = (value == 'false'? 'block' : 'none');
}
</script>
<a4j:form id="studentSearchCriteriaForm">
	<a4j:region>
		<table width="100%">
			<tr>

				<td><h:outputText value="#{msg.matricule }" /></td>
				<td><h:inputText
						onkeyup="convertToUpperCase(this);"
						value="#{studentBean.studentSearch.matricule}" /></td>

				<td><h:outputText value="#{msg.lastName }" /></td>
				<td><h:inputText
						onkeyup="convertToUpperCase(this);"
						value="#{studentBean.studentSearch.lastName}" /></td>

				<td><h:outputText value="#{msg.firstName }" /></td>
				<td><h:inputText
						onkeyup="convertToUpperCase(this);"
						value="#{studentBean.studentSearch.firstName}" /></td>

				<td><h:outputText value="#{msg.classe }" /></td>
				<td><rich:comboBox id="levelClass0"
						value="#{studentBean.studentSearch.className}"
						suggestionValues="#{levelClassBean.allLevelClasses}">
					</rich:comboBox></td>
				<td><h:outputText value="#{msg.fileStatus}" /></td>
				<td><h:selectOneMenu id="status"
						value="#{studentBean.studentSearch.status}"
						binding="#{studentBean.myValue}">
						<f:selectItem itemLabel="#{msg.allFiles}" itemValue="" />
						<f:selectItems value="#{studentBean.configurationsByGroupName}" />
						<f:attribute name="groupName" value="STUDENT_STATUS" />
					</h:selectOneMenu></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.sex }" /></td>
					<td><h:selectOneMenu id="sexSearchCriteria"
						value="#{studentBean.studentSearch.sex}">
						<f:selectItem itemValue="" itemLabel="" />
						<f:selectItem itemValue="M" itemLabel="#{msg.masculin }" />
						<f:selectItem itemValue="F" itemLabel="#{msg.feminin }" />
					</h:selectOneMenu></td>
					
					<td><h:outputText value="#{msg.minimumAge }" /></td>
					<td><h:inputText value="#{studentBean.studentSearch.beginAge}" /></td>
	
					<td><h:outputText value="#{msg.maximumAge }" /></td>
					<td><h:inputText value="#{studentBean.studentSearch.endAge}" /></td>
							
					<td><h:outputText value="#{msg.year }" /></td>
					<td><rich:comboBox id="schoolYear" value="#{studentBean.studentSearch.year}"
						suggestionValues="#{schoolYearBean.allSchoolYears}">
					</rich:comboBox></td>
					
					<td><h:outputText value="#{msg.decision }" /></td>
					<td><h:selectOneMenu id="outcomeSearchCriateria"
							value="#{studentBean.studentSearch.decision}"
							binding="#{studentBean.mySecondValue}">
							<f:selectItem itemLabel="" itemValue="" />
							<f:selectItems value="#{studentBean.configsByGroupName}" />
							<f:attribute name="groupName" value="DECISION" />
						</h:selectOneMenu></td>
						
					<td><a4j:commandButton value="#{msg.search}"
							onclick="buttonClicked = true; "
							action="#{studentBean.getSearchedStudents}" reRender="students"
							oncomplete="if (#{studentBean.rowCount <= 0}) #{rich:component('resultPanelStudent')}.show(); changeMeElement('#{studentBean.rowCount <= 0}')" />
					</td>
					
					<td><h:commandButton value="#{msg.exportCSV}" id="exportButton" 
							action="#{studentBean.generateCSVReport}" />
					</td>
					<td>
						<h:inputHidden id="searchResultCount" value="#{studentBean.rowCount}" />
					</td>
				</tr>
			</table>

		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('waitStudent')}.show()}"
			onstop="buttonClicked = false; #{rich:component('waitStudent')}.hide()" />
	</a4j:region>

</a4j:form>

<%
	}
%>

<a4j:region>
	<rich:modalPanel id="resultPanelStudent" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<a4j:form>
			<p>
				<h:outputText value="#{msg.noResultFound}" />
			</p>
			<p></p>
			<p>
				<a4j:commandButton value="#{msg.close }"
					oncomplete=" #{rich:component('resultPanelStudent')}.hide();" />
			</p>
		</a4j:form>
	</rich:modalPanel>
</a4j:region>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="students">
			<rich:dataTable rows="15" value="#{studentBean.students}"
				var="student" rendered="#{studentBean.rowCount>0}" reRender="ds"
				rowKeyVar="row"
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.listHeader}">
						<f:param value="#{msg.students}" />
					</h:outputFormat>
				</f:facet>

				<rich:column filterBy="#{student.matricule}" filterEvent="onkeyup"
					sortBy="#{student.matricule}">
					<f:facet name="header">
						<h:outputText value="#{msg.matricule}" />
					</f:facet>
					<h:outputText value="#{student.matricule}" />
				</rich:column>

				<rich:column filterBy="#{student.lastName}" filterEvent="onkeyup"
					sortBy="#{student.lastName}">
					<f:facet name="header">
						<h:outputText value="#{msg.lastName}" />
					</f:facet>
					<h:outputText value="#{student.lastName}" />
				</rich:column>

				<rich:column filterBy="#{student.firstName}" filterEvent="onkeyup"
					sortBy="#{student.firstName}">
					<f:facet name="header">
						<h:outputText value="#{msg.firstName}" />
					</f:facet>
					<h:outputText value="#{student.firstName}" />
				</rich:column>

				<rich:column filterBy="#{student.schoolName}" filterEvent="onkeyup"
					sortBy="#{student.schoolName}">
					<f:facet name="header">
						<h:outputText value="#{msg.school}" />
					</f:facet>
					<h:outputText value="#{student.schoolName}" />
				</rich:column>

				<%
					if (!"school".equals(request.getSession()
											.getAttribute("link"))) {
				%>
				<rich:column filterBy="#{student.levelClassName}"
					filterEvent="onkeyup" sortBy="#{student.levelClassName}">
					<f:facet name="header">
						<h:outputText value="#{msg.classe}" />
					</f:facet>
					<h:outputText value="#{student.levelClassName}" />
				</rich:column>
				<%
					}
				%>
				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.phone}" />
					</f:facet>
					<h:outputText value="#{student.phone}" />
				</rich:column>

				<rich:column>
					<f:facet name="header">
						<h:outputText value="#{msg.cellPhone}" />
					</f:facet>
					<h:outputText value="#{student.cellPhone}" />
				</rich:column>

				<rich:column filterBy="#{student.statusText}" filterEvent="onkeyup"
					sortBy="#{student.statusText}">
					<f:facet name="header">
						<h:outputText value="#{msg.status}" />
					</f:facet>
					<h:outputText value="#{student.statusText}" />
				</rich:column>

				<%
					if (!"school".equals(request.getSession()
											.getAttribute("link"))) {
				%>
				<rich:column width="140">
					<f:facet name="header">
						<h:outputText value="#{msg.actions }" />
					</f:facet>
					<a4j:commandLink ajaxSingle="true" id="modify"
						action="#{studentBean.edit}"
						rendered="#{((user.student && student.userId == user.id)||(not user.student)) }"
						reRender="gestionStudent,studentHeaderPannel, studentPanel">
						<h:graphicImage value="images/edit.gif" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="delete"
						action="#{studentBean.delete}"
						rendered="#{student.schoolId == user.school.id && studentBean.userHasWriteAccess}"
						reRender="gestionStudent, students,studentHeaderPannel,actionResultPanel"
						oncomplete="#{rich:component('actionResultPanel')}.show();">
						<h:graphicImage value="/images/delete.gif" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>
					<rich:spacer width="20" height="10" title="" />

					<a4j:commandLink ajaxSingle="true" id="print"
						action="#{studentBean.selectStudent}"
						rendered="#{student.schoolId == user.school.id && ((user.student && student.userId==user.id)||(not user.student))}"
						oncomplete="#{rich:component('printStudentDetails')}.show();">
						<h:graphicImage value="images/print.gif" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>

					<rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="importStudentInfo1"
						action="#{studentBean.selectStudent}"
						rendered="#{student.status==0  && studentBean.userHasWriteAccess}"
						oncomplete="#{rich:component('importStudentInfo')}.show();">
						<h:graphicImage value="images/import.png" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>

					<a4j:commandLink ajaxSingle="true" id="freeupStudent1"
						action="#{studentBean.selectStudent}"
						rendered="#{student.status==1  && studentBean.userHasWriteAccess}"
						oncomplete="#{rich:component('freeupStudent')}.show();">
						<h:graphicImage value="images/freeup.gif" style="border:0" />
						<f:param name="id" value="#{student.id}" />
					</a4j:commandLink>

					<rich:toolTip for="modify" value="#{msg.modify}" />
					<rich:toolTip for="delete" value="#{msg.delete}" />
					<rich:toolTip for="print" value="#{msg.print}" />
					<rich:toolTip for="importStudentInfo1"
						value="#{msg.importStudentInfo}" />
					<rich:toolTip for="freeupStudent1" value="#{msg.freeupStudent}" />
				</rich:column>
				<%
					}
				%>
				<f:facet name="footer">
					<rich:datascroller id="ds"></rich:datascroller>
				</f:facet>
			</rich:dataTable>
			<br />



			<br />
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>
<rich:modalPanel id="actionResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p>
			<font color="#FF0000"> <error> <h:outputText
					value="#{studentBean.errorMessage}" /> </error>
			</font> <font color="#00FF00"> <success> <h:outputText
					value="#{studentBean.successMessage}" /> </success>
			</font>
		</p>

		<p>
			<a4j:commandButton value="#{msg.close }"
				oncomplete="#{rich:component('actionResultPanel')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>



<rich:modalPanel id="printStudentDetails" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.print}" />
	</f:facet>
	<a4j:form>
		<p>
			<h:commandButton id="view" value="#{msg.printRegistration }"
				action="#{studentBean.printStudentDetails}" />
		</p>
		 
	<rich:separator lineType="solid" />
		<p>
			<h:commandButton id="view2" value="#{msg.printId }"
				action="#{studentBean.printStudentID}" />
		</p>
		 
		
		<rich:separator lineType="solid" />
		 
			<a4j:outputPanel ajaxRendered="true">

				<h:panelGrid columns="2">
					<h:outputText value="#{msg.assiduite}" />
					<h:inputText value="#{studentBean.assiduite}" />

					<h:outputText value="#{msg.conduite}" />
					<h:inputText value="#{studentBean.conduite}" />

					<h:outputText value="#{msg.travail}" />
					<h:inputText value="#{studentBean.travail}" />

					<h:outputText value="#{msg.motifDepart}" />
					<h:inputTextarea id="motifDepart"
						value="#{studentBean.motifDepart}" rows="3" cols="50">
					</h:inputTextarea>

					<h:commandButton id="printScolarite" value="#{msg.printScolarite }"
						action="#{studentBean.printScolarite}" />

				</h:panelGrid>
			</a4j:outputPanel>
		 
	<rich:separator lineType="solid" />
		
		<p>
			<a4j:commandButton value="#{msg.close }"
				reRender="printStudentDetails"
				oncomplete="#{rich:component('printStudentDetails')}.hide();" />
		</p>
	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="importStudentInfo" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.importStudentInfo }" />
	</f:facet>
	<a4j:form>


		<p>
			<font color="#FF0000"> <error> <h:outputText
					id="errorMessage1" value="#{studentBean.errorMessage}" /> </error>
			</font> <font color="#00FF00"> <success> <h:outputText
					id="successMessage1" value="#{studentBean.successMessage}" /> </success>
			</font>
		</p>

		<a4j:commandButton value="#{msg.importStudentInfo }"
			reRender="errorMessage1,successMessage1"
			action="#{studentBean.importStudentInfo}" />

		<rich:spacer width="20" height="10" title="" />

		<a4j:commandButton value="#{msg.close }" reRender="students"
			oncomplete="#{rich:component('importStudentInfo')}.hide();" />

	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="freeupStudent" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.freeupStudent}" />
	</f:facet>
	<a4j:form>

		<p>
			<font color="#FF0000"> <error> <h:outputText
					id="errorMessage0" value="#{studentBean.errorMessage}" /> </error>
			</font> <font color="#00FF00"> <success> <h:outputText
					id="successMessage0" value="#{studentBean.successMessage}" /> </success>
			</font>
		</p>

		<a4j:commandButton value="#{msg.freeupStudent }"
			reRender="errorMessage0,successMessage0"
			action="#{studentBean.freeupStudent}" />

		<rich:spacer width="20" height="10" title="" />

		<a4j:commandButton value="#{msg.close }" reRender="students"
			oncomplete="#{rich:component('freeupStudent')}.hide();" />

	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="waitStudent" autosized="true" width="200"
	height="120" moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<script>
document.getElementById('studentSearchCriteriaForm:exportButton').style.display = document.getElementById('studentSearchCriteriaForm:searchResultCount').value > 0 ? 'block' : 'none';
</script>