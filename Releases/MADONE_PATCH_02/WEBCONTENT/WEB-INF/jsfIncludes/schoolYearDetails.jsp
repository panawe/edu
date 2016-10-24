<a4j:region>
	<a4j:outputPanel id="gestionSchoolYear">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.schoolYear}" />
				</h:outputFormat>
			</f:facet>
			<table class="table">
				<tr>
					<td><h:outputText value="#{msg.schoolYearBegin }" /><font
						color="#FF0000">*</font></td>
					<td><rich:calendar id="beginDate"
						value="#{schoolYearBean.schoolYear.beginDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						enableManualInput="true" requiredMessage="#{msg.requiredMessage}"
						converterMessage="#{msg.dateConverter}" style="width:200px">
						<rich:ajaxValidator event="onblur" />
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="beginDate" /></font></td>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.schoolYearEnd}" /><font
						color="#FF0000">*</font></td>
					<td><rich:calendar id="endDate"
						value="#{schoolYearBean.schoolYear.endDate}" locale="fr"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						enableManualInput="true" requiredMessage="#{msg.requiredMessage}"
						converterMessage="#{msg.dateConverter}" style="width:200px">
						<rich:ajaxValidator event="onblur" />
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar></td>
					<td><font color="#FF0000"><rich:message for="endDate" /></font></td>
				</tr>

				<tr>
					<td><h:inputHidden value="#{schoolYearBean.schoolYear.id}" />
					<h:outputText value="#{msg.name}" /><font color="#FF0000">*</font>
					</td>
					<td><h:inputText id="name3"
						value="#{schoolYearBean.schoolYear.year}" size="75" maxlength="50"
						onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
					<td><font color="#FF0000"><rich:message for="name3" /></font>
					</td>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.description}" /></td>
					<td><h:inputText id="description"
						value="#{schoolYearBean.schoolYear.description}" size="75"
						maxlength="50" onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
					<td><font color="#FF0000"><rich:message
						for="description" /></font></td>
				</tr>

			</table>

			<a4j:commandButton value="#{msg.save}"
				action="#{schoolYearBean.insert}" rendered = "#{ termBean.userHasWriteAccess }"
				reRender="schoolYears, gestionSchoolYear" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}"
					action="#{schoolYearBean.clear}" reRender="gestionSchoolYear" />
			</a4j:region>
			<br/><br/><br/><br/><br/><br/><br/><br/>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
