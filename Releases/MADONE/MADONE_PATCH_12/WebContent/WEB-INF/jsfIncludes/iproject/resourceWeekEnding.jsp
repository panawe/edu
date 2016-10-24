		<a4j:form>
			<a4j:outputPanel ajaxRendered="true">
				<font color="#FF0000"> <error> <h:outputText
					value="#{userProjectBean.errorMessage}" /> </error>
				</font>
				<font color="#00FF00"> <success> <h:outputText
						value="#{userProjectBean.successMessage}" /> </success>
				</font>
			</a4j:outputPanel>
			<a4j:outputPanel id="resourceWeekEndingSearchCriteria">
				<a4j:outputPanel>
					<h:panelGrid columns="10">
						<h:inputHidden value="#{userProjectBean.user.id}" /> 
						<h:outputText value="#{msg.firstName}"></h:outputText>
						<h:inputText id="resourceWeekEndingFirstName" value="#{userProjectBean.user.firstName}"/>
						
						<h:outputText value="#{msg.lastName}"></h:outputText>
						<h:inputText id="resourceWeekEndingLastName" value="#{userProjectBean.user.lastName}"/>
						
						<a4j:region>
							<a4j:commandButton value="#{msg.choose} #{msg.resource}"
							action="#{userProjectBean.addUsers}"
							oncomplete="#{rich:component('resourceWeekEndingPanelUers')}.show()"
							reRender="resourceWeekEndingPanelUers">
								<f:param name="pageProvenance" value="WEEK_ENDING_SUMMARY"/>
							</a4j:commandButton>
						</a4j:region>
						
						<a4j:commandButton value="#{msg.search}"
							onclick="buttonClicked = true; "
							action="#{userProjectBean.searchResourceWeekEndingSummary}" reRender="resourceWeekEndingOutputPanel"/>
					</h:panelGrid>	
				</a4j:outputPanel>
			</a4j:outputPanel>
			<br/>
			
			<a4j:outputPanel id="resourceWeekEndingOutputPanel">
				<rich:dataTable rows="50" value="#{userProjectBean.timeEntryWeekEndings}"
					var="timeEntryWeekEnding" reRender="ds" 
					rowKeyVar="row" style="overflow: hidden; width: 100%; white-space: nowrap;" rowClasses="collapsibleTopRow, collapsibleTopRow">
					<f:facet name="header">
						<rich:columnGroup> 
							<rich:column colspan="14">
								<h:outputFormat value="#{msg.TimeEntrySummary}" />
							</rich:column>
							
							<rich:column breakBefore="true" colspan="4">
								<h:outputFormat value="#{msg.resource} - #{msg.weekEndingDate}" />
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.sun}"/>
							</rich:column>
												
							<rich:column>
								<h:outputFormat value="#{msg.mon}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.tue}"/>
							</rich:column>
							
							<rich:column >
								<h:outputFormat value="#{msg.wed}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.thu}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.fri}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.sat}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.billableHours}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.nonBillableHours}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.totalHours}"/>
							</rich:column>
						</rich:columnGroup>
					</f:facet>
					
					<rich:column colspan="4">      
						<a4j:commandLink value="+/- " reRender="resourceWeekEndingOutputPanel"> 
							<a4j:actionparam name="shown" value="#{not timeEntryWeekEnding.showDetails}"
							 assignTo="#{timeEntryWeekEnding.showDetails}"/>
						</a4j:commandLink>       
						<h:outputText value="#{timeEntryWeekEnding.userName} - "/>
						<h:outputText value="#{timeEntryWeekEnding.weekEndingDate}">    
							<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
						</h:outputText>
					</rich:column> 
					
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.sundayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.mondayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.tuesdayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.wednesdayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.thursdayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.fridayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.saturdayTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.billableTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.nonBillableTotalHours}">    
						</h:outputText>
					</rich:column> 
					<rich:column>     
						<h:outputText value="#{timeEntryWeekEnding.billableTotalHours + timeEntryWeekEnding.nonBillableTotalHours}">    
						</h:outputText>
					</rich:column> 
					
			
					<rich:subTable rendered="#{timeEntryWeekEnding.showDetails}" value="#{timeEntryWeekEnding.timeEntries}" var="timeEntry" rowClasses="even-row, odd-row">
						<rich:column colspan="3">
						</rich:column>
						<rich:column>
					  		<h:outputText value="#{timeEntry.workDate}">
								<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
							</h:outputText>
					  	</rich:column>
					  	<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(0)}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(1)}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(2)}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(3)}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(4)}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(5)}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.getDayOfWeek(6)}">
							</h:outputText>
						</rich:column>		
						<rich:column>
							<h:outputText value="#{timeEntry.billableHrs}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.nonBillableHrs}">
							</h:outputText>
						</rich:column>
						<rich:column>
							<h:outputText value="#{timeEntry.billableHrs + timeEntry.nonBillableHrs}">
							</h:outputText>
						</rich:column>
											
					</rich:subTable> 
				</rich:dataTable>
			</a4j:outputPanel>
		</a4j:form>
		
<rich:modalPanel id="resourceWeekEndingPanelUers" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.selectResource}" />
	</f:facet>
	<a4j:form>
		<p><%@include file="/WEB-INF/jsfIncludes/userList.jsp"%>
		</p>
		<p><a4j:commandButton value="#{msg.close }"
			action="#{userProjectBean.addProjects}"
			reRender="resourceWeekEndingSearchCriteria"
			oncomplete="#{rich:component('resourceWeekEndingPanelUers')}.hide()" /></p>
	</a4j:form>
</rich:modalPanel>