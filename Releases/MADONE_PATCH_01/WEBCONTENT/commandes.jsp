<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr valign="top">
		<td valign="top"><rich:tabPanel switchType="ajax" width="100%"
			id="orderConfigPanel" selectedTab="#{purchaseOrderBean.selectedTab}"
			immediate="true">

			<rich:tab id="purchaseOrderListTab" label="#{msg.purchaseOrders}">
				<%@include file="/WEB-INF/jsfIncludes/purchaseOrderList.jsp"%>
			</rich:tab>

			<rich:tab id="purchaseOrderDetailsTab" label="#{msg.orderProduct}">
				<%@include file="/WEB-INF/jsfIncludes/purchaseOrderDetails.jsp"%>
			</rich:tab>

			<rich:tab id="shipment" label="#{msg.shipments}">

				<rich:tabPanel switchType="ajax" width="100%"
					id="commandesShipmentPanel"
					selectedTab="#{shipmentBean.selectedTab }" immediate="true">
					<rich:tab id="ShipmentTabList" label="#{msg.shipments }">
						<%@include file="/WEB-INF/jsfIncludes/shipmentList.jsp"%>
					</rich:tab>
					<rich:tab id="ShipmentTabDetails" label="#{msg.details }">
						<%@include file="/WEB-INF/jsfIncludes/shipmentDetails.jsp"%>
					</rich:tab>

				</rich:tabPanel>

			</rich:tab>

		</rich:tabPanel></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>