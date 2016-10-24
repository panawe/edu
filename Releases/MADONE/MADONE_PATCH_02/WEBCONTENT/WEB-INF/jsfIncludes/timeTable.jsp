	<a4j:form>
		<a4j:region>
			<table>		
			<% if ("school".equals(request.getSession().getAttribute("link")) || "teacher".equals(request.getSession().getAttribute("link"))) { %>
					
				<tr>
		 			<td><h:outputText value="#{msg.year }" /><font color="#FF0000">*</font></td>
					<td><rich:comboBox id="schoolYear"
						value="#{timeTableBean.searchYearName}"
						suggestionValues="#{schoolYearBean.allSchoolYears}">
					</rich:comboBox></td>
				</tr>
			<%} %>
				<tr>
		 			<td><h:outputText value="#{msg.term }" /></td>
					<td><rich:comboBox id="term"
						value="#{timeTableBean.searchTermName}"
						suggestionValues="#{termBean.allTerms}">
					</rich:comboBox></td>
				</tr>
			<% if ("school".equals(request.getSession().getAttribute("link"))) { %>

				<tr>
					<a4j:region>
						<td><h:outputText value="#{msg.classe}" /><font color="#FF0000">*</font></td>
						<td><rich:comboBox id="levelClass"
							value="#{timeTableBean.searchLevelClassName}"
							suggestionValues="#{levelClassBean.allLevelClasses}">
						</rich:comboBox> <font color="#FF0000"><rich:message for="levelClass" /></font></td>
					</a4j:region>
				</tr>
				<%} %>	
				<tr>
					<td>
						<a4j:commandButton value="#{msg.search}" action="#{timeTableBean.searchTimeTable}" 
							reRender="viewTimeTables, timeTableResultPanel"
							oncomplete="if (#{timeTableBean.hasErrorMessage}) #{rich:component('timeTableResultPanel')}.show();" >
						</a4j:commandButton>
					</td>
				</tr>
					
			</table>
		</a4j:region>
	</a4j:form>


<a4j:form>
<a4j:region>
	<a4j:outputPanel id="viewTimeTables">
		<rich:dataTable style="overflow: hidden; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.weekDays}" var="weekDay"
			reRender="ds" rowKeyVar="row">
		    <f:facet name="header">
	        	<h:outputFormat value="#{msg.timeTables}">
	        	</h:outputFormat>
	        </f:facet>
		        
		    <rich:column style="vertical-align:top;">
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.monday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.mondayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime}" /> -
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		    <rich:column style="vertical-align:top;">
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.tuesday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.tuesdayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime} - " />
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		    <rich:column style="vertical-align:top;">
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.wednesday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.wednesdayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime} - " />
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		    <rich:column style="vertical-align:top;">
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.thursday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: vertical-align:top; hidden; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.thursdayTimeTables}" var="timeTable"
					reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime} - " />
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		    <rich:column style="vertical-align:top;">
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.friday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.fridayTimeTables}" var="timeTable"
						reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime} - " />
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		    <rich:column style="vertical-align:top;">
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.saturday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.saturdayTimeTables}" var="timeTable"
						reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime} - " />
			            <h:outputText value="#{timeTable.endTime}" />
			            <br/>
			            <h:outputText value="#{timeTable.course.subject.name}" />
				    </rich:column>	
				</rich:dataTable>
		    </rich:column>
		    
		    <rich:column style="vertical-align:top;" >
		    	<f:facet name="header">
	                <h:outputText value="#{timeTableBean.sunday}"/>
	            </f:facet>
		        <rich:dataTable style="overflow: hidden; vertical-align:top; width: 75%; white-space: nowrap;" rows="5" value="#{timeTableBean.sundayTimeTables}" var="timeTable"
						reRender="ds" rowKeyVar="row">
					<rich:column>
						<h:outputText value="#{timeTable.beginTime} - " />
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


<rich:modalPanel id="timeTableResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{timeTableBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText
			value="#{timeTableBean.successMessage}" /> </success> </font></p>

		<p><a4j:commandButton value="#{msg.close }" immediate="true"
			oncomplete="#{rich:component('timeTableResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>