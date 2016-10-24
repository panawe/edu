<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:simpleTogglePanel switchType="ajax"
			label="#{teacherBean.fullName}" id="teacherHeaderPannel"
			opened="false">
			<a4j:outputPanel>
				<h:panelGroup id="infoImageHeader2">
					<a4j:mediaOutput id="TeacherPhotoHeader2" element="img"
						mimeType="image/gif" style="width:100px; height:100px;"
						createContent="#{teacherBean.paint}" value="#{teacherBean.random}"
						cacheable="false">
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
			switchType="ajax" width="100%" id="teacherPanel"
			selectedTab="#{teacherBean.selectedTab}" immediate="true">
			<rich:tab id="teacherList" label="#{msg.research}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/teacherList.jsp"%>
			</rich:tab>

			<rich:tab id="teacherDetails" label="#{msg.identity}" status="status">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{teacherBean.justDoIt}" reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="teacherDetails" />
				</a4j:support>
				<%@include file="/WEB-INF/jsfIncludes/teacherDetails.jsp"%>
			</rich:tab>

			<rich:tab id="schooling" label="#{msg.schooling}"
				rendered="#{teacherBean.teacherSelected }" status="status">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{schoolingBean.getTeacherSchooling}"
					reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="schooling" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherSchoolingPanel"
					selectedTab="#{schoolingBean.selectedTeacherTab }" immediate="true">

					<rich:tab id="teacherSchoolingDetails"
						label="#{msg.writeSchooling }">
						<%@include file="/WEB-INF/jsfIncludes/schoolingDetails.jsp"%>
					</rich:tab>
					<rich:tab id="teacherSchoolingList" label="#{msg.readSchooling }">
						<%@include file="/WEB-INF/jsfIncludes/schoolingList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>

			<rich:tab id="correspondence" label="#{msg.correspondence}"
				status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{correspondenceBean.getStudentCorrespondences}"
					reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="correspondence" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherCorrespondancePanel"
					selectedTab="#{correspondenceBean.selectedTeacherTab }"
					immediate="true">
					<rich:tab id="teacherCorrespondenceDetails"
						label="#{msg.writeCorrespondance }">
						<%@include
							file="/WEB-INF/jsfIncludes/studentCorrespondenceDetails.jsp"%>
					</rich:tab>
					<rich:tab id="teacherCorrespondenceList"
						label="#{msg.readCorrespondance }">
						<%@include
							file="/WEB-INF/jsfIncludes/studentCorrespondenceList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>

			<rich:tab id="assignmentFile" label="#{msg.assignedFiles}" status="status" rendered="#{teacherBean.teacherSelected }">
				<a4j:support event="ontabenter" ajaxSingle="true" action="#{assignmentFileBean.getTeacherAssignedFiles}" reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}" value="assignmentFile" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherAssignmentFilePanel" selectedTab="#{assignmentFileBean.selectedTab }" immediate="true">
					<rich:tab id="teacherAssignmentFileDetails" label="#{msg.assignFile}">
						<%@include file="/WEB-INF/jsfIncludes/courseAssignmentFileDetails.jsp"%>
					</rich:tab>
					<rich:tab id="teacherAssignmentFileList" label="#{msg.assignFileSearch }">
						<a4j:support event="ontabenter" ajaxSingle="true" action="#{assignmentFileBean.getTeacherAssignedFiles}" reRender="courses">
							<a4j:actionparam assignTo="#{assignmentFileBean.selectedTab}" value="list" />
						</a4j:support>
						<%@include file="/WEB-INF/jsfIncludes/courseAssignmentFileList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>
			
			
			<rich:tab id="teacherCourse" label="#{msg.course}" status="status"
				rendered="#{teacherBean.teacherSelected }">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{courseBean.getTeacherCourses}" reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="teacherCourse" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherCoursePanel" selectedTab="#{courseBean.selectedTab }"
					immediate="true">
					<rich:tab id="teacherCourseDetails" label="#{msg.writeCourse }">
						<%@include file="/WEB-INF/jsfIncludes/courseDetails.jsp"%>
					</rich:tab>
					<rich:tab id="teacherCourseList" label="#{msg.readCourse }">
						<a4j:support event="ontabenter" ajaxSingle="true"
							action="#{courseBean.getTeacherCourses}" reRender="courses" />
						<%@include file="/WEB-INF/jsfIncludes/courseList.jsp"%>
					</rich:tab>
					<rich:tab id="teacherCoursePastList" label="#{msg.readPastCourse }">
						<a4j:support event="ontabenter" ajaxSingle="true"
							action="#{courseBean.getTeacherPastCourses}"
							reRender="pastCourses" />
						<%@include file="/WEB-INF/jsfIncludes/pastCourseList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>

			<rich:tab id="teacherSalary" label="#{msg.salary}" status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{salaryBean.getTeacherSalaries}" reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="teacherSalary" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherSalaryPanel" selectedTab="#{salaryBean.selectedTab }"
					immediate="true">
					<rich:tab id="teacherSalaryDetails" label="#{msg.writeSalary }">
						<%@include file="/WEB-INF/jsfIncludes/salaryDetails.jsp"%>
					</rich:tab>
					<rich:tab id="teacherSalaryList" label="#{msg.readSalary }">
						<%@include file="/WEB-INF/jsfIncludes/salaryList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>

			<rich:tab id="teacherSalaryPayment" label="#{msg.salaryPayment}"
				status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{salaryPaymentBean.getTeacherSalaryPayments}"
					reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="teacherSalaryPayment" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherSalaryPaymentPanel"
					selectedTab="#{salaryPaymentBean.selectedTab }" immediate="true">
					<rich:tab id="teacherSalaryPaymentDetails"
						label="#{msg.writeSalaryPayment }">
						<%@include file="/WEB-INF/jsfIncludes/salaryPaymentDetails.jsp"%>
					</rich:tab>
					<rich:tab id="teacherSalaryPaymentList"
						label="#{msg.readSalaryPayment }">
						<%@include file="/WEB-INF/jsfIncludes/salaryPaymentList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>

			<rich:tab id="medicalVisit" label="#{msg.medicalVisit}"
				status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id }">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{medicalVisitBean.getAll}" reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="medicalVisit" />
				</a4j:support>
				<%@include file="/WEB-INF/jsfIncludes/teacherMedicalVisitList.jsp"%>
				<br />
			</rich:tab>

			<rich:tab id="schoolEvent" label="#{msg.events}" status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id }">
				<%@include file="/WEB-INF/jsfIncludes/schoolEventList.jsp"%>
			</rich:tab>

			<rich:tab id="curriculum" label="#{msg.curriculum}" status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id }">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{curriculumBean.getAll}" reRender="studentPanel">
					<f:param name="selectedTab" value="curriculum" />
					<f:param name="subSelectedTab" value="curriculumPage" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%" id="curriculumPanel"
					immediate="true">
					<rich:tab id="curriculumPage" label="#{msg.curriculum}">
						<%@include file="/WEB-INF/jsfIncludes/curriculumList.jsp"%>
						<br />
						<%@include file="/WEB-INF/jsfIncludes/curriculumDetailsReadOnly.jsp"%>
					</rich:tab>
					<rich:tab id="curriculumProgressPage"
						label="#{msg.curriculumProgress}">
						<%@include file="/WEB-INF/jsfIncludes/curriculumProgressList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>

			<rich:tab id="timeTableTabs" label="#{msg.timeTable}" status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">

				<rich:tabPanel switchType="ajax" width="100%" id="timeTablePanelT"
					immediate="true">
					<rich:tab id="viewTimeTable" label="#{msg.timeTable}"
						status="status"
						rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">
						<%@include file="/WEB-INF/jsfIncludes/timeTable.jsp"%>
					</rich:tab>

					<rich:tab id="viewExamTimeTable"
						label="#{msg.exams}" status="status"
						rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">
						<%@include file="/WEB-INF/jsfIncludes/examTimeTable.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>
			<rich:tab id="teacherProfile" label="#{msg.profile}" status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{userBean.getTeacherProfile}" reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="teacherProfile" />
				</a4j:support>
				<%@include file="/WEB-INF/jsfIncludes/userProfile.jsp"%>
				<br />
			</rich:tab>

			<rich:tab id="demandes" label="#{msg.request}" status="status"
				rendered="#{teacherBean.teacherSelected && teacherBean.teacher.school.id == user.school.id }">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{productBean.getAllTeacherDemands}"
					reRender="teacherPanel">
					<a4j:actionparam assignTo="#{teacherBean.selectedTab}"
						value="demandes" />
				</a4j:support>
				<rich:tabPanel switchType="ajax" width="100%"
					id="teacherDemandPanel" immediate="true">
					<rich:tab id="teacherDemandDetails" label="#{msg.makeADemand }">
						<%@include file="/WEB-INF/jsfIncludes/teacherDemande.jsp"%>
					</rich:tab>
					<rich:tab id="teacherDemandList" label="#{msg.demandList }">
						<%@include file="/WEB-INF/jsfIncludes/teacherDemandeList.jsp"%>
					</rich:tab>
				</rich:tabPanel>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>