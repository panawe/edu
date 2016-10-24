
<%@include file="/WEB-INF/includes/headerandjq.jsp"%>

<f:view locale="#{userBean.selectedLocale}">
	<%@include file="/WEB-INF/includes/topmenustatic_nopic.jsp"%>
	<div class="menu_nav">
	<ul>
		<li class="active"><a href="index.faces"><span>Accueil</span></a></li>
		<li><a href="index_ischool.faces"><span>iSCHOOL</span></a></li>
		<li><a href="index_enseignants.faces"><span>ENSEIGNANTS</span></a></li>
		<li><a href="index_parents.faces"><span>PARENTS</span></a></li>
		<li><a href="index_eleves.faces"><span>ELEVES</span></a></li>
	</ul>
	</div>
	</div>
	</div>
	<div class="content">
	<div class="content_resize">
	<div class="fullmainbar"><a4j:form>
		<a4j:region>
			<rich:tabPanel switchType="ajax" width="100%"
				id="tempusersFeedbackPanel" immediate="true">
				<rich:tab id="feedback" label="#{msg.feedback}">
					<table width="100%" border="0">

						<tr>
							<td><h:outputText value="#{msg.iam}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.userType}">
								<f:selectItem itemValue="1" itemLabel="#{msg.teacher }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.student }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.parent }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.itResource}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.schoolPersonel}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.investor}" />
								<f:selectItem itemValue="0" itemLabel="#{msg.other }" />
							</h:selectOneRadio></td>
							 
						</tr>

						<tr>
							<td><h:outputText value="#{msg.school}" /></td>
							<td><h:inputText id="schoolName"
								value="#{usersFeedbackBean.usersFeedback.schoolName}" size="50"
								maxlength="150" onchange="convertToUpperCase(this);">
							</h:inputText></td> 
						</tr>

						<tr>
							<td><h:outputText value="#{msg.name}" /></td>
							<td><h:inputText id="fullName"
								value="#{usersFeedbackBean.usersFeedback.fullName}" size="50"
								maxlength="150" onchange="convertToUpperCase(this);">
							</h:inputText></td> 
						</tr>

						<tr>
							<td><h:outputText value="#{msg.email}" /></td>
							<td><h:inputText id="email"
								value="#{usersFeedbackBean.usersFeedback.email}" size="50"
								maxlength="150" onchange="convertToUpperCase(this);">
							</h:inputText></td> 
						</tr>

						<tr>
							<td><h:outputText value="#{msg.overallRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.overallRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
							 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.functionalityRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.functionalityRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
							 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.supportRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.supportRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
							 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.docRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.docRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
							 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.costRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.costRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
							 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.interfaceRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.interfaceRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
							 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.performanceRating}" /></td>
							<td><h:selectOneRadio
								value="#{usersFeedbackBean.usersFeedback.performanceRating}">
								<f:selectItem itemValue="0" itemLabel="#{msg.notSure }" />
								<f:selectItem itemValue="1" itemLabel="#{msg.veryMediocre }" />
								<f:selectItem itemValue="2" itemLabel="#{msg.mediocre }" />
								<f:selectItem itemValue="3" itemLabel="#{msg.average }" />
								<f:selectItem itemValue="4" itemLabel="#{msg.good}" />
								<f:selectItem itemValue="5" itemLabel="#{msg.veryGood}" />
								<f:selectItem itemValue="6" itemLabel="#{msg.excellent}" />
							</h:selectOneRadio></td>
						 
						</tr>
						<tr>
							<td><h:outputText value="#{msg.comments}" /></td>
							<td><h:inputTextarea id="reportHeader"
								value="#{usersFeedbackBean.usersFeedback.comment}" rows="3" cols="50">
							</h:inputTextarea></td>

						</tr>
						<tr>
							<td valign="top" colspan="2"><a4j:commandButton
								onclick="buttonClicked = true; " value="#{msg.sendFeedback}"
								action="#{usersFeedbackBean.insert}"
								reRender="actionResultPanel1"
								oncomplete="#{rich:component('actionResultPanel1')}.show();" />

							</td>
						</tr>

					</table>
				</rich:tab>
			</rich:tabPanel>
			<a4j:status
				onstart="if (buttonClicked) {#{rich:component('wait')}.show()}"
				onstop="buttonClicked = false; #{rich:component('wait')}.hide()" />
		</a4j:region>
	</a4j:form> <rich:modalPanel id="wait" autosized="true" width="200" height="120"
		moveable="false" resizeable="false">
		<f:facet name="header">
			<h:outputText value="#{msg.operationInProgress }" />
		</f:facet>
		<h:outputText value="#{msg.oneMomentPlease }" />
	</rich:modalPanel> <rich:modalPanel id="actionResultPanel1" autosized="true" width="300">
		<f:facet name="header">
			<h:outputText value="#{msg.result}" />
		</f:facet>
		<a4j:form>
			<p><font color="#FF0000"> <error> <h:outputText
				value="#{usersFeedbackBean.errorMessage}" /> </error> </font> <font
				color="#3f3f3f"> <success> <h:outputText
				escape="false" value="#{usersFeedbackBean.successMessage}" /> </success> </font></p>

			<p><a4j:commandButton value="#{msg.close }" immediate="true"
				action="#{usersFeedbackBean.redirect}"
				oncomplete="#{rich:component('actionResultPanel1')}.hide();" /></p>
		</a4j:form>
	</rich:modalPanel></div>

	<div class="clr"></div>
	</div>
	</div>
</f:view>
	<%@include file="/WEB-INF/includes/footerstatic.jsp"%>
