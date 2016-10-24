<script type="text/javascript">
	function changeMeElement(value) {
		document.getElementById('teacherSearchCriteriaForm:exportButton').style.display = (value == 'false'? 'block' : 'none');
	}
</script>

<a4j:form id="teacherSearchCriteriaForm">
	<a4j:region>
		<table width="50%">
			<tr>
				<td><h:outputText value="#{msg.matricule }" /></td>
				<td width="30%"><h:inputText id="searchMatricule"
					onkeyup="convertToUpperCase(this);" 
					disabled="#{teacherBean.selectAllTeachers}" 
					value="#{teacherBean.matricule}" /></td>
					
				<td><h:outputText value="#{msg.lastName }" /></td>
				<td width="30%"><h:inputText id="searchLastName" 
				disabled="#{teacherBean.selectAllTeachers}" 
					onkeyup="convertToUpperCase(this);" value="#{teacherBean.lastName}" /></td>

				<td><h:outputText value="#{msg.firstName }" /></td>
				<td width="30%"><h:inputText id="searchFirstName" 
					disabled="#{teacherBean.selectAllTeachers}" 
					onkeyup="convertToUpperCase(this);"
					value="#{teacherBean.firstName}" /></td>
					
				<td colspan="2">
					<h:outputText value="#{msg.allTeachers }" /> 
					<h:selectBooleanCheckbox id="selectAllTeachers"
						value="#{teacherBean.selectAllTeachers}"
						title="#{msg.allTeachers }">
						<a4j:support event="onchange" ajaxSingle="true"
							action="#{teacherBean.updateSearchCriteria}"
							reRender="searchLastName, searchFirstName, searchMatricule" />
					</h:selectBooleanCheckbox>
				</td>

				<td><a4j:commandButton value="#{msg.search}"
					onclick="buttonClicked = true; "
					action="#{teacherBean.getSearchedTeachers}" reRender="teachers"
					oncomplete="if (#{teacherBean.rowCount <= 0}) #{rich:component('resultPanelTeacher')}.show(); changeMeElement('#{teacherBean.rowCount <= 0}')" />
				</td>
				<td><h:commandButton value="#{msg.exportCSV}" id="exportButton" 
						action="#{teacherBean.generateCSVReport}" />
				</td>
				<td>
					<h:inputHidden id="searchResultCount" value="#{teacherBean.rowCount}" />
				</td>
			</tr>
		</table>
				<a4j:status
			onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
			onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
	</a4j:region>

</a4j:form>

<a4j:region>
	<rich:modalPanel id="resultPanelTeacher" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<a4j:form>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="#{msg.close }"
				oncomplete=" #{rich:component('resultPanelTeacher')}.hide();" /></p>
		</a4j:form>
	</rich:modalPanel>
</a4j:region>

