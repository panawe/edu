<a4j:form>
	<rich:dataGrid value="#{newsBean.newss}" var="news"
		rendered="#{newsBean.rowCount>0}" id="personnelGrid" columns="3"
		elements="3" align="top">
		 
		<a4j:mediaOutput id="newsPic" element="img" mimeType="image/gif"
			style="width:125px; height:125px;"
			createContent="#{newsBean.paintNewsPic}" value="#{news.id}"
			cacheable="false" align="top">
		</a4j:mediaOutput>
		<h3><h:outputText value="#{news.title}" /> </h3>
		<h:outputText escape="false" value="#{news.message}" />
		<h:outputText value="#{news.newsDate}">
			<f:convertDateTime pattern="#{configurationBean.dateFormat}" />
		</h:outputText>
		<h3><h:outputText value="#{news.author}" /></h3>

		<a4j:commandLink ajaxSingle="true" id="modify"
			action="#{newsBean.edit}" reRender="newsPanel1">
			<h:graphicImage value="images/edit.gif" style="border:0" />
			<f:param name="id" value="#{news.id}" />
		</a4j:commandLink>
		<rich:spacer width="20" height="10" title="" />
		<a4j:commandLink ajaxSingle="true" id="deleteC"
			action="#{newsBean.delete}" reRender="newsPanel"
			oncomplete="#{rich:component('newsResultPanel')}.show();">
			<h:graphicImage value="/images/delete.gif" style="border:0" />
			<f:param name="id" value="#{news.id}" />
		</a4j:commandLink>
 
		<f:facet name="footer">
			<rich:datascroller></rich:datascroller>
		</f:facet>
	</rich:dataGrid>

</a4j:form>
<rich:modalPanel id="newsResultPanel" autosized="true" width="300">
	<f:facet name="header">
		<h:outputText value="#{msg.result}" />
	</f:facet>
	<a4j:form>
		<p><font color="#FF0000"> <error> <h:outputText
			value="#{newsBean.errorMessage}" /> </error> </font> <font color="#00FF00">
		<success> <h:outputText value="#{newsBean.successMessage}" />
		</success> </font></p>

		<p><a4j:commandButton value="#{msg.close }"
			oncomplete="#{rich:component('newsResultPanel')}.hide();" /></p>
	</a4j:form>
</rich:modalPanel>