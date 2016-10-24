	<a4j:form>
		<a4j:region>
			<table>		
			<% if ("school".equals(request.getSession().getAttribute("link")) || "teacher".equals(request.getSession().getAttribute("link"))) { %>
					
				<tr>
		 			<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
					<td><rich:comboBox id="schoolYear"
						value="#{examTimeTableBean.searchYearName}"
						suggestionValues="#{schoolYearBean.allSchoolYears}">
					</rich:comboBox></td>
				</tr>
			<%} %>
				<tr>
		 			<td><h:outputText value="#{msg.term }" /></td>
					<td><rich:comboBox id="term"
						value="#{examTimeTableBean.searchTermName}"
						suggestionValues="#{termBean.allTerms}">
					</rich:comboBox></td>
				</tr>
			<% if ("school".equals(request.getSession().getAttribute("link"))) { %>

				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="levelClass"
							value="#{examTimeTableBean.searchLevelClassName}"
							suggestionValues="#{levelClassBean.allLevelClasses}">
						</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
					</a4j:region>
				</tr>
				<%} %>	
				<tr>
					<td>
						<a4j:commandButton value="#{msg.search}" action="#{examTimeTableBean.searchTimeTable}" 
							reRender="viewExamTimeTables, examTimeTableResultPanel"
							oncomplete="if (#{examTimeTableBean.hasErrorMessage}) #{rich:component('examTimeTableResultPanel')}.show();" >
						</a4j:commandButton>
					</td>
				</tr>
					
			</table>
		</a4j:region>
	</a4j:form>


<a4j:form>
<a4j:region>
	<a4j:outputPanel id="viewExamTimeTables">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{examTimeTableBean.examDays}" var="examDay"
			reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.examTimeTables}">
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.firstDayDescription}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; 
		        		width: 75%; white-space: nowrap;" rows="15" 
		        		value="#{examTimeTableBean.firstDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
 			<rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.secondDayDescription}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="15" value="#{examTimeTableBean.secondDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		     <rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.thirdDayDescription}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="15" value="#{examTimeTableBean.thirdDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		     <rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.fourthDayDescription}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="15" value="#{examTimeTableBean.fourthDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
			<rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.fifthDayDescription}"/>
	            </f:facet>		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="15" value="#{examTimeTableBean.fifthDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
			<rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.sixthDayDescription}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="15" value="#{examTimeTableBean.sixthDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
			<rich:column style="vertical-align:top;" width="200px">
		    	<f:facet name="header">
		    		<h:outputText value="#{examTimeTableBean.seventhDayDescription}"/>
	            </f:facet>		        
	            <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="15" value="#{examTimeTableBean.seventhDayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    <f:facet name="footer">
	            <rich:datascroller id="ds"></rich:datascroller>
	        </f:facet>
		</rich:dataTable>
	</a4j:outputPanel>
</a4j:region>
</a4j:form>


<rich:modalPanel id="examTimeTableResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{examTimeTableBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{examTimeTableBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('examTimeTableResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>