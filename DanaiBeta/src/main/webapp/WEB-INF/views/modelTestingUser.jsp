<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html lang="en">
<head>
	<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
	<title>Home</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<div class="container">
<h1>
	Hello world!
</h1>
<h1>Project</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>username</th>
	<th>name</th>
	<th>password</th>
	</tr>
	<tr>
		<td>${user.userId}</td>
		<td>${user.username}</td>
		<td>${user.name}</td>
		<td>${user.password}</td>
	</tr>
	</table>

</div>
</body>
</html>
