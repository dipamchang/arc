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
<meta name="author" content="Dipam Changede">
<meta name="contact" content="dipamchang@gmail.com">

<title>Admin Panel - Registration Details</title>
<link rel="stylesheet" type="text/css"
	href="/arc/STATIC_ASSETS/dist/semantic.min.css">
<script src="/arc/STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<script src="/arc/STATIC_ASSETS/dist/semantic.min.js"></script>
<script src="/arc/STATIC_ASSETS/dist/feed.js"></script>
<script src="/arc/STATIC_ASSETS/main1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#studentRegDetails').form({
			studentId : {
				identifier : 'studentId',
				rules : [ {
					type : 'empty',
					prompt : 'Please enter StudentId or wildcard text'
				} ]
			},
			regStatus : {
				identifier : 'regStatus',
				rules : [ {
					type : 'empty',
					prompt : 'Please select a registration Status'
				} ]
			}
		}, {
			inline : true,
			on : 'blur',
			transition : 'fade down',
			onSuccess : RegValidationPassed
		});

	});

	function RegGetFieldValue(fieldId) {
		// 'get field' is part of Semantics form behavior API
		return $('#studentRegDetails').form('get field', fieldId).val().trim();
	}
	function RegValidationPassed() {
		$('#searchButton').addClass("loading");
		var formData1 = {
			studentId : RegGetFieldValue('studentId'),
			regStatus : RegGetFieldValue('regStatus')
		};
		$.ajax({
			type : 'POST',
			url : '/arc/SRegistrationDetails',
			data : formData1,
			success : regFilterPosted
		});
	}

	function regFilterPosted(response) {
		$('#ajaxRegDetails').html(response);
		$('#searchButton').removeClass("loading");
	}

	function deRegisterStudent(studentId1) {
		var dd = {
			studentId : studentId1
		};
		$.ajax({
			type : 'POST',
			url : '/arc/DeRegister',
			data : dd,
			success : RegValidationPassed
		});
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
				<a class=" blue item" href="general.jsp"> <i class="home icon"></i>
					General Settings
				</a> <a class="blue item" href="capacity.jsp"> <i class="mail icon"></i>Capacity
					Details
				</a> <a class="active blue item" href="regDetails.jsp"> <i
					class="user icon"></i>Registration Details
				</a> <a class=" blue item" href="uploadDownload.jsp"> <i
					class="user icon"></i>Upload-Download
				</a>
			</div>
		</div>
		<div class="nine wide right column">
			<!-- 			<div id="loader" class="ui active inverted dimmer"> -->
			<!-- 				<div class="ui text loader">Loading</div> -->
			<!-- 			</div> -->
			<h1 id="menuHeader" class="ui dividing header">Student
				Registration Details</h1>

			<div class="ui form segment" id="studentRegDetails">
				<p>Wildcard's can be used in Student Id field like 2015, A3, 610</p>
				<div class="three fields">
					<div class="seven wide field">
						<label>Student ID</label> <input
							placeholder="2015A3PS123G, 2015, A7, 610 likewise"
							name="studentId" type="text" value="">
					</div>
					<div class="five wide field">
						<label>Reg. Status</label>
						<div class="ui selection dropdown">
							<input type="hidden" name="regStatus">
							<div class="default text">Registration Status</div>
							<i class="dropdown icon"></i>
							<div class="menu">
								<div class="item" data-value="1">Registered</div>
								<div class="item" data-value="2">Not Registered</div>
								<div class="item" data-value="3">Both</div>
								<div class="item" data-value="4">De-Registered</div>
							</div>
						</div>
					</div>
					<br>
					<div id="searchButton"
						class="ui primary right floated submit animated button">
						<div class="visible content">Search</div>
						<div class="hidden content">
							<i class="inverted search icon"></i>
						</div>
					</div>
					<!-- 					<div class="four wide field"> -->
					<!-- 						<br> -->
					<!-- 						<div id="searchButton" class="ui primary right floated animated button"> -->
					<!-- 							<div class="visible content">Search</div> -->
					<!-- 							<div class="hidden content"> -->
					<!-- 								<i class="inverted search icon"></i> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</div>


			</div>
			<div id="ajaxRegDetails"></div>
		</div>
		<div class="two wide column"></div>
	</div>
</body>

</html>
