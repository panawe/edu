<a4j:form>
	<table callpadding="10" cellspacing="10">
		<a4j:repeat value="#{reportBean.parameters}" var="item" >
	        <tr>
	            <td align="left" class="dr-subtable-cell rich-subtable-cell">
	                <h:outputText value="#{item.displayName}" />:
	            </td>
	            <td class="dr-subtable-cell rich-subtable-cell">
	            	<h:selectManyListbox id="parameterName" value="#{item.values}" rendered="#{item.inputType == 'MultiList' }"
						valueChangeListener="#{reportBean.parameterSelected}"
						binding="#{reportBean.myManyValue}" 
						size = "5"    
						onchange="this.form.submit();">
	                	<f:selectItems value="#{item.paramValues}" /> 
	                	<a4j:support event="onchanged" ajaxSingle="true"/>
	                	<f:attribute name="parameterName" value="#{item.name }" />
	                </h:selectManyListbox>
	                
	                <h:selectOneMenu id="parameterName1" value="#{item.value}" rendered="#{item.inputType == 'List' }"
						valueChangeListener="#{reportBean.parameterSelected}"
						binding="#{reportBean.myValue}"     
						onchange="this.form.submit();">
	                	<f:selectItems value="#{item.paramValues}" /> 
	                	<a4j:support event="onchanged" ajaxSingle="true"/>
	                	<f:attribute name="parameterName" value="#{item.name }" />
	                </h:selectOneMenu>
	                
	                <h:inputText id="parameterName2" value="#{item.value}" rendered="#{item.inputType == 'Input' }"
						valueChangeListener="#{reportBean.parameterSelected}"
						binding="#{reportBean.myInputValue}" maxlength="#{item.maxLength}" size="#{item.size}"    
						onchange="this.form.submit();">
						<a4j:support event="onchanged" ajaxSingle="true"/>
						<f:attribute name="parameterName" value="#{item.name }" />
					</h:inputText>
					
					<rich:calendar id="parameterName3"  value="#{item.value}" 
						rendered="#{item.inputType == 'Date' }"
						enableManualInput="true"
						valueChangeListener="#{reportBean.parameterSelected}"
						binding="#{reportBean.myCalendarValue}"     
						oninputblur="this.form.submit();"
						locale="fr/FR"
						popup="true" datePattern="dd/MM/yyyy" showFooter="false"
						showApplyButton="false" cellWidth="24px" cellHeight="22px"
						style="width:200px">
						<a4j:support event="onchanged" ajaxSingle="true"/>
						<f:convertDateTime pattern="dd/MM/yyyy" />
					</rich:calendar>

	            </td>
	        </tr>
	    </a4j:repeat>
	    <tr>
			<td><h:commandButton
				 value="#{msg.print}"
				id="printButtom" action="#{reportBean.printReport}" /> <rich:spacer
				width="20" height="10" title="" /></td>

			
		</tr>
	</table>
</a4j:form>




