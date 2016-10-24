<a4j:form>
<a4j:region>
	<a4j:outputPanel id="curriculumProgresses">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{curriculumProgressBean.curriculumProgresses}" var="curriculumProgress"
			rendered="#{curriculumProgressBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.curriculumProgresses}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column filterBy="#{curriculumProgress.curriculum.schoolYear.year}" filterEvent="onkeyup" sortBy="#{curriculumProgress.curriculum.schoolYear.year}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.schoolYear}"/>
	            </f:facet>
		            <h:outputText value="#{curriculumProgress.curriculum.schoolYear.year}" />
		    </rich:column>

		    <rich:column filterBy="#{curriculumProgress.curriculum.level.name}" filterEvent="onkeyup" sortBy="#{curriculumProgress.curriculum.level.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.level}"/>
	            </f:facet>
		            <h:outputText value="#{curriculumProgress.curriculum.level.name}" />
		    </rich:column>

		    <rich:column filterBy="#{curriculumProgress.curriculum.subject.name}" filterEvent="onkeyup" sortBy="#{curriculumProgress.curriculum.subject.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.subject}"/>
	            </f:facet>
		            <h:outputText value="#{curriculumProgress.curriculum.subject.name}" />
		    </rich:column>

		    <rich:column filterBy="#{curriculumProgress.curriculum.weekNumber}" filterEvent="onkeyup" sortBy="#{curriculumProgress.curriculum.weekNumber}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.weekNumber}"/>
	            </f:facet>
		            <h:outputText value="#{curriculumProgress.curriculum.weekNumber}" />
		    </rich:column>

		  <rich:column filterBy="#{curriculumProgress.curriculum.weekStartDate}" filterEvent="onkeyup" sortBy="#{curriculumProgress.curriculum.weekStartDate}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.weekStartDate}"/>
	            </f:facet>
	            <h:outputText value="#{curriculumProgress.curriculum.weekStartDate}" >
	            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
				</h:outputText>
		    </rich:column>

		    <rich:column filterBy="#{curriculumProgress.status}" filterEvent="onkeyup" sortBy="#{curriculumProgress.status}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.status}"/>
	            </f:facet>
		            <h:outputText value="#{curriculumProgress.statusDescription}" />
		    </rich:column>

	 		<rich:column>
				<f:facet name="header">
					<h:outputText value="#{msg.comment}" />
				</f:facet>
 				<h:outputText escape="false" value="#{curriculumProgress.shortComment}"/>
			
				<a4j:commandLink ajaxSingle="true" id="readMore"
					rendered="#{curriculumProgress.showCommentLink}"
					action="#{curriculumProgressBean.edit}"
					oncomplete="#{rich:component('curriculumProgressObjectiveResultPanel')}.show();"
					reRender="curriculumProgressObjectiveResultPanel" value="#{msg.readMore}">
	
					<f:param name="id" value="#{curriculumProgress.id}" />
				</a4j:commandLink>
			</rich:column> 
			
		    <rich:column width="60" rendered="#{ link == 'school' }">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" 
		        		oncomplete="#{rich:component('cpObjectiveResultPanel')}.show()"
						reRender="cpObjectiveResultPanel"
		        		action="#{curriculumProgressBean.edit}">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{curriculumProgress.id}"/>
		        </a4j:commandLink>  
		        
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{curriculumProgressBean.delete}" reRender="gestionCurriculumProgress, curriculumProgresses">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{curriculumProgress.id}"/>
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
				<h:outputText value="#{curriculumProgressBean.errorMessage}"/>		
	 		</error>
		</font>
		<font color="#00FF00">
			<success>
				<h:outputText value="#{curriculumProgressBean.successMessage}" />
			</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>


<rich:modalPanel id="cpObjectiveResultPanel" autosized="true" width="400">
	<f:facet name="header">
		<h:outputText value="#{msg.objective}" />
	</f:facet>
	<f:facet name="controls">
		<h:panelGroup>
			<h:graphicImage value="/images/close.png" id="hidelink223"
				styleClass="hidelink" />
			<rich:componentControl for="cpObjectiveResultPanel"
				attachTo="hidelink223" operation="hide" event="onclick" />
		</h:panelGroup>
	</f:facet>
		<a4j:region>
	<a4j:form>
		<a4j:outputPanel id="curriculumProgressDetails1">
			<table>
				<tr>
					<td><h:outputText value="#{msg.schoolYear}" /></td>
					<td><h:outputText
						value="#{curriculumProgressBean.curriculumProgress.curriculum.schoolYear.year}" /></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.level}" /></td>
					<td><h:outputText
						value="#{curriculumProgressBean.curriculumProgress.curriculum.level.name}" /></td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.subject}" /></td>
					<td><h:outputText
						value="#{curriculumProgressBean.curriculumProgress.curriculum.subject.name}" /></td>
				</tr>
	
				<tr>
					<td><h:outputText value="#{msg.weekStartDate}" /></td>
					<td><h:outputText
						value="#{curriculumProgressBean.curriculumProgress.curriculum.weekStartDate}">
						<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
					</h:outputText></td>
				</tr>
	
	
				<tr>
					<td><h:outputText value="#{msg.weekNumber}" /></td>
					<td><h:outputText
						value="#{curriculumProgressBean.curriculumProgress.curriculum.weekNumber}" /></td>
				</tr>
				<tr>
	
					<td colspan="2"><h:outputText escape="false"
						value="#{curriculumProgressBean.curriculumProgress.curriculum.objective}" /></td>
				</tr>
	
				<tr>
					<td><h:outputText value="#{msg.classe}" /></td>
					<td><rich:comboBox id="levelClass"
						value="#{curriculumProgressBean.levelClassName}" disabled="true"
						suggestionValues="#{link == 'teacher' ? courseBean.allTeacherClasses : levelClassBean.allLevelClasses}">
					</rich:comboBox></td>
				</tr>
	
				<tr>
					<td><h:outputText value="#{msg.status}" /></td>
					<td><h:selectOneMenu id="status"
						value="#{curriculumProgressBean.curriculumProgress.status}"
						binding="#{curriculumProgressBean.myValue}">
						<f:selectItems value="#{curriculumProgressBean.configurationsByGroupName}" />
						<f:attribute name="groupName" value="CURRICULUM_PROGRESS_STATUS" />
					</h:selectOneMenu></td>
	
				</tr>
				<tr>
					<td><h:outputText value="#{msg.comment}" /></td>
					<td><h:inputTextarea id="CommentCuri"
						value="#{curriculumProgressBean.curriculumProgress.comment}"
						rows="5" cols="50" /></td>
				</tr>
	
				<tr>
					<td><a4j:commandButton value="#{msg.save}"
						rendered="#{ schoolBean.userHasWriteAccess && (link == 'school' || link == 'teacher')}"
						action="#{curriculumProgressBean.insert}"
						oncomplete="#{rich:component('cpObjectiveResultPanel')}.hide()"
						reRender="curriculumProgresses" /></td>
					<td><a4j:region>
						<a4j:commandButton value="#{msg.clear}"
							action="#{curriculumProgressBean.clearComment}"
							reRender="curriculumProgressDetails1" />
					</a4j:region></td>
				</tr>
			</table>
		</a4j:outputPanel>
		
		</a4j:form>
	</a4j:region>
</rich:modalPanel>




<rich:modalPanel id="curriculumProgressObjectiveResultPanel" autosized="true"
	width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.comment}" />
	</f:facet>
	<a4j:form>
		<p><h:outputText escape="false" value="#{curriculumProgressBean.curriculumProgress.comment}"> </h:outputText></p>
		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('curriculumProgressObjectiveResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>