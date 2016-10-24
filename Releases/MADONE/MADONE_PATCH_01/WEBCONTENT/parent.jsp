<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr valign="top">
		<td valign="top"><rich:simpleTogglePanel switchType="ajax"
			label="#{parentBean.parent.lastName} #{parentBean.parent.firstName }" id="parentHeaderPannel"
			opened="false">
			<a4j:outputPanel ajaxRendered="true">
				<h:panelGroup id="infoImageHeader2">
					<a4j:mediaOutput id="ParentPhotoHeader2" element="img"
						mimeType="image/gif" style="width:100px; height:100px;"
						createContent="#{parentBean.paint}" value="#{parentBean.random}"
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
			switchType="ajax" width="100%" id="parentPanel"
			selectedTab="#{parentBean.selectedTab}" immediate="true">
			<rich:tab id="studentList" label="#{msg.research}" status="status">
				<%@include file="/WEB-INF/jsfIncludes/parentList.jsp"%>
			</rich:tab>

			<rich:tab id="parentDetails" label="#{msg.details}" status="status">
				<f:attribute name="tabName" value="PARENT_DETAILS" />
				<%@include file="/WEB-INF/jsfIncludes/parentDetails.jsp"%>
			</rich:tab>
			
			<rich:tab id="menuStudentDetails" label="#{msg.childDetails}" status="status">
				<f:attribute name="tabName" value="STUDENT_DETAILS" />
				<%@include file="/WEB-INF/jsfIncludes/studentview.jsp"%>
			</rich:tab>
			
		</rich:tabPanel></td> 
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>