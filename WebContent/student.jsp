<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr valign="top">
		<td valign="top"><rich:simpleTogglePanel switchType="ajax"
				label="#{studentBean.fullName}" id="studentHeaderPannel"
				opened="false">
				<a4j:outputPanel ajaxRendered="true">
					<h:panelGroup id="infoImageHeader2">
						<a4j:mediaOutput id="StudentPhotoHeader2" element="img"
							mimeType="image/gif" style="width:100px; height:100px;"
							createContent="#{studentBean.paint}"
							value="#{studentBean.random}" cacheable="false">
						</a4j:mediaOutput>
					</h:panelGroup>
				</a4j:outputPanel>
			</rich:simpleTogglePanel> <rich:modalPanel id="tabLoading" autosized="true" width="100"
				height="40" moveable="false" resizeable="false">
				<f:facet name="header">
					<h:outputText value="#{msg.operationInProgress }" />
				</f:facet>
				<h:outputText value="#{msg.oneMomentPlease }" />
			</rich:modalPanel> <a4j:status id="status" forceId="true"
				onstart="#{rich:component('tabLoading')}.show()"
				onstop="#{rich:component('tabLoading')}.hide()" /> <rich:tabPanel
				switchType="ajax" width="100%" id="studentPanel"
				selectedTab="#{studentBean.selectedTab}" immediate="true">
				<rich:tab id="studentList" label="#{msg.research}" status="status"
				rendered="#{(not user.student)}">
					<%@include file="/WEB-INF/jsfIncludes/studentList.jsp"%>
				</rich:tab>

				<rich:tab id="studentDetails" label="#{msg.details}" status="status">
					<f:attribute name="tabName" value="STUDENT_DETAILS" />
					<%@include file="/WEB-INF/jsfIncludes/studentDetails.jsp"%>
				</rich:tab>

				<rich:tab id="schooling" label="#{msg.schooling}"
					rendered="#{studentBean.studentSelected }" status="status">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{schoolingBean.getStudentSchooling}"
						reRender="studentPanel">
						<f:param name="selectedTab" value="schooling" />
					</a4j:support>
					<a4j:outputPanel id="schoolingsTab">
						<rich:tabPanel switchType="ajax" width="100%"
							id="studentSchoolingPanel"
							selectedTab="#{schoolingBean.selectedTab }" immediate="true">

							<rich:tab id="studentSchoolingDetails"
								label="#{msg.writeSchooling }"
								rendered="#{studentBean.student.school.id == user.school.id &&studentBean.userHasWriteAccess}">
								<%@include file="/WEB-INF/jsfIncludes/schoolingDetails.jsp"%>
							</rich:tab>
							<rich:tab id="studentSchoolingList" label="#{msg.readSchooling }">
								<%@include file="/WEB-INF/jsfIncludes/schoolingList.jsp"%>
							</rich:tab>
						</rich:tabPanel>
					</a4j:outputPanel>
				</rich:tab>

				<rich:tab status="status" id="studentMarksAndAverages"
					label="#{msg.marks}" rendered="#{studentBean.studentSelected }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{studentBean.getStudentMarks}" reRender="studentPanel">
						<f:param name="selectedTab" value="studentMarksAndAverages" />
					</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%" id="marksAndAverages"
						immediate="true">
						<rich:tab id="studentMarks" label="#{msg.marks }">
							<%@include file="/WEB-INF/jsfIncludes/studentNotes.jsp"%>
						</rich:tab>
						<rich:tab id="studentAverages" label="#{msg.averages }">
							<%@include file="/WEB-INF/jsfIncludes/studentAverages.jsp"%>
						</rich:tab>
					</rich:tabPanel>
				</rich:tab>

				<rich:tab status="status" id="correspondence"
					label="#{msg.correspondence}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id}">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{correspondenceBean.getStudentCorrespondences}"
						reRender="studentPanel">
						<f:param name="selectedTab" value="correspondence" />
					</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%"
						id="studentCorrespondancePanel"
						selectedTab="#{correspondenceBean.selectedStudentTab }"
						immediate="true">
						<rich:tab status="status" id="studentCorrespondenceDetails"
							label="#{msg.writeCorrespondance }"
							rendered="#{studentBean.userHasWriteAccess}">
							<%@include
								file="/WEB-INF/jsfIncludes/studentCorrespondenceDetails.jsp"%>
						</rich:tab>
						<rich:tab status="status" id="studentCorrespondenceList"
							label="#{msg.readCorrespondance }">
							<%@include
								file="/WEB-INF/jsfIncludes/studentCorrespondenceList.jsp"%>
						</rich:tab>
					</rich:tabPanel>
				</rich:tab>

				<rich:tab status="status" id="enrollment" label="#{msg.enrollment}"
					rendered="#{studentBean.studentSelected }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{studentEnrollmentBean.getAllStudentEnrollments}"
						reRender="studentPanel">
						<f:param name="selectedTab" value="enrollment" />
					</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%"
						id="studentEnrollmentPanel"
						selectedTab="#{studentEnrollmentBean.selectedTab }"
						immediate="true">
						<rich:tab id="studentEnrollmentDetails" label="#{msg.enroll }"
							rendered="#{studentBean.student.school.id == user.school.id&&studentBean.userHasWriteAccess}">
							<%@include
								file="/WEB-INF/jsfIncludes/studentEnrollmentDetails.jsp"%>
						</rich:tab>
						<rich:tab id="studentEnrollmentList"
							label="#{msg.seePastEnrollments }">
							<%@include file="/WEB-INF/jsfIncludes/studentEnrollmentList.jsp"%>
						</rich:tab>
					</rich:tabPanel>
					<br />
				</rich:tab>

				<rich:tab id="assignmentFile" label="#{msg.assignedFiles}" status="status" rendered="false">
					<rich:tabPanel switchType="ajax" width="100%"
						id="studentAssignmentFilePanel" selectedTab="#{assignmentFileBean.selectedTab }" immediate="true">
						
						<rich:tab id="studentAssignmentFileList" label="#{msg.assignFileSearch }">
							<a4j:support event="ontabenter" ajaxSingle="true" action="#{assignmentFileBean.getTeacherAssignedFiles}" reRender="courses">
								<a4j:actionparam assignTo="#{assignmentFileBean.selectedTab}" value="list" />
							</a4j:support>
							<%@include file="/WEB-INF/jsfIncludes/courseAssignmentFileList.jsp"%>
						</rich:tab>
					</rich:tabPanel>
				</rich:tab>
			
				<rich:tab status="status" id="tuitions" label="#{msg.tuition}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id}">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{paymentBean.getStudentPayments}" reRender="studentPanel">
						<f:param name="selectedTab" value="tuitions" />
					</a4j:support>
					<%@include file="/WEB-INF/jsfIncludes/studentPaymentList.jsp"%>
				</rich:tab>

				<rich:tab status="status" id="exemption" label="#{msg.exemption}"
					rendered="#{studentBean.studentSelected }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{exemptionBean.getAllExemptions}" reRender="studentPanel">
						<f:param name="selectedTab" value="exemption" />
					</a4j:support>
					<a4j:form>
						<%@include file="/WEB-INF/jsfIncludes/exemptionList.jsp"%>
						<br />
						<%@include file="/WEB-INF/jsfIncludes/exemptionDetails.jsp"%>
					</a4j:form>
					<br />
				</rich:tab>

				<rich:tab status="status" id="medicalVisit"
					label="#{msg.medicalVisit}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{medicalVisitBean.getAll}" reRender="studentPanel">
						<f:param name="selectedTab" value="medicalVisit" />
					</a4j:support>
					<%@include file="/WEB-INF/jsfIncludes/teacherMedicalVisitList.jsp"%>
					<br />
				</rich:tab>

				<rich:tab status="status" id="curriculum" label="#{msg.curriculum}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{curriculumBean.getAll}" reRender="studentPanel">
						<f:param name="selectedTab" value="curriculum" />
						<f:param name="subSelectedTab" value="curriculumPage" />
					</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%" id="curriculumPanel"
						immediate="true">
						<rich:tab id="curriculumPage" label="#{msg.curriculum}">
							<a4j:support event="ontabenter" ajaxSingle="true"
								action="#{curriculumBean.getAll}" reRender="studentPanel">
								<f:param name="selectedTab" value="curriculum" />
								<f:param name="subSelectedTab" value="curriculumPage" />
							</a4j:support>
							<%@include file="/WEB-INF/jsfIncludes/curriculumList.jsp"%>
							<br />
							<%@include
								file="/WEB-INF/jsfIncludes/curriculumDetailsReadOnly.jsp"%>
						</rich:tab>
						<rich:tab id="curriculumProgressPage"
							label="#{msg.curriculumProgress}">
							<a4j:support event="ontabenter" ajaxSingle="true"
								action="#{curriculumProgressBean.getAll}"
								reRender="studentPanel">
								<f:param name="selectedTab" value="curriculum" />
								<f:param name="subSelectedTab" value="curriculumProgressPage" />
							</a4j:support>
							<%@include file="/WEB-INF/jsfIncludes/curriculumProgressList.jsp"%>
							<br />
						</rich:tab>
					</rich:tabPanel>
				</rich:tab>

				<rich:tab status="status" id="schoolEvent" label="#{msg.events}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
					<%@include file="/WEB-INF/jsfIncludes/schoolEventList.jsp"%>
				</rich:tab>

				<rich:tab status="status" id="timeTablePanelTabs"
					label="#{msg.timeTable}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
					<rich:tabPanel switchType="ajax" width="100%" id="timeTablePanel"
						immediate="true">
						<rich:tab status="status" id="viewTimeTable"
							label="#{msg.timeTable}"
							rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
							<%@include file="/WEB-INF/jsfIncludes/timeTable.jsp"%>
						</rich:tab>

						<rich:tab status="status" id="viewExamTimeTable"
							label="#{msg.exams}"
							rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
							<%@include file="/WEB-INF/jsfIncludes/examTimeTable.jsp"%>
						</rich:tab>
					</rich:tabPanel>
				</rich:tab>

				<rich:tab status="status" id="studentProfile" label="#{msg.profile}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{userBean.getStudentProfile}" reRender="studentPanel">
						<f:param name="selectedTab" value="studentProfile" />
					</a4j:support>
					<%@include file="/WEB-INF/jsfIncludes/userProfile.jsp"%>
					<br />
				</rich:tab>

				<rich:tab status="status" id="demandes" label="#{msg.request}"
					rendered="#{studentBean.studentSelected && studentBean.student.school.id == user.school.id }">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{productBean.getAllStudentDemands}"
						reRender="studentPanel">
						<f:param name="selectedTab" value="demandes" />
					</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%"
						id="studentDemandPanel" immediate="true">
						<rich:tab id="studentDemandDetails" label="#{msg.makeADemand }">
							<%@include file="/WEB-INF/jsfIncludes/studentDemande.jsp"%>
						</rich:tab>
						<rich:tab id="studentDemandList" label="#{msg.demandList }">
							<%@include file="/WEB-INF/jsfIncludes/studentDemandeList.jsp"%>
						</rich:tab>
					</rich:tabPanel>
				</rich:tab>
			</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>