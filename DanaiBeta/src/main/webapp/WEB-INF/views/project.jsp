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
<title>Danai - Project</title>
</head>
<body>
	<%@ include file="header.jsp" %>
  	<div class="container">
  		<h1>&nbsp;</h1>
  		<h1>Project</h1>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
			<li><a href="#comment" data-toggle="tab">Comment</a></li>
		</ul>
		
		<div class="tab-pane fade in active" id="home">
			<img src="<c:url value="/resources/photos/projects/"/>${com.project.projectId}.png" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/projects/0.png"/>';" class="img-thumbnail" style="height:450px;width:800px">
			<div>&nbsp;</div>
			${project.description}
		</div>
		
		<div class="tab-pane fade" id="comment">
			<table class="table table-hover">
								<tr>
								<th></th>
								<th>Username</th>
								<th>Comment</th>
								</tr>
								<c:forEach items="${comment}" var="com">
								<tr>
									<td><img src="<c:url value="/resources/photos/users/"/>${com.user.userId}.png" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/0.png"/>';" class="img-thumbnail" style="height:50px;width:50px"></td>
									<td>${com.user.username}</td>
									<td>${com.content}</td>
								</tr>
								</c:forEach>
			</table>
		</div>
  	</div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>