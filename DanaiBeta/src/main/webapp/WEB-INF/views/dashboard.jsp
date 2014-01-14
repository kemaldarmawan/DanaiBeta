<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Dashboard</title>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<link href="<c:url value="/resources/css/jasny-bootstrap.css"/>" type="text/css" rel="stylesheet" />
<script>
function validatePassword()
{
	var x = document.getElementById("pass").value;
	var y = document.getElementById("confirmpass").value;
	if (x != y){
		document.getElementById("confirm.errors").innerHTML = "Password tidak sama.";
		return false;
	}
}
function validateImage()
{
	var f = document.getElementById("inputfile");
    if( ""==f.value){
    	return false;
    }
}
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="container">
		<h1>&nbsp;</h1>
		<c:choose>
			<c:when test="${not empty  eror}">
	    		<div class="alert alert-danger">
	    			<c:forEach items="${eror}" var="err">
	        		${err.defaultMessage}<br>
	    			</c:forEach>
	    		</div>
			</c:when>
		</c:choose>
		<h1>Dashboard</h1>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
			<li><a href="#changepass" data-toggle="tab">Change Password</a></li>
			<li><a href="#pict" data-toggle="tab">Change Avatar</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="profile">
				<div class="well">
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
							<form:form action="update.do" method="POST" commandName="user">
								<div class="row">
									<div class="form-group">
										<img src="<c:url value="/resources/photos/users/"/>${user.userId}.png" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/0.png"/>';" class="img-thumbnail" style="height:200px;width:200px">
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="name">Full Name</label>
										<form:input cssClass="form-control" path="name" placeholder="Full Name"/>
										<form:errors path="name"></form:errors>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="username">Username</label>
										<form:input cssClass="form-control" path="username" placeholder="Username" readonly="true"/>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="bio">Biodata</label>
										<form:textarea cssClass="form-control" path="bio" placeholder="Biodata"/>
										<form:errors path="bio"></form:errors>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<input type="submit" value="Update Profile" class="btn btn-success"/>	
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="changepass">
				<div class="well">
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
							<form:form action="changepass.do" method="POST" commandName="user" onsubmit="return validatePassword()">
								<div class="row">
									<div class="form-group">
										<label for="password">Change Password</label>
										<form:input id="pass" type="password" cssClass="form-control" path="password" placeholder="Password"/>
										<form:errors path="password"></form:errors>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="password">Confirm Change Password</label>
										<input id="confirmpass" type="password" class="form-control" placeholder="Confirm Password"/>
										<span id="confirm.errors"></span>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<input type="submit" value="Change Password" class="btn btn-success"/>	
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="pict">
				<div class="well">
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
							<form:form method="post" enctype="multipart/form-data" commandName="file" action="changeimage.do" onsubmit="return validateImage()">  
							   <div class="row">
									<div class="form-group">
									   <div class="fileinput fileinput-new" data-provides="fileinput">
										  <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
										  <div>
										    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input id="inputfile" type="file" name="file" accept="image/jpg,image/jpeg,image/png"></span>
										    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										  </div>
										</div>
									</div>
									<p>Ukuran file tidak melebihi 1 MB</p>
									<form:errors path="file"></form:errors>
								</div>
								<div class="row">
									<div class="form-group">
									   <input type="submit" value="Change Avatar" class="btn btn-success"/>	
									</div>
								</div>
							</form:form>
			  			</div>
			  		</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<h1>Created Project by ${user.name}</h1>
		<table class="table table-bordered">
			<tr>
			<th>ID</th>
			<th>Location</th>
			<th>Username</th>
			<th>Category</th>
			<th>Title</th>
			<th>Last Date</th>
			</tr>
			<c:forEach items="${createdProject}" var="project">
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
	</div>
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jasny-bootstrap.js"/>"></script>
</body>
</html>