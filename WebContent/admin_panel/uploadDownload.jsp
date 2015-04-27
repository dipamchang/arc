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
<title>Admin Panel - Upload/Download</title>

<!--   <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700|Open+Sans:300italic,400,300,700' rel='stylesheet' type='text/css'> -->
<link rel="stylesheet" type="text/css"
	href="/arc/STATIC_ASSETS/dist/semantic.min.css">
<script src="/arc/STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<!--   <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.address/1.6/jquery.address.js"></script> -->
<script src="/arc/STATIC_ASSETS/dist/semantic.min.js"></script>
<!-- <link rel="stylesheet" type="text/css"	href="STATIC_ASSETS/dist/feed.css"> -->
<script src="/arc/STATIC_ASSETS/dist/feed.js"></script>
<!-- <script src="STATIC_ASSETS/mandrill.js"></script> -->
<script src="/arc/STATIC_ASSETS/main1.js"></script>

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
				<a class=" blue item" href="/arc/admin_panel/general.jsp"> <i class="home icon"></i> General Settings</a> 
				<a class=" blue item" href="/arc/admin_panel/capacity.jsp"> <i class="mail icon" ></i>Capacity Details</a> 
				<a class=" blue item" href="/arc/admin_panel/regDetails.jsp"> <i class="user icon" ></i>Registration Details</a>
				<a class="active blue item" href="/arc/admin_panel/uploadDownload.jsp"> <i class="user icon" ></i>Upload-Download</a>
			</div>
		</div>
		<div class="nine wide right column">
			<!-- 			<div id="loader" class="ui active inverted dimmer"> -->
			<!-- 				<div class="ui text loader">Loading</div> -->
			<!-- 			</div> -->
			<h1  class="ui dividing header">Upload - Download Menu</h1>
			<div id="downloadSegment" class="ui segment" id="generalSettings">
				<h3 class="ui dividing header">Download Registration Data</h3>
				<div class="row">
					<div class="column">
						<i class="massive download link icon" onclick="downloadData();"></i>
						<h4 class="ui header">Download</h4>
					</div>
				</div>
			</div>
			
			<div id="uploadSegment" class="ui segment" id="generalSettings">
				<h3 class="ui dividing header">Upload Student Data</h3>
				<div class="row">
					<div class="column">
						<p>Student data should be in <b>.xls format</b>, with 2 columns first of student id and second of Student name.</p>
						<p>Generating passwords will erase any previous student data. </p>
						<form action="/arc/DownloadData" method="post" enctype="multipart/form-data">
							Select Student Data File to Upload  :   <input type="file" name="fileName">
								<br>
							<input type="submit" value="Upload">
						</form>
					</div>
					<div id="result">
            			<h3>${requestScope["message"]}</h3>
        			</div>
        			<div id="passDown">
            			<h3>${requestScope["passlink"]}</h3>
        			</div>
				</div>
			</div>
			
			
			
			
		</div>
		<div class="two wide column"></div>
	</div>
</body>
</html>
