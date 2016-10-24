<a4j:region>
	<a4j:outputPanel id="gestionGrade">
		<rich:panel style="overflow: hidden; width: 75%; white-space: nowrap;">
			<f:facet name="header">
				<h:outputFormat value="#{msg.detailsHeader}">
					<f:param value="#{msg.grade}" />
				</h:outputFormat>
			</f:facet>
			<table class="table">
				<tr>
					<td><h:inputHidden value="#{gradeBean.grade.id}" /> <h:outputText
						value="#{msg.name}" /><font color="#FF0000">*</font></td>
					<td><h:inputText id="name7" value="#{gradeBean.grade.name}"
						size="30" maxlength="50" onchange="convertToUpperCase(this);">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
					<td><font color="#FF0000"><rich:message for="name7" /></font>
					</td>
				</tr>

				<tr>
					<td><h:outputText value="#{msg.minMark}" /><font color="#FF0000">*</font></td>
					<td><h:inputText id="name77"
						value="#{gradeBean.grade.beginRange}" size="10" maxlength="9">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
					<td><font color="#FF0000"><rich:message for="name77" /></font>
					</td>
				</tr>
				<tr>
					<td><h:outputText value="#{msg.maxMark}" /><font color="#FF0000">*</font></td>
					<td><h:inputText id="name78"
						value="#{gradeBean.grade.endRange}" size="10" maxlength="9">
						<rich:ajaxValidator event="onblur" />
					</h:inputText></td>
					<td><font color="#FF0000"><rich:message for="name78" /></font>
					</td>
				</tr>
			</table>

			<a4j:commandButton value="#{msg.save}" action="#{gradeBean.insert}"
				rendered="#{ schoolBean.userHasWriteAccess }"
				reRender="grades, gestionGrade" />
			<SPACER TYPE=HORIZONTAL SIZE=50>
			<a4j:region>
				<a4j:commandButton value="#{msg.clear}" action="#{gradeBean.clear}"
					reRender="gestionGrade" />
			</a4j:region>
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>
