<a4j:region>
	<a4j:outputPanel id="gestionTeacherEnrollment">
		<rich:panel>
			<f:facet name="header">
	        	<h:outputFormat value="#{msg.detailsHeader}">
	        		 <f:param value="#{msg.enrollment}"/>
	        	</h:outputFormat>
		    </f:facet>
			<table class="table">
				
				<!-- Level School Year Suggestion Box -->
				<tr>
					<a4j:region>
						<td>
							<h:outputText value="#{msg.year }" />
						</td>
						<td>
							<rich:comboBox id="schoolYear" value="#{teacherEnrollmentBean.schoolYearName}"
								suggestionValues="#{schoolYearBean.allSchoolYears}">
							</rich:comboBox> 
							<font color="#FF0000"><rich:message for="schoolYear" /></font>
						</td>
					</a4j:region>
				</tr>

				<tr>
					<a4j:region>
						<td>
							<h:outputText value="#{msg.school}" />
						</td>
						<td>
							<rich:comboBox id="school" value="#{teacherEnrollmentBean.schoolName}"
								suggestionValues="#{schoolBean.allSchools}">
							</rich:comboBox> 
							<font color="#FF0000"><rich:message for="schoolName" /></font>
						</td>
					</a4j:region>
				</tr>
				
				<tr>
					<td><h:outputText value="#{msg.comments}" /></td>
					<td><h:inputTextarea id="enrollmentComments"
						value="#{teacherEnrollmentBean.teacherEnrollment.comments}" rows ="5"
						cols="50" >
					</h:inputTextarea></td>
					<td><font color="#FF0000"><rich:message
						for="enrollmentComments" /></font></td>
				</tr>
				
				<tr>
					<td><h:outputText value="#{msg.date}" /></td>
					<td><rich:calendar id="enrollmentDate"
						value="#{teacherEnrollmentBean.teacherEnrollment.enrollmentDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						style="width:200px">
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message
						for="enrollmentDate" /></font></td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{teacherEnrollmentBean.insert}"
				reRender="teacherEnrollments, gestionTeacherEnrollment" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{teacherEnrollmentBean.clear}" reRender="gestionTeacherEnrollment" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
