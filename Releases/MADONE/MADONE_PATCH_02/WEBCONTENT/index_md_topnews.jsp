<%@include file="madone/includes/headernojq.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<!-- ####################################################################################################### -->
	<div class="wrapper row3">
	<div class="rnd">
	<div id="container" class="clear"><!-- ####################################################################################################### -->
	<h1>Dernieres Nouvelles</h1>
	<a4j:form>
		<ul>
			<li class="clear">
			<div class="imgl"><a4j:mediaOutput id="newsPic" element="img"
				mimeType="image/gif" style="width:125px; height:125px;"
				createContent="#{newsBean.paintNewsPic}"
				value="#{newsBean.news1.id}" cacheable="false">
			</a4j:mediaOutput></div>
			<div class="latestnews">
			<p>
			<h3><a4j:commandLink ajaxSingle="true" id="vewNews1"
				action="#{newsBean.selectNews}"
				oncomplete="#{rich:component('newsPanel')}.show();"
				reRender="newsPanel" value="#{newsBean.news1.title}">
				<f:param name="id" value="#{newsBean.news1.id}" />
			</a4j:commandLink></h3>
			</p>
			<p><h:outputText escape="false" value="#{newsBean.news1.message}" />
			<h:outputText value="#{newsBean.news1.newsDate}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
			</h:outputText>
			<h3><h:outputText value="#{newsBean.news1.author}" /></h3>
			</p>
			</div>
			</li>
			<li class="clear">
			<div class="imgl"><a4j:mediaOutput id="newsPic2" element="img"
				mimeType="image/gif" style="width:125px; height:125px;"
				createContent="#{newsBean.paintNewsPic}"
				value="#{newsBean.news2.id}" cacheable="false">
			</a4j:mediaOutput></div>
			<div class="latestnews">
			<p>
			<h3><a4j:commandLink ajaxSingle="true" id="vewNews2"
				action="#{newsBean.selectNews}"
				oncomplete="#{rich:component('newsPanel')}.show();"
				reRender="newsPanel" value="#{newsBean.news2.title}">
				<f:param name="id" value="#{newsBean.news2.id}" />
			</a4j:commandLink></h3>

			</p>
			<p><h:outputText escape="false" value="#{newsBean.news2.message}" />
			<h:outputText value="#{newsBean.news2.newsDate}">
				<f:convertDateTime pattern="dd/MM/yyyy" />
			</h:outputText>
			<h3><h:outputText value="#{newsBean.news2.author}" /></h3>
			</p>
			</div>
			</li>
		</ul>
	</a4j:form></div>
	</div>
	</div>

	<!-- ####################################################################################################### --></
			</f:view>
<%@include file="madone/includes/footer.jsp"%>