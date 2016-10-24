<a4j:region>
	<a4j:outputPanel id="teacherEnrollments">
		<rich:dataTable rows="5" value="#{teacherEnrollmentBean.teacherEnrollments}" var="teacherEnrollment"
			rendered="#{teacherEnrollmentBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.enrollments}"/>
	        	</h:outputFormat>
	        </f:facet>
		        

			<rich:column filterBy="#{teacherEnrollment.schoolYear.year}" filterEvent="onkeyup" sortBy="#{teacherEnrollment.schoolYear.year}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.year}"/>
	            </f:facet>
		            <h:outputText value="#{teacherEnrollment.schoolYear.year}" />
		    </rich:column>
		   
		   <rich:column filterBy="#{teacherEnrollment.school.name}" filterEvent="onkeyup" sortBy="#{teacherEnrollment.school.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.school}"/>
	            </f:facet>
		            <h:outputText value="#{teacherEnrollment.school.name}" />
		    </rich:column>
		    
		   	<rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.date}"/>
	            </f:facet>
		            <h:outputText value="#{teacherEnrollment.enrollmentDate}">
		            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
		            </h:outputText>
		    </rich:column>
		        
		    <rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.comments}"/>
	            </f:facet>
		            <h:outputText value="#{teacherEnrollment.comments}" />
		    </rich:column>
		    
		    <rich:column>
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{teacherEnrollmentBean.edit}" reRender="gestionTeacherEnrollment">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{teacherEnrollment.id}"/>
		        </a4j:commandLink>  
		         <SPACER TYPE=HORIZONTAL SIZE=50>
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{teacherEnrollmentBean.delete}" reRender="gestionTeacherEnrollment, teacherEnrollments">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{teacherEnrollment.id}"/>
		        </a4j:commandLink>
		        
		        <rich:toolTip for="modify" value="#{msg.modify}"/>      
                <rich:toolTip for="delete" value="#{msg.delete}"/> 
		    </rich:column>
		        
		    <f:facet name="footer">
	            <rich:datascroller id="ds"></rich:datascroller>
	        </f:facet>
		</rich:dataTable>
		<br/>
			   
		<font color="#FF0000">
			<error>		
				<h:outputText value="#{teacherEnrollmentBean.errorMessage}"/>		
	 		</error>
		</font>
		<font color="#00FF00">
			<success>
				<h:outputText value="#{teacherEnrollmentBean.successMessage}" />
			</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
