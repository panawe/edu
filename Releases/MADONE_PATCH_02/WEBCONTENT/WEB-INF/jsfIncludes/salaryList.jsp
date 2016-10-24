<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="salaries">
			<rich:dataTable style="overflow: hidden; width: 700px; white-space: nowrap;" rows="5" value="#{salaryBean.salaries}" var="salary"
				rendered="#{salaryBean.rowCount>0}" reRender="ds" rowKeyVar="row">
			    <f:facet name="header" >
		        	<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.salaries}"/>
		        	</h:outputFormat>
		        </f:facet>
			        
			     <rich:column filterBy="#{salary.effectiveDate}" filterEvent="onkeyup" sortBy="#{salary.effectiveDate}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.effectiveDate}"/>
		            </f:facet>
			            <h:outputText value="#{salary.effectiveDate}">
			            	<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
			            </h:outputText>
			    </rich:column>
			    
			    <rich:column filterBy="#{salary.payType.name}" filterEvent="onkeyup" sortBy="#{salary.payType.name}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.payType}"/>
		            </f:facet>
			            <h:outputText value="#{salary.payType.name}" />
			    </rich:column>
	
			    <rich:column filterBy="#{salary.amount}" filterEvent="onkeyup" sortBy="#{salary.amount}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.amount}"/>
		            </f:facet>
			            <h:outputText value="#{salary.amount}">	
			            	<f:convertNumber  pattern="#{configurationBean.moneyFormat}"  />
							</h:outputText>
			    </rich:column>
			        
			    <rich:column>
			        <f:facet name="header">
		                <h:outputText value="#{msg.actions }"/>
		            </f:facet>
			        <a4j:commandLink ajaxSingle="true" id="modify" action="#{salaryBean.edit}" reRender="gestionSalary, teacherSalaryPanel">
			            <h:graphicImage value="images/edit.gif" style="border:0"/>
			            <f:param name="id" value="#{salary.id}"/>
			        </a4j:commandLink>  
			         <rich:spacer width="20" height="10" title="" />
			        <a4j:commandLink ajaxSingle="true" id="delete" action="#{salaryBean.delete}" reRender="gestionSalary, salaries, salaryResultPanel"
			        oncomplete="#{rich:component('salaryResultPanel')}.show();">
			            <h:graphicImage value="/images/delete.gif" style="border:0"/>
			            <f:param name="id" value="#{salary.id}"/>
			        </a4j:commandLink>
			        
			        <rich:toolTip for="modify" value="#{msg.modify}"/>      
	                <rich:toolTip for="delete" value="#{msg.delete}"/> 
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

<rich:modalPanel id="salaryResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{salaryBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{salaryBean.successMessage}" />
		</success> </font></p>
	
		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('salaryResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>