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

<P>  The time on the server is. ${user.name} </P>

	<div class="container">
		<h1>User </h1>
			<form:form action="user.do" method="POST" commandName="user">
				<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="username">username</label>
						<form:input  cssClass="form-control" path="username" id="username"/>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="password">password</label>
						<form:password cssClass="form-control" path="password" id="password"/>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="name">name</label>
						<form:input cssClass="form-control" path="name" id="name"/>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="foto">foto</label>
						<form:input cssClass="form-control" path="foto" id="foto"/>
					</div>
				</div>
				</div>
				<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label for="bio">bio</label>
						<form:textarea cssClass="form-control" path="bio"  id="bio"/>
					</div>
				</div>
				</div>

				<input type="submit" class="btn btn-success" name="action" value="Add" />
				<input type="submit" class="btn btn-info" name="action" value="Edit" />
				<input type="submit" class="btn btn-danger" name="action" value="Delete" />
				<input type="submit" class="btn btn-primary" name="action" value="Search" />
			</form:form>
	</div>
<br>
<table class="table table-hover table-bordered">
	<tr>
	<th>ID</th>
	<th>username</th>
	<th>password</th>
	<th>name</th>
	<th>foto</th>
	<th>bio</th>
	</tr>
	<c:forEach items="${userList}" var="user">
	<tr>
		<td>${user.userId}</td>
		<td>${user.username}</td>
		<td>${user.password}</td>
		<td>${user.name}</td>
		<td>${user.foto}</td>
		<td>${user.bio}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h1>created project for user 1</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>location</th>
	<th>username</th>
	<th>category</th>
	<th>title</th>
	<th>last date</th>
	</tr>
	<c:forEach items="${createdProjectList}" var="project">
	<tr>
		<td>${project.projectId}</td>
		<td>${project.location.city}</td>
		<td>${project.user.name}</td>
		<td>${project.category.name}</td>
		<td>${project.title}</td>
		<td>${project.lastDate}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h1>Location</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>city</th>
	<th>province</th>
	</tr>
	<c:forEach items="${locationList}" var="location">
	<tr>
		<td>${location.locationId}</td>
		<td>${location.city}</td>
		<td>${location.province}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h1>Category</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>name</th>
	</tr>
	<c:forEach items="${categoryList}" var="category">
	<tr>
		<td>${category.categoryId}</td>
		<td>${category.name}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h1>Project</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>location</th>
	<th>username</th>
	<th>category</th>
	<th>title</th>
	<th>last date</th>
	</tr>
	<c:forEach items="${projectList}" var="project">
	<tr>
		<td>${project.projectId}</td>
		<td>${project.location.city}</td>
		<td>${project.user.name}</td>
		<td>${project.category.name}</td>
		<td>${project.title}</td>
		<td>${project.lastDate}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h1>Fund for project 1</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>username</th>
	<th>value</th>
	</tr>
	<c:forEach items="${fundProjectList}" var="fund">
	<tr>
		<td>${fund.fundId}</td>
		<td>${fund.user.name}</td>
		<td>${fund.value}</td>
		<td>${fund.project.title}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h1>Comment for project 1</h1>
<table class="table table-bordered">
	<tr>
	<th>ID</th>
	<th>username</th>
	<th>content</th>
	</tr>
	<c:forEach items="${commentProjectList}" var="comment">
	<tr>
		<td>${comment.commentId}</td>
		<td>${comment.user.name}</td>
		<td>${comment.content}</td>
	</tr>
	</c:forEach>
</table>

</div>
</body>
</html>
