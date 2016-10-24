<a4j:form>
<a4j:region>
	<a4j:outputPanel id="levelClasses">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{levelClassBean.levelClasses}" var="levelClass"
			rendered="#{levelClassBean.rowCount>0}" reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.listHeader}">
	        		 <f:param value="#{msg.levelClasses}"/>
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column filterBy="#{levelClass.name}" filterEvent="onkeyup" sortBy="#{levelClass.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.name}"/>
	            </f:facet>
		            <h:outputText value="#{levelClass.name}" />
		    </rich:column>

		    <rich:column filterBy="#{levelClass.level.name}" filterEvent="onkeyup" sortBy="#{levelClass.level.name}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.level}"/>
	            </f:facet>
		            <h:outputText value="#{levelClass.level.name}" />
		    </rich:column>

		    <rich:column filterBy="#{levelClass.nbrStudents}" filterEvent="onkeyup" sortBy="#{levelClass.nbrStudents}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.effectif}"/>
	            </f:facet>
		            <h:outputText value="#{levelClass.nbrStudents}" />
		    </rich:column>

		    <rich:column filterBy="#{levelClass.capacity}" filterEvent="onkeyup" sortBy="#{levelClass.capacity}">
		    	<f:facet name="header">
	                <h:outputText value="#{msg.capacity}"/>
	            </f:facet>
		            <h:outputText value="#{levelClass.capacity}" />
		    </rich:column>
		    		        		        
		    <rich:column width="90">
		        <f:facet name="header">
	                <h:outputText value="#{msg.actions }"/>
	            </f:facet>
		        <a4j:commandLink ajaxSingle="true" id="modify" action="#{levelClassBean.edit}" reRender="gestionLevelClass, students,courses,schoolLevelClassPanel">
		            <h:graphicImage value="images/edit.gif" style="border:0"/>
		            <f:param name="id" value="#{levelClass.id}"/>
		        </a4j:commandLink>  
		        <rich:spacer width="20" height="10" title="" />
		        					<a4j:commandLink ajaxSingle="true" id="print"
						action="#{levelClassBean.selectLevelClass}"
						oncomplete="#{rich:component('printClassIds')}.show();">
						<h:graphicImage value="images/print.gif" style="border:0" />
						<f:param name="id" value="#{levelClass.id}"/>
					</a4j:commandLink>
		        
		         <rich:spacer width="20" height="10" title="" />
		         
		        <a4j:commandLink ajaxSingle="true" id="delete" action="#{levelClassBean.delete}" reRender="gestionLevelClass, levelClasses">
		            <h:graphicImage value="/images/delete.gif" style="border:0"/>
		            <f:param name="id" value="#{levelClass.id}"/>
		        </a4j:commandLink>
		        
		        <rich:toolTip for="modify" value="#{msg.modify}"/>      
                <rich:toolTip for="delete" value="#{msg.delete}"/> 
                <rich:toolTip for="print" value="#{msg.print}"/> 
		    </rich:column>
		        
		    <f:facet name="footer">
	            <rich:datascroller id="ds"></rich:datascroller>
	        </f:facet>
		</rich:dataTable>
			   <br/>
			   
		<font color="#FF0000">
		<error>		
		<h:outputText value="#{levelClassBean.errorMessage}"/>		
 		</error>
		</font>
		<font color="#00FF00">
		<success>
		<h:outputText value="#{levelClassBean.successMessage}" />
		</success>
		</font>

		<br/>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>

<rich:modalPanel id="printClassIds" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.print}" />
	</f:facet>
	<a4j:form>
		<p><h:commandButton id="view2" value="#{msg.printIds }"
			action="#{levelClassBean.printStudentID}" /></p>
		<rich:separator lineType="solid" />
				<p><h:commandButton id="view" value="#{msg.financeState}"
			action="#{levelClassBean.printClassFinance}" /></p> 
		<rich:separator lineType="solid" />
							<h:outputText value="#{msg.message}" />
					<h:inputTextarea id="messageq"
						value="#{levelClassBean.message}" rows="6" cols="60">
					</h:inputTextarea>
						<p><h:commandButton id="view3" value="#{msg.printReminders}"
			action="#{levelClassBean.printReminders}" /></p>
					<rich:separator lineType="solid" />
						<p><h:commandButton id="view4" value="#{msg.printStudentList}"
			action="#{levelClassBean.printStudentList}" /></p>
		<rich:separator lineType="solid" />
		<p><a4j:commandButton value="#{msg.close }"
			reRender="printClassIds"
			oncomplete="#{rich:component('printClassIds')}.hide();" /></p>
			
	</a4j:form>
</rich:modalPanel>