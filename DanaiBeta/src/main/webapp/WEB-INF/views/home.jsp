<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
	<link href="<c:url value="/resources/css/bootstrap-theme.css"/>" type="text/css" rel="stylesheet" />
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is. ${user.name} </P>

<h1>User for</h1>
<form:form action="user.do" method="POST" commandName="user">
	<table>
		<tr>
			<td>User ID</td>
			<td><form:input cssClass="input-xlarge" path="userId" /></td>
		</tr>
		<tr>
			<td>username</td>
			<td><form:input path="username" /></td>
		</tr>
		<tr>
			<td>password</td>
			<td><form:input path="password" /></td>
		</tr>
		<tr>
			<td>name</td>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<td>foto</td>
			<td><form:input path="foto" /></td>
		</tr>
		<tr>
			<td>bio</td>
			<td><form:input path="bio" /></td>
		</tr>
		
		<tr>
		<td colspan="2">
			<input type="submit" name="action" value="Add" />
			<input type="submit" name="action" value="Edit" />
			<input type="submit" name="action" value="Delete" />
			<input type="submit" name="action" value="Search" />
		</td>
		</tr>
	</table>
</form:form>
<br>
<table>
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
<table>
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
<table>
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
<table>
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
<table>
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
<table>
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
<table>
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


</body>
</html>
