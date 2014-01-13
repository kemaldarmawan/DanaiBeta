<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai---Home</title>
<script type="text/javascript">
	$('#myTab a:first').tab('show'); // Select first tab
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>&nbsp;</h1>
	
  	<div class="container">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#home" data-toggle="tab">Home</a></li>
		  <li><a href="#profile" data-toggle="tab">Profile</a></li>
		  <li><a href="#messages" data-toggle="tab">Messages</a></li>
		  <li><a href="#settings" data-toggle="tab">Settings</a></li>
		</ul>
		<div class="tab-content">
		  <div class="tab-pane fade in active" id="home">A</div>
		  <div class="tab-pane fade" id="profile">B</div>
		  <div class="tab-pane fade" id="messages">C</div>
		  <div class="tab-pane fade" id="settings">D</div>
		</div>
  	</div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>