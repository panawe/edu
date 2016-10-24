<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top">
				<rich:modalPanel id="tabLoading" autosized="true" width="100"
			height="40" moveable="false" resizeable="false">
			<f:facet name="header">
				<h:outputText value="#{msg.operationInProgress }" />
			</f:facet>
			<h:outputText value="#{msg.oneMomentPlease }" />
		</rich:modalPanel> <a4j:status id="status" forceId="true"
			onstart="#{rich:component('tabLoading')}.show()"
			onstop="#{rich:component('tabLoading')}.hide()" />
		<rich:tabPanel switchType="ajax" width="100%"
			id="schoolConfigPanel" selectedTab="#{schoolBean.selectedTab}" immediate="true">

			<rich:tab id="schoolDetail" label="#{msg.school}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/schoolDetails.jsp"%>
			</rich:tab>

			<rich:tab status="status" id="schoolLevelClass" label="#{msg.levelClass}">

					<rich:tabPanel switchType="ajax" width="100%"
						id="schoolLevelClassPanel" immediate="true">
						<rich:tab id="schoolLevelClassPage" label="#{msg.levelClass}">
							<%@include file="/WEB-INF/jsfIncludes/levelClassList.jsp"%>
							<br />
							<%@include file="/WEB-INF/jsfIncludes/levelClassDetails.jsp"%>
						</rich:tab>
						<rich:tab id="studentList" label="#{msg.student}"
							rendered="#{levelClassBean.levelClass != null && levelClassBean.levelClass.id != null }">
							<%@include file="/WEB-INF/jsfIncludes/studentList.jsp"%>
						</rich:tab>
						<rich:tab id="courseList" label="#{msg.course}"
							rendered="#{levelClassBean.levelClass != null && levelClassBean.levelClass.id != null }">
							<%@include file="/WEB-INF/jsfIncludes/courseList.jsp"%>
						</rich:tab>
					</rich:tabPanel>
			</rich:tab>

			<rich:tab status="status" id="SchoolGrade" label="#{msg.grade}">
				<a4j:support event="ontabenter"
					action="#{schoolBean.justDoIt}" reRender="schoolConfigPanel">
					<f:param name="selectedTab" value="SchoolGrade" />
				</a4j:support>
					<a4j:form>
						<%@include file="/WEB-INF/jsfIncludes/gradeList.jsp"%>
						<br />
						<%@include file="/WEB-INF/jsfIncludes/gradeDetails.jsp"%>
					</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="TuitionType" label="#{msg.tuitionType}">
				<a4j:support event="ontabenter"
					action="#{schoolBean.justDoIt}" reRender="schoolConfigPanel">
					<f:param name="selectedTab" value="TuitionType" />
				</a4j:support>
					<a4j:form>
						<%@include file="/WEB-INF/jsfIncludes/tuitionTypeList.jsp"%>
						<br />
						<%@include file="/WEB-INF/jsfIncludes/tuitionTypeDetails.jsp"%>
					</a4j:form>
			</rich:tab>
			
			<rich:tab status="status" id="furnitureTabMain" label="#{msg.furniture}">
				<a4j:support event="ontabenter"
					action="#{schoolEventBean.justDoIt}" reRender="schoolConfigPanel">
					<f:param name="selectedTab" value="furnitureTabMain" />
				</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%" id="furnitureTab"
						immediate="true"  selectedTab="#{furnitureBean.selectedTabFurniture}">
						<rich:tab id="furnitureList" label="#{msg.furniture}">						 
								<%@include file="/WEB-INF/jsfIncludes/furnitureList.jsp"%>
						</rich:tab>	
						<rich:tab id="furnitureDetail" label="#{msg.details}">
								<%@include file="/WEB-INF/jsfIncludes/furnitureDetails.jsp"%>
						</rich:tab>
					</rich:tabPanel>
			</rich:tab>
			<rich:tab status="status" id="schoolEvent" label="#{msg.event}">
				<a4j:support event="ontabenter"
					action="#{schoolEventBean.getAll}" reRender="schoolEvents">
					<f:param name="selectedTab" value="schoolEvent" />
				</a4j:support>
					<%@include file="/WEB-INF/jsfIncludes/schoolEventList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/schoolEventDetails.jsp"%>
			</rich:tab>
			
			<rich:tab status="status" id="schoolNews" label="#{msg.news}">
				<a4j:support event="ontabenter"
					action="#{schoolBean.justDoIt}" reRender="schoolConfigPanel">
					<f:param name="selectedTab" value="schoolNews" />
				</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%" id="newsPanel1"
						selectedTab="#{newsBean.selectedTab}" immediate="true">
	
						<rich:tab id="newsList" label="#{msg.research}">
							<a4j:support event="ontabenter" ajaxSingle="true"
								action="#{newsBean.getAll}" reRender="newss" />
							<%@include file="/WEB-INF/jsfIncludes/newsList.jsp"%>
						</rich:tab>
	
						<rich:tab id="newsDetail" label="#{msg.details}">
							<%@include file="/WEB-INF/jsfIncludes/newsDetails.jsp"%>
						</rich:tab>
					</rich:tabPanel>
			</rich:tab>
			
			<rich:tab status="status" id="curriculumTabMain" label="#{msg.curriculum}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{curriculumBean.getAll}" reRender="schoolConfigPanel">
					<f:param name="selectedTab" value="curriculumTabMain" />
				</a4j:support>
					<rich:tabPanel switchType="ajax" width="100%" id="CurriculumTab"
						immediate="true"  selectedTab="#{curriculumProgressBean.selectedTabCurriculumProgress}">
						<rich:tab id="curriculum" label="#{msg.curriculum}">
						 
								<%@include file="/WEB-INF/jsfIncludes/curriculumList.jsp"%>
								<br />
								<%@include file="/WEB-INF/jsfIncludes/curriculumDetails.jsp"%>
							 
						</rich:tab>
	
						<rich:tab id="curriculumProgress" label="#{msg.curriculumProgress}">
							 
								<%@include file="/WEB-INF/jsfIncludes/curriculumProgressList.jsp"%>
	
						</rich:tab>
					</rich:tabPanel>
			</rich:tab>
			
			<rich:tab status="status" id="timeTableTABB" label="#{msg.timeTable}">
				<rich:tabPanel switchType="ajax" width="100%" id="TimeTablePanel"
					immediate="true">
					<rich:tab id="timeTable" label="#{msg.timeTable}">
							<%@include file="/WEB-INF/jsfIncludes/timeTableList.jsp"%>
							<br />
							<%@include file="/WEB-INF/jsfIncludes/timeTableDetails.jsp"%>
					</rich:tab>

					<rich:tab id="viewTimeTable" label="#{msg.viewTimeTableShort}">
							<%@include file="/WEB-INF/jsfIncludes/timeTable.jsp"%>
					</rich:tab>

					<rich:tab id="examTimeTable" label="#{msg.examTimeTableShort}">
							<%@include file="/WEB-INF/jsfIncludes/examTimeTableList.jsp"%>
							<br />
							<%@include file="/WEB-INF/jsfIncludes/examTimeTableDetails.jsp"%>
					</rich:tab>

					<rich:tab id="viewExamTimeTable" label="#{msg.viewExamTimeTableShort}">
						<%@include file="/WEB-INF/jsfIncludes/examTimeTable.jsp"%>
					</rich:tab>
				</rich:tabPanel>

			</rich:tab>

			<rich:tab status="status" id="AdditionalConfiguration" label="#{msg.configuration}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{schoolBean.justDoIt}" reRender="schoolConfigPanel">
					<f:param name="selectedTab" value="AdditionalConfiguration" />
				</a4j:support>
					<a4j:form>
						<%@include file="/WEB-INF/jsfIncludes/configurationList.jsp"%>
						<br />
						<%@include file="/WEB-INF/jsfIncludes/configurationDetails.jsp"%>
					</a4j:form>
			</rich:tab>

		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>