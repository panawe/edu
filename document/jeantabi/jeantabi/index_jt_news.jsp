<%@include file="jeantabi/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear"><!-- ####################################################################################################### -->
	<h1>Nouvelles &amp; Evenements</h1>
	<a4j:form>
		<rich:dataGrid value="#{newsBean.newss}" var="news"
			rendered="#{newsBean.rowCount>0}" id="personnelGrid1" columns="3"
			elements="3" align="left">

			<a4j:mediaOutput id="newsPic1" element="img" mimeType="image/gif"
				style="width:125px; height:125px;"
				createContent="#{newsBean.paintNewsPic}" value="#{news.id}"
				cacheable="false" align="top">
			</a4j:mediaOutput>
			<h3><a4j:commandLink ajaxSingle="true" id="vewNews1"
				action="#{newsBean.selectNews}"
				oncomplete="#{rich:component('newsPanel')}.show();"
				reRender="newsPanel" value="#{news.title}">
				<f:param name="id" value="#{news.id}" />
			</a4j:commandLink></h3>
			<h:outputText escape="false" value="#{news.shortMessage}" />
			<h:outputText value="#{news.newsDate}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
			</h:outputText>
			<strong><h:outputText value="#{news.author}" /></strong>


			<f:facet name="footer">
				<rich:datascroller></rich:datascroller>
			</f:facet>
		</rich:dataGrid>

	</a4j:form></div>
	</div>
	</div>

	<rich:modalPanel id="newsPanel" autosized="true" width="600">
		<f:facet name="header">
			<h:outputText value="#{msg.news}" />
		</f:facet>
		<f:facet name="controls">
			<h:panelGroup>
				<h:graphicImage value="/images/close.png" id="hidelink22"
					styleClass="hidelink" />
				<rich:componentControl for="newsPanel" attachTo="hidelink22"
					operation="hide" event="onclick" />
			</h:panelGroup>
		</f:facet>
		<a4j:form>
			<p><div class="imgl"><a4j:mediaOutput id="newsPic2" element="img"
				mimeType="image/gif" style="width:125px; height:125px;"
				createContent="#{newsBean.paintNewsPic}" value="#{newsBean.news.id}"
				cacheable="false">
			</a4j:mediaOutput></div>
			<div class="latestnews">
			<p>
			
			<h3><h:outputText value="#{newsBean.news.title}" /></h3>
			</p>
			<p><h:outputText escape="false" value="#{newsBean.news.message}" />
			<h:outputText value="#{newsBean.news.newsDate}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
			</h:outputText>
			
			<h3><h:outputText value="#{newsBean.news.author}" /></h3>
			</p>
			</div>
			</p>
		</a4j:form>
	</rich:modalPanel>
	<!-- ####################################################################################################### --></
			</f:view>
<%@include file="jeantabi/includes/footer.jsp"%>