<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:modalPanel id="tabLoading"
			autosized="true" width="100" height="40" moveable="false"
			resizeable="false">
			<f:facet name="header">
				<h:outputText value="#{msg.operationInProgress }" />
			</f:facet>
			<h:outputText value="#{msg.oneMomentPlease }" />
		</rich:modalPanel> <a4j:status id="status" forceId="true"
			onstart="#{rich:component('tabLoading')}.show()"
			onstop="#{rich:component('tabLoading')}.hide()" /> <rich:tabPanel
			switchType="ajax" width="100%" id="OtherConfigPanel">


			<rich:tab status="status" id="schoolLevel1"
				label="#{msg.schoolLevel}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/levelList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/levelDetails.jsp"%>
				</a4j:form>
			</rich:tab>
			<rich:tab status="status" id="SchoolSubjects" label="#{msg.subject}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/subjectList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/subjectDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="SchoolExamType" label="#{msg.examType}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/examTypeList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/examTypeDetails.jsp"%>
				</a4j:form>
			</rich:tab>


			<rich:tab status="status" id="Position" label="#{msg.position}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/positionList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/positionDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="Country" label="#{msg.country}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/countryList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/countryDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="city" label="#{msg.city}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/cityList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/cityDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="religion" label="#{msg.schoolReligion}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/schoolReligionList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/schoolReligionDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="schoolType" label="#{msg.schoolType}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/schoolTypeList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/schoolTypeDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="PayType" label="#{msg.payType}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/payTypeList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/payTypeDetails.jsp"%>
				</a4j:form>
			</rich:tab>

			<rich:tab status="status" id="eventType" label="#{msg.eventType}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/eventList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/eventDetails.jsp"%>
				</a4j:form>
			</rich:tab>
			<rich:tab status="status" id="schoolYear" label="#{msg.schoolYear}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/schoolYearList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/schoolYearDetails.jsp"%>
				</a4j:form>
			</rich:tab>
			<rich:tab status="status" id="schoolTermGroup" label="#{msg.termGroups}">
				<%@include file="/WEB-INF/jsfIncludes/termGroupList.jsp"%>
				<%@include file="/WEB-INF/jsfIncludes/termGroupDetails.jsp"%>
			</rich:tab>
			<rich:tab status="status" id="schoolList" label="#{msg.terms}">
				<%@include file="/WEB-INF/jsfIncludes/termList.jsp"%>
				<%@include file="/WEB-INF/jsfIncludes/termDetails.jsp"%>
			</rich:tab>
			<rich:tab status="status" id="disease" label="#{msg.disease}">
				<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/diseaseList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/diseaseDetails.jsp"%>
				</a4j:form>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>
</f:view>