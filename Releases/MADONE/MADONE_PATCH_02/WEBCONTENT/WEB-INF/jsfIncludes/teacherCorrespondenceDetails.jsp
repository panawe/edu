<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionReceivedCorrespondence">
			<rich:panel  style="overflow: hidden; width: 75%; white-space: nowrap;" >
				<f:facet name="header">
		        	<h:outputFormat value="#{msg.detailsHeader}">
		        		 <f:param value="#{msg.correspondence}"/>
		        	</h:outputFormat>
			    </f:facet>
		    
				<a4j:outputPanel ajaxRendered="true">
					<h:messages />
				</a4j:outputPanel>. 
	    		<table class="table">
	    			<tr>
						<td><h:outputText
							value="#{msg.mailSubject}" /></td>
						<td><h:inputText id="name" value="#{correspondenceBean.receivedCorrespondence.correspondence.subject}"
							size="60" maxlength="250" >
							<rich:ajaxValidator event="onblur" />
						</h:inputText></td>
						<td><font color="#FF0000"><rich:message for="name" /></font>
						</td>
					</tr>
					<tr>
						<td colspan="2"><h:inputHidden
							value="#{correspondenceBean.receivedCorrespondence.id}" />
							<h:inputHidden
							value="#{correspondenceBean.receivedCorrespondence.correspondence.id}" /> <h:outputText
							value="#{msg.message}" /><rich:editor
							value="#{correspondenceBean.receivedCorrespondence.correspondence.description}"
							theme="advanced" plugins="save,paste" width="600">
	
							<f:param name="theme_advanced_buttons1"
								value="bold,italic,underline, cut,copy,paste,pasteword" />
	
							<f:param name="theme_advanced_toolbar_location" value="top" />
	
							<f:param name="theme_advanced_toolbar_align" value="left" />
	
						</rich:editor></td>
						<td><font color="#FF0000"><rich:message
							for="description" /></font></td>
					</tr>				
					<tr>
						<td colspan="2">
							<h:selectBooleanCheckbox id="sendEmail"
								value="#{correspondenceBean.sendEmail}"
								title="#{msg.sendEmail}">
							</h:selectBooleanCheckbox>
							<h:outputText value="#{msg.sendEmail}" /> 
						</td>
					</tr>
				</table>
	
				<a4j:commandButton value="#{msg.save}"
					action="#{correspondenceBean.insertTeacherCorrespondence}"
					reRender="receivedCorrespondences, gestionReceivedCorrespondence" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{correspondenceBean.clearTeacherCorrespondence}"
						reRender="gestionReceivedCorrespondence" />
				</a4j:region>
			</rich:panel>
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>