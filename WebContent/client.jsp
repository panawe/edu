<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr valign="top">
		<td valign="top"><rich:simpleTogglePanel switchType="ajax"
			label="#{clientBean.client.name}" id="clientHeaderPannel"
			opened="false">
			<a4j:outputPanel ajaxRendered="true">
				<h:panelGroup id="infoImageHeader2">
					<a4j:mediaOutput id="clientPhotoHeader2" element="img"
						mimeType="image/gif" style="width:100px; height:100px;"
						createContent="#{clientBean.paint}" value="#{clientBean.random}"
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
			switchType="ajax" width="100%" id="clientPanel"
			selectedTab="#{clientBean.selectedTab}" immediate="true">
			<rich:tab id="clientList" label="#{msg.research}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/iproject/clientList.jsp"%>
			</rich:tab>

			<rich:tab id="clientDetails" label="#{msg.details} #{msg.client}" status="status">
				<f:attribute name="tabName" value="CLIENT_DETAILS" />
				<%@include file="/WEB-INF/jsfIncludes/iproject/clientDetails.jsp"%>
			</rich:tab>

			<rich:tab id="projectTab" label="#{msg.project}"
				rendered="#{clientBean.clientSelected }" status="status">
				<a4j:support event="ontabenter" ajaxSingle="true"
					action="#{projectBean.getClientProjects}" reRender="clientPanel">
					<f:param name="selectedTab" value="project" />
				</a4j:support>
				<a4j:outputPanel id="clientTab">
					<rich:tabPanel switchType="ajax" width="100%"
						id="clientProjectPanel"
						selectedTab="#{projectBean.selectedProjectTab }" immediate="true">

						<rich:tab id="clientProjectList" label="#{msg.projectLists}">
							<%@include file="/WEB-INF/jsfIncludes/iproject/projectList.jsp"%>
						</rich:tab>
						<rich:tab id="clientProjectDetails" label="#{msg.details} #{msg.project}" rendered="#{clientBean.client.school.id == user.school.id}">
							<%@include file="/WEB-INF/jsfIncludes/iproject/projectDetails.jsp"%>
						</rich:tab>
						<rich:tab id="subProjectTab" label="#{msg.subProject }" rendered="#{projectBean.projectSelected }">
							<a4j:support event="ontabenter" ajaxSingle="true"
								action="#{subProjectBean.getProjectSubProjects}" reRender="clientProjectPanel">
								<f:param name="selectedTab" value="subProject" />
							</a4j:support>
							<rich:tabPanel switchType="ajax" width="100%"
								id="clientSubProjectPanel"
								selectedTab="#{subProjectBean.selectedSubProjectTab}" immediate="true">
		
								<rich:tab id="clientSubProjectList" label="#{msg.subProjectLists }">
									<%@include file="/WEB-INF/jsfIncludes/iproject/subProjectList.jsp"%>
								</rich:tab>
								<rich:tab id="clientSubProjectDetails" label="#{msg.details}" rendered="#{clientBean.client.school.id == user.school.id}">
									<%@include file="/WEB-INF/jsfIncludes/iproject/subProjectDetails.jsp"%>
								</rich:tab>
							</rich:tabPanel>
						</rich:tab>
						<rich:tab id="userProjectTab" label="#{msg.resources }" rendered="#{projectBean.projectSelected }">
							<a4j:support event="ontabenter" ajaxSingle="true"
								action="#{userProjectBean.findUserProjects}" reRender="clientProjectPanel">
								<f:param name="selectedTab" value="userProject" />
							</a4j:support>
							<rich:tabPanel switchType="ajax" width="100%"
								id="clientUserProjectPanel"
								selectedTab="#{userProjectBean.selectedUserProjectTab}" immediate="true">
		
								<rich:tab id="clientUserProjectList" label="#{msg.resourceLists }">
									<%@include file="/WEB-INF/jsfIncludes/iproject/userProjectList.jsp"%>
								</rich:tab>
								<rich:tab id="clientUserProjectDetails" label="#{msg.details}" rendered="#{clientBean.client.school.id == user.school.id}">
									<%@include file="/WEB-INF/jsfIncludes/iproject/userProjectDetails.jsp"%>
								</rich:tab>
							</rich:tabPanel>
						</rich:tab>
					</rich:tabPanel>
				</a4j:outputPanel>
			</rich:tab>
		
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>