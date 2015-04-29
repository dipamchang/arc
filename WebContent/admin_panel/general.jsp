<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properities -->
<title>Admin Panel - General Settings</title>

<!--   <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700|Open+Sans:300italic,400,300,700' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" type="text/css"
	href="/arc/STATIC_ASSETS/dist/semantic.min.css">
<script src="/arc/STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<!--   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.address/1.6/jquery.address.js"></script> -->
<script src="/arc/STATIC_ASSETS/dist/semantic.min.js"></script>
<!-- <link rel="stylesheet" type="text/css"	href="STATIC_ASSETS/dist/feed.css"> -->
<script src="/arc/STATIC_ASSETS/dist/feed.js"></script>
<!-- <script src="STATIC_ASSETS/mandrill.js"></script> -->
<script src="/arc/STATIC_ASSETS/main.js"></script>
<script>
	$(document).ready(function(){
$('#generalSettings')
.form({
	wsgroup: {
		identifier  : 'wsgroup',
		rules: [
		        {
		        	type   : 'empty',
		        	prompt : 'Please enter WS group branches'
		        }
		        ]
	},
	eggroup: {
		identifier  : 'eggroup',
		rules: [
		        {
		        	type   : 'empty',
		        	prompt : 'Please enter EG group branches'
		        }
		        ]
	}
}, {
	inline : true,
	on     : 'blur',
	transition : 'fade down',
	onSuccess : GeneralValPassed
})
;
});

	function RegGetFieldValue(fieldId) { 
	    // 'get field' is part of Semantics form behavior API
	    return $('#generalSettings').form('get field', fieldId).val().trim();
	 }
	function GeneralValPassed(){
		alert("sadfsdfs");
		 var formData1 = {
				 egbranches : RegGetFieldValue('eggroup'), wsbranches : RegGetFieldValue('wsgroup') 
		      };
		 $.ajax({ type: 'POST', url: '/arc/GroupBranch', data: formData1, success: function(response){
			 $('#responseMessage').html(response);
		 } });
	}	
	
	
	
</script>


</head>
<body id="feed">
	<div class="ui divided padded grid">
		<br>
		<h2 class="ui dividing header">Admin Panel</h2>
		<div class="two wide column"></div>
		<div class="three wide middle column">
			<h2 class="ui header">
				<i class="content icon"></i> Menu
			</h2>
			<div class="ui vertical pointing menu">
				<a class="active blue item" href="general.jsp"> <i class="home icon"></i> General Settings</a> 
				<a class=" blue item" href="capacity.jsp"> <i class="mail icon" ></i>Capacity Details</a> 
				<a class=" blue item" href="regDetails.jsp"> <i class="user icon" ></i>Registration Details</a>
				<a class=" blue item" href="uploadDownload.jsp"> <i class="user icon" ></i>Upload-Download</a>
			</div>
		</div>
		<div class="nine wide right column">
			<!-- 			<div id="loader" class="ui active inverted dimmer"> -->
			<!-- 				<div class="ui text loader">Loading</div> -->
			<!-- 			</div> -->
			<h1 id="menuHeader" class="ui dividing header">General Settings</h1>
			<div class="ui form segment" id="generalSettings">
				<p>Configure the general settings for the registration.</p>
<!-- 				<div class="two fields"> -->
<!-- 					<div class="field"> -->
<!-- 						<label>Academic Year</label> <input placeholder="eg - 2015-2016" -->
<!-- 							name="academicYear" type="text" value=""> -->
<!-- 					</div> -->
<!-- 					<div class="field"> -->
<!-- 						<label>Semester</label> -->
<!-- 						<div class="ui selection dropdown"> -->
<!-- 							<input type="hidden" name="semester"> -->
<!-- 							<div class="default text">Choose Semester</div> -->
<!-- 							<i class="dropdown icon"></i> -->
<!-- 							<div class="menu"> -->
<!-- 								<div class="item" data-value="1">Semester 1</div> -->
<!-- 								<div class="item" data-value="2">Semester 2</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="two fields">
					<div class="field">
						<label>Workshop Group</label> <input
							placeholder="Comma Seperated - A7,A3,B1" name="wsgroup"
							type="text" value="">
					</div>
					<div class="field">
						<label>Engineering Graphics Group</label> <input
							placeholder="Comma Seperated - A1,A4,B2" name="eggroup"
							type="text" value="">
					</div>
				</div>
				<div class="ui green right floated submit button" id="nextBtn">Save</div>
			</div>
			<div id="responseMessage"></div>
		</div>
		<div class="two wide column"></div>
	</div>
</body>
</html>
