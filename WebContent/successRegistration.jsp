<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="author" content="Dipam Changede">
<meta name="contact" content="dipamchang@gmail.com">

<link rel="stylesheet" type="text/css"
	href="STATIC_ASSETS/dist/semantic.min.css">
<script src="STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<script src="STATIC_ASSETS/dist/semantic.min.js"></script>
<title>ARC Registeration - Success</title>
</head>
<%
	HttpSession sess = request.getSession();
	String id = (String) sess.getAttribute("LOGIN_USER");
	sess.setAttribute("LOGIN_USER", null);
	String name = (String) sess.getAttribute("NAME");
%>
<%
	String emailid = "f2014" + id.substring(8, 11);
%>
<body>
	<div class="ui page grid">
		<div class="ui top right purple attached label">Auto Logged out
			and Redirecting to Login page in 10 secs.</div>
		<div class="row">
			<div class="column">
				<br> <br>
				<h2 class="ui dividing header">
					ARC Semester Registration for - <i><%=name%></i><a
						class="anchor" id="types"></a>
				</h2>
			</div>
		</div>
		<div class="row">
			<div class="column">
				<div class="ui positive message">
					<i class="checkmark huge icon"></i>
					<div class=" huge header middle floated">
						SUCCESS
						<p>
							You have been registered for Combination -<b> <%=request.getParameter("comb")%></b>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="co" style="visibility: hidden"><%=request.getParameter("comb")%></div>
		<div id="id" style="visibility: hidden"><%=id%></div>
		<div id="mail" style="visibility: hidden"><%=emailid%></div>
	</div>
</body>
<script src="STATIC_ASSETS/main1.js"></script>
<script type="text/javascript">
	var delay = 10000; //Your delay in milliseconds
	setTimeout(function() {
		window.location = "/arc/login.jsp";
	}, delay);
</script>
</html>