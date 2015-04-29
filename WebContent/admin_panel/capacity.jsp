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

<title>Admin Panel - Capacity Details</title>
<link rel="stylesheet" type="text/css"
	href="/arc/STATIC_ASSETS/dist/semantic.min.css">
<script src="/arc/STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<script src="/arc/STATIC_ASSETS/dist/semantic.min.js"></script>
<script src="/arc/STATIC_ASSETS/dist/feed.js"></script>
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
				<a class=" blue item" href="general.jsp"> <i class="home icon"></i>
					General Settings
				</a> <a class="active blue item" href="capacity.jsp"> <i
					class="mail icon"></i>Capacity Details
				</a> <a class=" blue item" href="regDetails.jsp"> <i
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
			<h1 id="menuHeader" class="ui dividing header">Card Capacity
				Details</h1>

			<div class="ui top attached tabular menu">
				<a class="active blue item" onclick="getCombinationDataEG();"
					data-tab="first">EG</a> <a class="blue item"
					onclick="getCombinationDataWS();" data-tab="second">Workshop</a>
			</div>

			<div class="ui active tab segment" data-tab="first">

				<div id="combDataLoader" class="ui active inverted dimmer">
					<div class="ui text loader">Loading</div>
				</div>

				<div id="EGCombData"></div>

			</div>
			<div class="ui tab segment" data-tab="second">

				<div id="combDataLoader1" class="ui active inverted dimmer">
					<div class="ui text loader">Loading</div>
				</div>


				<div id="WSCombData"></div>

			</div>
		</div>
		<div class="two wide column"></div>
	</div>
</body>
<script type="text/javascript">
	getCombinationDataEG();
</script>
</html>
