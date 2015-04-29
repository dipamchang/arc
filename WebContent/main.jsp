<%@page import="com.bits_pilani.goa.arc.Registration.CombinationType"%>
<%@page import="com.bits_pilani.goa.arc.Dao.StudentData"%>
<%@page import="com.bits_pilani.goa.arc.Dao.Combinations"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	HttpSession sess = request.getSession();
	String id = (String) sess.getAttribute("LOGIN_USER");
	String name = (String) sess.getAttribute("NAME");
%>

<%
	StudentData info = new StudentData();
	String regCom = info.ifRegistered(id);
	if (!regCom.equals("not")) {
		response.sendRedirect("/arc/successRegistration.jsp?comb="
				+ regCom);
	} else {
		CombinationType combination = new CombinationType();
		String set = combination.getType(id);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="refresh" content="50" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properities -->
<title>Select Combination</title>
<link rel="stylesheet" type="text/css"
	href="STATIC_ASSETS/dist/semantic.min.css">
<script src="STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<script src="STATIC_ASSETS/dist/semantic.min.js"></script>
<script src="STATIC_ASSETS/dist/feed.js"></script>
<script src="STATIC_ASSETS/main1.js"></script>
</head>
<body id="feed">
	<div class="ui divided padded grid">
		<div class="ui top right attached label">Page refreshes every 50
			secs</div>
		<h2 class="ui dividing header">
			Howdy <i><%=name.replace(".", "?")%></i><a class="anchor" id="types"></a>
		</h2>
<!-- 		<div class="one wide column"></div> -->
		<div class="three wide middle column">
			<h2 class="ui header">
				<i class="content icon"></i> Combinations
			</h2>
			<div class="ui tabular filter menu">
				<a class="active item" data-tab="available">Available</a> <a
					class="item" data-tab="full">Full</a>

			</div>
			<div class="ui divided very relaxed selection inbox list active tab"
				data-tab="available">

				<%
					Combinations asd = new Combinations();
						Map<String, Integer> as = asd.getAvailableCombinations(set);
						for (String comb : as.keySet()) {
				%>
				<%
					if (as.get(comb) > 0) {
				%>
				<a class="item" id="<%=comb%>" onclick="getTT('<%=comb%>')">
					<div class="left floated">
						<i class="chevron circle right icon"></i>
					</div>
					<div class="description">
						<%
							{
											out.print(comb);
										}
						%>
					</div>
				</a>

				<%
					}
						}
				%>
			</div>
			<div class="ui divided very relaxed inbox selection list tab"
				data-tab="full">
				<%
					for (String comb : as.keySet()) {
				%>

				<%
					if (as.get(comb) <= 0) {
				%>
				<a class="item">
					<div class="left floated">
						<i class="chevron circle right icon"></i>
					</div>
					<div class="description">
						<%
							{
											out.print(comb);
										}
						%>
					</div>
				</a>
				<%
					}
						}
				%>
			</div>
			<div class="ui divider"></div>
		</div>
		<div class="thirteen wide right column">
			<div id="loader" class="ui active inverted dimmer">
				<div class="ui text loader">Loading</div>
			</div>
			<h1 id="detailsHeader" class="ui header">Section Details</h1>
			<a class="ui label" onclick="showh()">SET <%=set%></a>
			<div class="ui divider"></div>
			<div id="sixbynine">
				<h3 class="ui header">
					<i class="arrow left icon"></i>Select a Combination from left to
					view Time Table
				</h3>
			</div>
			<div id="ttTable"></div>
			<div class="ui divider"></div>
			<div id="hiddenMagic" style="visibility: hidden"></div>
			<div class="ui right floated blue button" id="register"
				onclick="registerStudent()">Register</div>
			<br> <br>
		</div>
<!-- 		<div class="one wide column"></div> -->
	</div>
	<input type="hidden" id="refresh" value="no">
	<div id="miss" class="ui standard modal ">
		<i class="close icon"></i>
		<div class="header">Just Missed !</div>
		<div class="content">
			<div class="image">
				<img class="ui small image" src="STATIC_ASSETS/m1.JPG">
			</div>
			<div class="description">
				<h2>Ah ! the Capacity just got filled. Try Another Combination
					after the page reloads.</h2>
			</div>
		</div>
		<div class="actions">
			<div class="ui button">Cancel</div>
			<div class="ui button">OK</div>
		</div>
	</div>
	<div id="" class="ui standard modal ">
		<i class="close icon"></i>
		<div class="header">It's been long !</div>
		<div class="content">
			<div class="image">
				<img class="ui medium image" src="STATIC_ASSETS/h1.png">
			</div>
		</div>
		<div class="actions">
			<div class="ui button">OK</div>
		</div>
	</div>
	<div id="hurry" class="ui page dimmer">
		<div class="content">
			<div class="center">
				<h2 class="ui inverted icon header">
					Slots filling up FAFAFA . . <img class="ui medium image"
						src="STATIC_ASSETS/h1.png">
					<div class="sub header">click anywhere to close this ^</div>
				</h2>
			</div>
		</div>
	</div>
</body>
</html>
<%
	}
%>