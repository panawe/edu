<a4j:form>
	<a4j:region>
		<a4j:outputPanel id="gestionTuition">
			<rich:panel
				style="overflow: hidden; width: 75%; white-space: nowrap;">
				<f:facet name="header">
					<h:outputFormat value="#{msg.detailsHeader}">
						<f:param value="#{msg.tuition}" />
					</h:outputFormat>
				</f:facet>
				<table class="table">
					<tr>
						<td><h:outputText value="#{msg.remindDate}" /></td>

						<td><rich:calendar id="remindDate"
							value="#{tuitionBean.tuition.remindDate}" locale="fr" popup="true"
							datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.dueDate}" /></td>

						<td><rich:calendar id="dueDate"
							value="#{tuitionBean.tuition.dueDate}" locale="fr" popup="true"
							datePattern="dd/MM/yyyy" showFooter="false"
							showApplyButton="false" cellWidth="24px" cellHeight="22px"
							style="width:200px">
							<f:convertDateTime pattern="dd/MM/yyyy" />
						</rich:calendar></td>
					</tr>
					<tr>
						<td><h:outputText value="#{msg.year}:" /></td>
						<td><rich:comboBox id="schoolYear"
							suggestionValues="#{schoolYearBean.allSchoolYears}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{tuitionBean.schoolYearName}" width="300px" /> <font
							color="#FF0000"><rich:message for="schoolYear" /></font></td>
					</tr>

					<tr>
						<td><h:outputText value="#{msg.tuitionType}" /></td>
						<td><rich:comboBox id="tuitionTypes"
							suggestionValues="#{tuitionTypeBean.allTuitionTypes}"
							directInputSuggestions="true"
							defaultLabel="#{msg.enterListDefaultValue}"
							value="#{tuitionBean.tuitionTypeName}" width="300px" /> <font
							color="#FF0000"><rich:message for="tuitionTypes" /></font></td>
					</tr>

					<tr>
						<td><h:inputHidden value="#{tuitionBean.tuition.id}" /> <h:outputText
							value="#{msg.description}:" /></td>
						<td><h:inputText id="description"
							value="#{tuitionBean.tuition.description}" size="75"
							maxlength="50" onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText> <font color="#FF0000"><rich:message for="description" /></font>
						</td>
					</tr>



					<tr>
						<td><h:outputText value="#{msg.amount}:" /></td>
						<td><h:inputText id="amount"
							value="#{tuitionBean.tuition.amount}" size="20" maxlength="15"
							onchange="convertToUpperCase(this);">
							<rich:ajaxValidator event="onblur" />
						</h:inputText> <font color="#FF0000"><rich:message for="amount" /></font></td>
					</tr>

				</table>

				<a4j:commandButton value="#{msg.save}"
					action="#{tuitionBean.insert}"
					rendered = "#{ tuitionBean.userHasWriteAccess }"
					reRender="tuitions, gestionTuition,Tuitions" />
				<SPACER TYPE=HORIZONTAL SIZE=50>
				<a4j:region>
					<a4j:commandButton value="#{msg.clear}"
						action="#{tuitionBean.clear}" reRender="gestionTuition" />
				</a4j:region>
				<br/><br/><br/><br/><br/><br/>
			</rich:panel>
			
		</a4j:outputPanel>
	</a4j:region>
</a4j:form>