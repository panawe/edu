<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="coursePanel" selectedTab="#{courseBean.selectedTabCourse}"
			immediate="true">

			<rich:tab id="courseList" label="#{msg.research}">
			 <a4j:support event="ontabenter" ajaxSingle="true"
					action="#{courseBean.getAll}" reRender="courses" />
				<%@include file="/WEB-INF/jsfIncludes/courseList.jsp"%>
			</rich:tab>

			<rich:tab id="courseDetail" label="#{msg.details}">
				<%@include file="/WEB-INF/jsfIncludes/courseDetails.jsp"%>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>