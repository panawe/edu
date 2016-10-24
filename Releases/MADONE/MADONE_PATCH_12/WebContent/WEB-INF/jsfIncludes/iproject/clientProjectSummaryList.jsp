		<a4j:form>
			<a4j:outputPanel ajaxRendered="true">
				<font color="#FF0000"> <error> <h:outputText
					value="#{userProjectBean.errorMessage}" /> </error>
				</font>
				<font color="#00FF00"> <success> <h:outputText
						value="#{userProjectBean.successMessage}" /> </success>
				</font>
			</a4j:outputPanel>
			<a4j:outputPanel id="clientProjectSummaryListSearchCriteria">
				<a4j:outputPanel>
					<h:panelGrid columns="10">
						<h:inputHidden value="#{userProjectBean.client.id}" /> 
						<h:outputText value="#{msg.clientName}"></h:outputText>
						<h:inputText id="clientProjectSummaryListClientName" value="#{userProjectBean.client.name}"/>
						
						<h:outputText value="#{msg.lastName}"></h:outputText>
						<h:inputText id="clientProjectSummaryListClientCode" value="#{userProjectBean.client.clientCode}"/>
						
						<a4j:commandButton value="#{msg.search}"
							onclick="buttonClicked = true; "
							action="#{userProjectBean.searchClientProjectSummary}" reRender="clientProjectSummaryOutputPanel"/>
					</h:panelGrid>	
				</a4j:outputPanel>
			</a4j:outputPanel>
			<br/>
			
			<a4j:outputPanel id="clientProjectSummaryOutputPanel">
				<rich:dataTable rows="50" value="#{userProjectBean.clientVOs}"
					var="clientVO" reRender="ds" 
					rowKeyVar="row" style="overflow: hidden; width: 100%; white-space: nowrap;" rowClasses="collapsibleTopRow, collapsibleTopRow">
					<f:facet name="header">
						<rich:columnGroup> 
							<rich:column colspan="4">
								<h:outputFormat value="#{msg.project}" />
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.budget}"/>
							</rich:column>
												
							<rich:column>
								<h:outputFormat value="#{msg.nonBillableHours}"/>
							</rich:column>
							
							<rich:column>
								<h:outputFormat value="#{msg.billaBleHours}"/>
							</rich:column>
							
							<rich:column >
								<h:outputFormat value="#{msg.totalHours}"/>
							</rich:column>							
						</rich:columnGroup>
					</f:facet>
					
					<rich:column colspan="4">      
						<a4j:commandLink value="+/- " reRender="clientProjectSummaryOutputPanel"> 
							<a4j:actionparam name="shown" value="#{not clientVO.showDetails}"
							 assignTo="#{clientVO.showDetails}"/>
						</a4j:commandLink>       
						<h:outputText value="#{clientVO.code}"/>
					</rich:column> 
					
					<rich:subTable rendered="#{clientVO.showDetails}" value="#{clientVO.projects}" var="project" rowClasses="even-row, odd-row">
						<rich:column colspan="3">
						</rich:column>
						<rich:column>
					  		<h:outputText value="#{project.code}"/>
					  	</rich:column>											
					</rich:subTable> 
				</rich:dataTable>
			</a4j:outputPanel>
		</a4j:form>