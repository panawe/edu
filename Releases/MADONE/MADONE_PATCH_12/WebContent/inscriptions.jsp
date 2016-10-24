<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top">
			<rich:tabPanel switchType="ajax" width="100%" id="Inscriptions">

				<rich:tab id="schoolLevelClass" label="#{msg.enrollments}">
					<%@include file="/WEB-INF/jsfIncludes/levelsClassDetails.jsp"%>
				</rich:tab>

				<rich:tab id="importEnrollment" label="#{msg.importEnrollments}">
					<a4j:form>
						<a4j:region>
							<a4j:commandButton ajaxSingle="true" id="importEnrollmentFromFile"
								onclick="#{rich:component('enrollmentImportFilePanel')}.show()"
								rendered="#{levelClassBean.userHasWriteAccess}"
								reRender="importEnrollmentFileInfo" value="#{msg.importEnrollments}"
								oncomplete="#{rich:component('enrollmentImportFilePanel')}.show();">
							</a4j:commandButton>
						</a4j:region>
					</a4j:form>
					
					<rich:modalPanel id="enrollmentImportFilePanel" rendered="true" height="300">
						<a4j:form>
							<f:facet name="header">
								<h:outputText value="#{msg.result}" />
							</f:facet>
							<table>
								<a4j:region>
									<tr>
										<td colspan="3"><rich:fileUpload 
										ajaxSingle="true" noDuplicate="true" immediate="true" 
										disabled="false"
											fileUploadListener="#{levelClassBean.uploadOldEnrollments}"
											maxFilesQuantity="5" id="uploadEnrollmentData" listWidth="250"
											listHeight="70" immediateUpload="#{levelClassBean.autoUpload}"
											addControlLabel="#{msg.importEnrollments}"
											clearAllControlLabel="#{msg.removeAll }"
											clearControlLabel="#{msg.remove }"
											stopEntryControlLabel="#{msg.stop}"
											uploadControlLabel="#{msg.upload}"
											allowFlash="#{levelClassBean.useFlash}">
											<a4j:support event="onuploadcomplete" reRender="importEnrollmentFileInfo" />
											<f:facet name="label">
												<h:outputText value="{_KB}KB de {KB}KB charge --- {mm}:{ss}" />
											</f:facet>
										</rich:fileUpload></td>
									</tr>
									
								</a4j:region>
							</table>
						</a4j:form>
						<h:panelGroup id="importEnrollmentFileInfo">
				               <f:facet name="header">
								<h:outputText value="#{msg.result}" />
							</f:facet>
							<a4j:form>
								<p>
									<h:inputTextarea id="errors" style="#{ empty levelClassBean.errorMessage ? 'border-color:black;' : 'border-color:red;'}"
										value="#{levelClassBean.errorMessage}" rows="3" cols="50">
									</h:inputTextarea>
								</p>
						
								<p><a4j:commandButton value="#{msg.close }" immediate="true"
									action="#{levelClassBean.clearMessages}"
									oncomplete="#{rich:component('enrollmentImportFilePanel')}.hide();" /></p>
							</a4j:form>
					    </h:panelGroup>
					</rich:modalPanel>
				</rich:tab>
			</rich:tabPanel>
		 </td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>