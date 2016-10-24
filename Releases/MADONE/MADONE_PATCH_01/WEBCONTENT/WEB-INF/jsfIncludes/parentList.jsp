<a4j:form>
	<a4j:region>
		<table width="50%">
			<tr>
				<td><h:outputText value="#{msg.lastName }:" /><h:inputText
					onkeyup="convertToUpperCase(this);" value="#{parentBean.lastName}" /></td>

				<td><h:outputText value="#{msg.firstName }:" /><h:inputText onkeyup="convertToUpperCase(this);" value="#{parentBean.firstName}" /></td>
				
				<td><a4j:commandButton value="#{msg.search}"
					onclick="buttonClicked = true; "
					action="#{parentBean.search}" reRender="parents"
					oncomplete="if (#{parentBean.rowCount <= 0}) #{rich:component('resultPanelParent')}.show();" />
				</td>

			</tr>
		</table>

		<a4j:status
			onstart="if (buttonClicked) {#{rich:component('waitParent')}.show()}"
			onstop="buttonClicked = false; #{rich:component('waitParent')}.hide()" />
	</a4j:region>
</a4j:form>

<a4j:region>
	<rich:modalPanel id="resultPanelParent" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<a4j:form>
			<p><h:outputText value="#{msg.noResultFound}" /></p>
			<p></p>
			<p><a4j:commandButton value="#{msg.close }"
				oncomplete=" #{rich:component('resultPanelParent')}.hide();" /></p>
		</a4j:form>
	</rich:modalPanel>
</a4j:region>


<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="parents">
			<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{parentBean.parents}" var="parent"
				 reRender="ds" rowKeyVar="row">
			    <f:facet name="header" >
		        	<h:outputFormat value="#{msg.listHeader}">
		        		 <f:param value="#{msg.parents}"/>
		        	</h:outputFormat>
		        </f:facet>
			        
			    <rich:column filterBy="#{parent.lastName}" filterEvent="onkeyup" sortBy="#{parent.lastName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.lastName}"/>
		            </f:facet>
			            <h:outputText value="#{parent.lastName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{parent.firstName}" filterEvent="onkeyup" sortBy="#{parent.firstName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.firstName}"/>
		            </f:facet>
			            <h:outputText value="#{parent.firstName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{parent.middleName}" filterEvent="onkeyup" sortBy="#{parent.middleName}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.middleName}"/>
		            </f:facet>
			            <h:outputText value="#{parent.middleName}" />
			    </rich:column>
	
			    <rich:column filterBy="#{parent.telephone}" filterEvent="onkeyup" sortBy="#{parent.telephone}">
			    	<f:facet name="header">
		                <h:outputText value="#{msg.phone}"/>
		            </f:facet>
			            <h:outputText value="#{parent.telephone}" />
			    </rich:column>
			    		        
			    <rich:column width="120">
			        <f:facet name="header">
		                <h:outputText value="#{msg.actions }"/>
		            </f:facet>
			        <a4j:commandLink ajaxSingle="true" id="modify" action="#{parentBean.edit}"
			         				reRender="gestionParent,parentHeaderPannel, parentPanel">
			            <h:graphicImage value="images/edit.gif" style="border:0"/>
			            <f:param name="id" value="#{parent.id}"/>
			        </a4j:commandLink>  
			        
			         <rich:spacer width="20" height="10" title="" />
			         
			         					<a4j:commandLink ajaxSingle="true" id="printParentFinance"
						action="#{parentBean.selectParent}"
						oncomplete="#{rich:component('printParentFinance')}.show();">
						<h:graphicImage value="images/print.gif" style="border:0" />
						<f:param name="id" value="#{parent.id}" />
					</a4j:commandLink>
 <rich:spacer width="20" height="10" title="" />
			        <a4j:commandLink ajaxSingle="true" id="openStudentAssign" action="#{parentBean.openParentStudentDetails}"
			         				reRender="parentStudentDetailsPanel" 
			         				oncomplete="#{rich:component('parentStudentDetailsPanel')}.show();">
			            <h:graphicImage value="images/user_group.png" style="border:0"/>
			            <f:param name="id" value="#{parent.id}"/>
			        </a4j:commandLink>  
			        
			         <rich:spacer width="20" height="10" title="" />
			         
			        <a4j:commandLink ajaxSingle="true" id="delete" action="#{parentBean.delete}" reRender="gestionParent, parents">
			            <h:graphicImage value="/images/delete.gif" style="border:0"/>
			            <f:param name="id" value="#{parent.id}"/>
			        </a4j:commandLink>
			        
			        <rich:toolTip for="modify" value="#{msg.modify}"/>      
	                <rich:toolTip for="delete" value="#{msg.delete}"/> 
	                 <rich:toolTip for="openStudentAssign" value="#{msg.assignStudent}"/> 
			    </rich:column>
			        
			    <f:facet name="footer">
		            <rich:datascroller id="ds"></rich:datascroller>
		        </f:facet>
			</rich:dataTable>
				   <br/>
				   
			<font color="#FF0000">
			<error>		
			<h:outputText value="#{parentBean.errorMessage}"/>		
	 		</error>
			</font>
			<font color="#00FF00">
			<success>
			<h:outputText value="#{parentBean.successMessage}" />
			</success>
			</font>
	
			<br/>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>



<rich:modalPanel id="parentStudentDetailsPanel" rendered="true" width="1200" height="400">
	
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<table>
			<%@include file="/WEB-INF/jsfIncludes/parentStudentDetails.jsp"%>
		</table>
	
</rich:modalPanel>

<rich:modalPanel id="printParentFinance" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.print}" />
	</f:facet>
	<a4j:form>
		<p><h:commandButton id="view" value="#{msg.financeState}"
			action="#{parentBean.printParentFinance}" /></p>
		<p></p>
		<p><a4j:commandButton value="#{msg.close }"
			reRender="printStudentDetails"
			oncomplete="#{rich:component('printParentFinance')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>
<rich:modalPanel id="waitParent" autosized="true" width="200" height="120"
	moveable="false" resizeable="false">
	<f:facet name="header">
		<h:outputText value="#{msg.operationInProgress }" />
	</f:facet>
	<h:outputText value="#{msg.oneMomentPlease }" />
</rich:modalPanel>