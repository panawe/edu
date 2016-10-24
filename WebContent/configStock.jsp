<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr valign="top">
		<td valign="top">
			<rich:tabPanel switchType="ajax" width="100%" id="stocksConfigPanel" immediate="true" >

				<rich:tab id="carrierTab" label="#{msg.carrier}">
					<%@include file="/WEB-INF/jsfIncludes/carrierList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/carrierDetails.jsp"%>
				</rich:tab>

				<rich:tab id="supplierTab" label="#{msg.supplier}">
					<%@include file="/WEB-INF/jsfIncludes/supplierList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/supplierDetails.jsp"%>
				</rich:tab>

				<rich:tab id="categoryTab" label="#{msg.category}">
					<%@include file="/WEB-INF/jsfIncludes/categoryList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/categoryDetails.jsp"%>
				</rich:tab>

				<rich:tab id="brandTab" label="#{msg.brand}">
					<%@include file="/WEB-INF/jsfIncludes/brandList.jsp"%>
					<br />
					<%@include file="/WEB-INF/jsfIncludes/brandDetails.jsp"%>
				</rich:tab>

			</rich:tabPanel>

		</td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>