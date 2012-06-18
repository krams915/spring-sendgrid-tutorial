<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/email/send" var="sendUrl"/>

<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/jquery-ui/pepper-grinder/jquery-ui-1.8.16.custom.css"/>'/>
	<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/style.css"/>'/>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-ui-1.8.16.custom.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/util.js"/>'></script>
	
	<title>Email</title>
	
	<script type='text/javascript'>
	$(function() {
		init();
	});
	
	function init() {
		$('input:button').button();
		$('#submit').button();
		
		$('#emailForm').submit(function() {
			event.preventDefault();	
			
			$.postJSON('${sendUrl}', {
						senderName: $('#senderName').val(),
						senderEmail: $('#senderEmail').val(),
						ccEmail: $('#ccEmail').val(),
						subject: $('#subject').val(),
						body: $('#textBody').val(),
						receiverName: $('#receiverName').val(),
						receiverEmail: $('#receiverEmail').val()
					},
					function(result) {
						if (result.success == true) {
							dialog('Success', 'Email has been sent!');
						} else {
							dialog('Failure', 'Email has not been sent!');
						}
			});
		});
		
		$('#reset').click(function() {
			clearForm();
			dialog('Success', 'Fields have been cleared!');
		});
	}
	
	function dialog(title, text) {
		$('#msgbox').text(text);
		$('#msgbox').dialog( 
				{	title: title,
					modal: true,
					buttons: {"Ok": function()  {
						$(this).dialog("close");} 
					}
				});
	}
	
	function clearForm() {
		$('#receiverName').val('');
		$('#receiverEmail').val('');
		$('#ccEmail').val('');
		$('#senderName').val('');
		$('#senderEmail').val('');
		$('#subject').val('');
		$('#textBody').val('');
	}
	</script>
</head>

<body>
	<h1 id='banner'>Compose Email</h1>
	
	<div>
		<form id='emailForm'>
  			<fieldset>
				<legend>New Email</legend>
				<label for='receiverName'>To (name):</label><input type='text' id='receiverName'/><br/>
				<label for='receiverEmail'>To (email)</label><input type='text' id='receiverEmail'/><br/>
				<label for='ccEmail'>Cc (email):</label><input type='text' id='ccEmail'/><br/>
				<label for='senderName'>From (name):</label><input type='text' id='senderName'/><br/>
				<label for='senderEmail'>From (email):</label><input type='text' id='senderEmail'/><br/>
				<label for='subject'>Subject:</label><input type='text' id='subject'/><br/>
				<label for='textBody' style="display:break">Message</label>
				<textarea name="textBody" id="textBody">Email message here</textarea><br/>
				<input type='button' value='Reset' id='reset' />
				<input type='submit' value='Send' id='submit'/>
  			</fieldset>
		</form>
	</div>
	
	<div id='msgbox' title='' style='display:none'></div>
</body>
</html>