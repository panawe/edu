<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr  valign="top">
		<td  valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="stocksConfigPanel" selectedTab="#{productBean.selectedTab }">
			<rich:tab id="productList" label="#{msg.product}">
				<%@include file="/WEB-INF/jsfIncludes/productList.jsp"%>
			</rich:tab>
			<rich:tab id="productDetails" label="#{msg.details }">
				<%@include file="/WEB-INF/jsfIncludes/productDetails.jsp"%>
			</rich:tab>
		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>