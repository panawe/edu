<a4j:form><a4j:region>
	<table width="50%">
		<tr>
			<td><h:outputText value="#{msg.inHowManyDays }" /></td>
			<td width="30%">
				<h:inputText value="#{productConsumerBean.numberOfDays}" /> 	
			</td>
			<td>
				<a4j:commandButton value="#{msg.search}" action="#{productConsumerBean.getOverDueProductConsumers}" reRender="overDueProductConsumers" 
				oncomplete="if (#{productConsumerBean.rowCount <= 0}) #{rich:component('overDueProductConsumerResultPanel')}.show();" />
			</td>
			
		</tr>
	</table>
</a4j:region></a4j:form>

<a4j:form><a4j:region>
	<rich:modalPanel id="overDueProductConsumerResultPanel" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<p>
			<h:outputText value="#{msg.noResultFound}" />
		</p>
		<p></p>
		<p>
			<a4j:commandButton value="Fermer" reRender="overDueProductConsumers" 
			oncomplete=" #{rich:component('overDueProductConsumerResultPanel')}.hide();" />
		</p>
	</rich:modalPanel>
</a4j:region></a4j:form>

<a4j:outputPanel id="overDueProductConsumers">
	<p>
		<%@include file="/WEB-INF/jsfIncludes/productConsumerList.jsp"%>
	</p>
	<p>
		<%@include file="/WEB-INF/jsfIncludes/productConsumerDetails.jsp"%>
	</p>
</a4j:outputPanel>

<a4j:region>
	<rich:messages></rich:messages>
</a4j:region>



