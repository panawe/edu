
<table border="0" align="center" cellspacing="0" cellpadding="0"
	width="100%" style="height: 100%;">
	<tr>
		<td height="42px" align="left">
		<table border="0" align="center" cellspacing="0" cellpadding="0"
			width="100%">
			<tr><a4j:region>
				<td align="left"><a4j:outputPanel ajaxRendered="true"
					rendered="#{userBean.displayConnect}">
					<img src="images/logo.gif" width="125" height="30" />
				</a4j:outputPanel> <a4j:outputPanel ajaxRendered="true"
					rendered="#{!userBean.displayConnect}">
					<h:panelGroup id="logoPanel">
						<a4j:mediaOutput id="logo" element="img" mimeType="image/gif"
							createContent="#{userBean.paintLogo}" value="1"
							style="height: 42px; width: 42px" 
							cacheable="false">
						</a4j:mediaOutput>
					</h:panelGroup>
				</a4j:outputPanel></td>
				<td align="right"><img src="images/iSchool.jpg" width="125"
					height="30" /></td>
			</a4j:region>
			</tr>
		</table>

		</td>
	</tr>