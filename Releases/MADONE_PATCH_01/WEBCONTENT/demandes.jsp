<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td   valign="top">
			<rich:tabPanel switchType="ajax" width="100%"
				id="consumerConfigPanel" selectedTab="#{productConsumerBean.selectedTab }">

				<rich:tab id="productConsumerListTab"
					label="#{msg.demandList}">
					<%@include file="/WEB-INF/jsfIncludes/productConsumerList.jsp"%>
				</rich:tab>

				<rich:tab id="productConsumerDetailsTab"
					label="#{msg.makeADemand}">
					<%@include file="/WEB-INF/jsfIncludes/productConsumerDetails.jsp"%>
				</rich:tab>
				
			</rich:tabPanel>
		</td>
	</tr>
	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>