 <script type="text/javascript" src="scripts/prototype.js"></script>
 <script language="JavaScript"  type="text/javascript">
            var questionRow = null;
            function addSectionArea() {
               alert('Hello');
               if (questionRow == null)
               	questionRow = document.getElementById('question').innerHTML;
               myDiv = document.createElement('div');
               myDiv.style.position = 'absolute';
               myDiv.innerText = questionRow.toText();
               alert(questionRow);
               document.getElementById('question').addElement(myDiv);
            }
        </script>
<a4j:region>
	<a4j:outputPanel id="quizGestion">
		<rich:panel header="Quiz Information">
			<table>
				<tr>
					<td colspan="2"> Quiz Details </td>
				</tr>
				
				<tr>
					<td colspan="2"> Please fill the quiz below and add questions to your quiz </td>
				</tr>
				
				<tr>
					<td > Title: </td> 
					<td>
	        			<h:inputText id="title" value="" 
	        				size="75" maxlength="75">
	          				<rich:ajaxValidator event="onblur"/>
	        			</h:inputText>    
	        		</td>
	        	</tr>
	        	<tr>
	        		<td > Description: </td> 
					<td>
	        			<h:inputTextarea id="titleDescription" value="" 
	        				rows="4" cols="50" label="Title description" >
	        			</h:inputTextarea>    
	        		</td>
	        	</tr>
	        	<tr>	
	        		<td > Begin Message: </td> 
					<td>
	        			<h:inputTextarea id="beginMessage" value="" 
	        				rows="4" cols="50" label="Begin message" >
	        			</h:inputTextarea>    
	        		</td>
	        	</tr>
	        	<tr>
	        		<td > End Message: </td> 
					<td>
	        			<h:inputTextarea id="endMessage" value="" 
	        				rows="4" cols="50" label="End message" >
	        			</h:inputTextarea>    
	        		</td>
				</tr>
			</table>
		</rich:panel>
		
		<rich:panel header="Questions Information">
			<div id = "question">
				<h:inputTextarea id="name" value="" 
        			rows="4" cols="50" label="Begin message" >
        		</h:inputTextarea> 
			</div>
		<input type="button" value="Add" onclick="addSectionArea()"/>
			
		</rich:panel>
	</a4j:outputPanel>
</a4j:region>