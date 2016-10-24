<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="securityPanel" selectedTab="" immediate="true">
			<rich:tab id="role" label="#{msg.role}">
				<%@include file="/WEB-INF/jsfIncludes/roleList.jsp"%>

				<%@include file="/WEB-INF/jsfIncludes/roleDetails.jsp"%>
			</rich:tab>
			<rich:tab id="menu" label="#{msg.menu}">
				<%@include file="/WEB-INF/jsfIncludes/menuList.jsp"%>

				<%@include file="/WEB-INF/jsfIncludes/menuDetails.jsp"%>
			</rich:tab>

			<rich:tab id="user" label="#{msg.user}">
				<%@include file="/WEB-INF/jsfIncludes/userList.jsp"%>

				<%@include file="/WEB-INF/jsfIncludes/userProfile.jsp"%>
			</rich:tab>
			<rich:tab id="roleMenuDetails" label="#{msg.roleMenuDetails}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{roleBean.populateMenus}" reRender="gestionRoleMenu" />
				<%@include file="/WEB-INF/jsfIncludes/roleMenuDetails.jsp"%>
			</rich:tab>

			<rich:tab id="roleUserDetails" label="#{msg.roleUserDetails}">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{roleBean.populateUsers}" reRender="gestionRoleUser" />
				<%@include file="/WEB-INF/jsfIncludes/roleUserDetails.jsp"%>
			</rich:tab>			
 		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>