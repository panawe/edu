
<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>

	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->

	<tr>
		<td valign="top">
		
			<rich:simpleTogglePanel switchType="ajax"
				label="#{testBean.test.title}" id="selectedTestSummary"
				opened="false" >
				<a4j:outputPanel ajaxRendered="true"> 
						<h:outputText value="#{testBean.test.description }" escape="false"/> 
				</a4j:outputPanel>
			</rich:simpleTogglePanel>
			
			<rich:tabPanel id="onlineTestPanel" switchType="ajax" width="100%"
				selectedTab="#{testBean.selectedTab}">

				<rich:tab id="testListtab" label="#{msg.search }">
				 
					<%@include file="/WEB-INF/jsfIncludes/testList.jsp"%>
	 
				</rich:tab>

				<rich:tab id="testDetailTab" label="#{msg.details }">
				
					<%@include file="/WEB-INF/jsfIncludes/testDetails.jsp"%>
				 
				</rich:tab>

				<rich:tab id="QuestionListPanel" label="#{msg.questions }"
					rendered="#{testBean.testSelected }">					
					<%@include file="/WEB-INF/jsfIncludes/testQuestionList.jsp"%>
				</rich:tab>

				<rich:tab id="UserTests" label="#{msg.students}"
					rendered="#{testBean.testSelected }">
					<a4j:form>
					<%@include file="/WEB-INF/jsfIncludes/userTest.jsp"%>
					</a4j:form>
				</rich:tab>

				<rich:tab id="UserTestResults" label="#{msg.result}"
					rendered="#{testBean.testSelected }">
					
					<%@include file="/WEB-INF/jsfIncludes/testResults.jsp"%>
					 
				</rich:tab>

			</rich:tabPanel>
		</td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>


</f:view>
