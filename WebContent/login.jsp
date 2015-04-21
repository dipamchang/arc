<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="com.bits_pilani.goa.arc.Dao.Data"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
<link rel="stylesheet" type="text/css"
	href="STATIC_ASSETS/dist/semantic.min.css">
<script src="STATIC_ASSETS/jquery-2.1.3.min.js"></script>
<script src="STATIC_ASSETS/dist/semantic.min.js"></script>

<title>ARC Registeration Website</title>
</head>
<%Data RegData = new Data(); int cc = RegData.registeredCount(); String as = Integer.toString(cc);%>
<body>

	<div class="ui page grid">
		<div class="row">
			<div class="column">
				<br> <br>
				<h2 class="ui dividing header">
					ARC Semester II  2014 - 2015 Registration<a class="anchor" id="types"></a>
				</h2>
			</div>
		</div>

		<div class="row">
			<div class="column">
				<div id="loginform" class="ui form segment">
					<p>Let's go ahead and get you signed up.</p>
					<div class="field">
						<label>Username</label> <input placeholder="2014**PS***G"
							name="username" type="text">
					</div>
					<div class="field">
						<label>Password</label> <input type="password" name="password">
					</div>
					<div class="ui blue submit button">Submit</div>
				</div>
			</div>
		</div>
		
				<div class="row">
			<div class="center aligned column" >
				<div class="ui blue huge statistic ">
  <div class="value" id="regCount">
    <%=as %>
  </div>
  <div class="label">
    Registered So far ! ! 
  </div>
</div>

			</div>
		</div>

	</div>

</body>
<script src="STATIC_ASSETS/main.js"></script>
<script type="text/javascript">

var delay = 30000; 

 setInterval(function(){ 
	 $.ajax({ type: 'POST', url: '/arc/RegData', success: onDataReceived });
	   function onDataReceived(response) {
		   
		   $('#regCount').html(response) ;
	   }
	 
 }, delay);


</script>
</html>