<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="teachers">
			<rich:dataTable rows="15" value="#{teacherBean.teachers}" var="teacher"
				rendered="#{teacherBean.rowCount>0}" reRender="ds" rowKeyVar="row"
				 style="overflow: hidden; width: 75%; white-space: nowrap;" >
			    <f:facet name="header">
		        	<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.teachers}"/>
		        	</h:outputFormat>
		        </f:facet>
			    <rich:column filterBy="#{teacher.matricule}" filterEvent="onkeyup" sortBy="#{teacher.matricule}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.matricule}"/>
		            </f:facet>
			            <h:outputText value="#{teacher.matricule}" />
			    </rich:column>			        
			    <rich:column filterBy="#{teacher.lastName}" filterEvent="onkeyup" sortBy="#{teacher.lastName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.lastName}"/>
		            </f:facet>
			            <h:outputText value="#{teacher.lastName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{teacher.firstName}" filterEvent="onkeyup" sortBy="#{teacher.firstName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.firstName}"/>
		            </f:facet>
			            <h:outputText value="#{teacher.firstName}" />
			    </rich:column>
			    
				<rich:column filterBy="#{teacher.schoolName}" filterEvent="onkeyup"
					sortBy="#{teacher.schoolName}">
					<f:facet name="header">
						<h:outputText value="#{msg.position}" />
					</f:facet>
					<h:outputText value="#{teacher.schoolName}" />
				</rich:column>
	
			   	<rich:column>
			    	<f:facet name="header">
		                <h:outputText value="#{msg.phone}"/>
		            </f:facet>
			            <h:outputText value="#{teacher.phone}" />
			    </rich:column>
	
			   	<rich:column>
			    	<f:facet name="header">
		                <h:outputText value="#{msg.cellPhone}"/>
		            </f:facet>
			            <h:outputText value="#{teacher.cellPhone}" />
			    </rich:column>
			    
			    <rich:column>
			    	<f:facet name="header">
		                <h:outputText value="#{msg.email}"/>
		            </f:facet>
			            <h:outputText value="#{teacher.email}" />
			    </rich:column>
			        
			    <rich:column>
			        <f:facet name="header">
		                <h:outputText value="#{msg.actions }"/>
		            </f:facet>
			        <a4j:commandLink ajaxSingle="true" id="modify" action="#{teacherBean.edit}" 
			        	rendered="#{((user.teacher && teacher.userId==user.id) || (not user.teacher))}"
			        	reRender="gestionTeacher,teacherHeaderPannel, teacherPanel">
			            <h:graphicImage value="images/edit.gif" style="border:0"/>
			            <f:param name="id" value="#{teacher.id}"/>
			        </a4j:commandLink>  
			        
			         <rich:spacer width="20" height="10" title="" />
			         
			        <a4j:commandLink ajaxSingle="true" id="delete" action="#{teacherBean.delete}" 
			        	reRender="gestionTeacher, teachers,teacherHeaderPannel, actionResultPanel"
			        	rendered="#{ teacher.schoolId == user.school.id && teacherBean.userHasWriteAccess  && (not user.teacher)}"
			        	oncomplete="#{rich:component('actionResultPanel')}.show();">
			            <h:graphicImage value="/images/delete.gif" style="border:0"/>
			            <f:param name="id" value="#{teacher.id}"/>
			        </a4j:commandLink>
			        
			        <rich:spacer width="20" height="10" title="" />
					<a4j:commandLink ajaxSingle="true" id="importTeacherInfo1"
						action="#{teacherBean.selectTeacher}"
						rendered="#{teacher.status==0 && teacherBean.userHasWriteAccess && (not user.teacher)}"
						oncomplete="#{rich:component('importTeacherInfo')}.show();">
						<h:graphicImage value="images/import.png" style="border:0" />
						<f:param name="id" value="#{teacher.id}" />
					</a4j:commandLink>

					<a4j:commandLink ajaxSingle="true" id="freeupTeacher1"
						action="#{teacherBean.selectTeacher}"
						rendered="#{teacher.status==1 && teacherBean.userHasWriteAccess && (not user.teacher)}"
						oncomplete="#{rich:component('freeupTeacher')}.show();">
						<h:graphicImage value="images/freeup.gif" style="border:0" />
						<f:param name="id" value="#{teacher.id}" />
					</a4j:commandLink>
					
			        <rich:toolTip for="modify" value="#{msg.modify}"/>      
	                <rich:toolTip for="delete" value="#{msg.delete}"/> 
	                <rich:toolTip for="importTeacherInfo1"
						value="#{msg.importTeacherInfo}" />
					<rich:toolTip for="freeupTeacher1" value="#{msg.freeupTeacher}" />
			    </rich:column>
			        
			    <f:facet name="footer">
		            <rich:datascroller id="ds"></rich:datascroller>
		        </f:facet>
			</rich:dataTable>
			<br/>
			<br/>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>

<rich:modalPanel id="actionResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>

	<p><font color="#FF0000"> <error> <h:outputText
		value="#{teacherBean.errorMessage}" /> </error> </font> <font color="#00FF00">
	<success> <h:outputText value="#{teacherBean.successMessage}" />
	</success> </font></p>

	<a4j:form>
		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('actionResultPanel')}.hide();" /></p>
	</a4j:form>		
</rich:modalPanel>

<rich:modalPanel id="importTeacherInfo" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.importTeacherInfo }" />
	</f:facet>
	<a4j:form>

 
		<p><font color="#FF0000"> <error> <h:outputText id = "errorMessage1"
			value="#{teacherBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText id = "successMessage1"
			value="#{teacherBean.successMessage}" /> </success> </font></p>

		<a4j:commandButton value="#{msg.importTeacherInfo }"
		reRender="errorMessage1,successMessage1"
			action="#{teacherBean.importTeacherInfo}" />

		<rich:spacer width="20" height="10" title="" />

		<a4j:commandButton value="#{msg.close }" reRender="teachers"
			oncomplete="#{rich:component('importTeacherInfo')}.hide();" />

	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="freeupTeacher" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.freeupTeacher}" />
	</f:facet>
	<a4j:form>

		<p><font color="#FF0000"> <error> <h:outputText id="errorMessage0"
			value="#{teacherBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText id="successMessage0"
			value="#{teacherBean.successMessage}" /> </success> </font></p>

		<a4j:commandButton value="#{msg.freeupTeacher }"
		reRender="errorMessage0,successMessage0"
			 action="#{teacherBean.freeupTeacher}" />

		<rich:spacer width="20" height="10" title="" />

		<a4j:commandButton value="#{msg.close }" reRender="teachers"
			oncomplete="#{rich:component('freeupTeacher')}.hide();" />

	</a4j:form>
</rich:modalPanel>

<rich:modalPanel id="wait" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>

<script>
	document.getElementById('teacherSearchCriteriaForm:exportButton').style.display = document.getElementById('teacherSearchCriteriaForm:searchResultCount').value > 0 ? 'block' : 'none';
</script>