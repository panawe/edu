<a4j:form>
<a4j:region>
	<a4j:outputPanel id="examTimeTables">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{examTimeTableBean.timeTables}" var="timeTable"
			rendered="#{examTimeTableBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.examTimeTables}">
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column filterBy="#{timeTable.levelClass.name}" filterEvent="onkeyup" sortBy="#{timeTable.levelClass.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.levelClass}"/>
	            </f:facet>
		            <h:outputText value="#{timeTable.levelClass.name}" />
		    </rich:column>

		     <rich:column filterBy="#{timeTable.course.subject.name}" filterEvent="onkeyup" sortBy="#{timeTable.course.subject.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.subject}"/>
	            </f:facet>
		            <h:outputText value="#{timeTable.course.subject.name}" />
		    </rich:column>
		    
		     <rich:column filterBy="#{timeTable.schoolYear.year}" filterEvent="onkeyup" sortBy="#{timeTable.schoolYear.year}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.year}"/>
	            </f:facet>
		            <h:outputText value="#{timeTable.schoolYear.year}" />
		    </rich:column>
		    
		     <rich:column filterBy="#{timeTable.examDate}" filterEvent="onkeyup" sortBy="#{timeTable.examDate}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.examDate}"/>
	            </f:facet>
		            <h:outputText value="#{timeTable.examDate}" />
		    </rich:column>
		      		
		    <rich:column filterBy="#{timeTable.beginTime}" filterEvent="onkeyup" sortBy="#{timeTable.beginTime}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.beginTime}"/>
	            </f:facet>
		            <h:outputText value="#{timeTable.beginTime}" />
		    </rich:column>     
		    
		    <rich:column filterBy="#{timeTable.endTime}" filterEvent="onkeyup" sortBy="#{timeTable.endTime}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.endTime}"/>
	            </f:facet>
		            <h:outputText value="#{timeTable.endTime}" />
		    </rich:column>   
		    <rich:column width="60">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{examTimeTableBean.edit}" reRender="gestionExamTimeTable">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{timeTable.id}"/>
		        </a4j:commandLink>  
		        
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{examTimeTableBean.delete}" reRender="gestionExamTimeTable, examTimeTables">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{timeTable.id}"/>
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
		<h:outputText value="#{examTimeTableBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{examTimeTableBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>