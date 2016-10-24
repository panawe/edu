<%@include file="/WEB-INF/includes/header.jsp"%>
<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/banner.jsp"%>
	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->
	<tr>
		<td valign="top"><a4j:form>
			<rich:tabPanel switchType="ajax" width="100%" id="OtherConfigPanel">
				<rich:tab id="overDuePayment" label="#{msg.printing}">
					<a4j:support event="ontabenter" ajaxSingle="true"
						action="#{paymentBean.getOverDuePayments}"
						reRender="overDuePayments" />
					<%@include file="/WEB-INF/jsfIncludes/overDuePaymentList.jsp"%>
				</rich:tab>
			</rich:tabPanel>
		</a4j:form></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>
</f:view>