<%@include file="/WEB-INF/includes/header.jsp"%>

<f:view locale="#{userBean.selectedLocale}">

	<%@include file="/WEB-INF/includes/banner.jsp"%>


	<%@include file="/WEB-INF/includes/topmenu.jsp"%>
	<!-- Begin Content Column -->

	<tr>
		<td align="center" valign="top"  width="100%"  height="600">
		<iframe src='superUserGuide.html' frameborder="0" style="width:100%;height:100%"></iframe></td>
	</tr>

	<%@include file="/WEB-INF/includes/footer.jsp"%>

</f:view>

