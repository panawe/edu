<a4j:region>
	<table>
		<tr>
			<td><h:outputText value="#{msg.firstName }" /></td>
			<td width="30%">
				<h:inputText onkeyup="convertToUpperCase(this);" value="#{studentBean.lastName}" /> 	
			</td>
			<td><h:outputText value="#{msg.lastName }" /></td>
			<td width="30%">
				<h:inputText onkeyup="convertToUpperCase(this);" value="#{studentBean.firstName}" /> 	
			</td>
			<td><h:outputText value="#{msg.city }" /></td>
			<td width="30%">
				<h:inputText onkeyup="convertToUpperCase(this);" value="#{studentBean.city}" /> 	
			</td>
			<td>
				<a4j:commandButton value="#{msg.search}" action="#{studentBean.getSearchedStudents}" reRender="students" 
				oncomplete="if (#{studentBean.rowCount <= 0}) #{rich:component('resultPanelStudent')}.show();" />
			</td>
			
		</tr>
	</table>
</a4j:region>


<a4j:region>
	<rich:modalPanel id="resultPanelStudent" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<p>
			<h:outputText value="#{msg.noResultFound}" />
		</p>
		<p></p>
		<p>
			<a4j:commandButton value="Fermer" action="#{studentBean.getStudents}" reRender="students" 
			oncomplete=" #{rich:component('resultPanelStudent')}.hide();" />
		</p>
	</rich:modalPanel>
</a4j:region>

<a4j:region>
	<a4j:outputPanel id="students">
		<rich:scrollableDataTable rowKeyVar="rkv" frozenColCount="1" height="400px" 
                width="700px" id="studentList" rows="40" columnClasses="col"
                value="#{studentBean.students}" var="student" sortMode="single"
                >
               
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.students}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column> 
    			<f:facet name="header"> 
        			<h:outputText value="#{msg.selectPrompt}" /> 
        		</f:facet> 
            	<h:selectBooleanCheckbox value="#{studentBean.selectedStudents[student]}" /> 
			</rich:column> 
		    
		    
		    <rich:column filterBy="#{student.lastName}" sortBy="#{student.lastName}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.lastName}"/>
	            </f:facet>
		            <h:outputText value="#{student.lastName}" />
		    </rich:column>

		    <rich:column filterBy="#{student.firstName}" filterEvent="onkeyup" sortBy="#{student.firstName}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.firstName}"/>
	            </f:facet>
		            <h:outputText value="#{student.firstName}" />
		    </rich:column>

		   	<rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.phone}"/>
	            </f:facet>
		            <h:outputText value="#{student.phone}" />
		    </rich:column>

		   	<rich:column>
		    	<f:facet name="header">
	                <h:outputText value="#{msg.cellPhone}"/>
	            </f:facet>
		            <h:outputText value="#{student.cellPhone}" />
		    </rich:column>
		        
		    <rich:column>
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{studentBean.edit}" reRender="gestionStudent">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{student.id}"/>
		        </a4j:commandLink>  
		         <SPACER TYPE=HORIZONTAL SIZE=50>
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{studentBean.delete}" reRender="gestionStudent, students">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{teacher.id}"/>
		        </a4j:commandLink>
		        
		        <rich:toolTip for="modify" value="#{msg.modify}"/>      
                <rich:toolTip for="delete" value="#{msg.delete}"/> 
		    </rich:column>
		        
		</rich:scrollableDataTable>
		<br/>
			   
		<font color="#FF0000">
		<error>		
		<h:outputText value="#{studentBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{studentBean.successMessage}" />
		</success>
		</font>

		<br/>
		
		
		<tr>
				<td>
         			<h:outputText value="#{msg.levelClass}" />
         		</td>
         		<td><rich:comboBox id="levelClass" suggestionValues="#{levelClassBean.allLevelClasses}"
					directInputSuggestions="true" defaultLabel="#{msg.enterListDefaultValue}"
					value="#{studentBean.levelClassName}" />
					<font color="#FF0000"><rich:message for="levelClass" /></font>
				</td>
			</tr>
	</a4j:outputPanel>
</a4j:region>
