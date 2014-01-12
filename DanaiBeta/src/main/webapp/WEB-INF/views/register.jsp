<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Daftar</title>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
</head>
<body>
	
	<div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
	     <div class="container">
	       <div class="navbar-header">
	         <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	           <span class="sr-only">Toggle navigation</span>
	           <span class="icon-bar"></span>
	           <span class="icon-bar"></span>
	           <span class="icon-bar"></span>
	         </button>
	         <a class="navbar-brand" href="#">Danai</a>
	       </div>
	       <div class="navbar-collapse collapse">
	         <ul class="nav navbar-nav">
	           <li class="active"><a href="#">Home</a></li>
	           <li><a href="#">Projects</a></li>
	           <li><a href="#"></a></li>
	         </ul>
	         <ul class="nav navbar-nav navbar-right">
	           <li><a href="#">Sign Up</a></li>
	           <li><a href="#">Log In</a></li>
	         </ul>
	       </div><!--/.nav-collapse -->
	     </div>
	   </div>
	
	<div class="container">
		<h1>&nbsp;</h1>
		<h1>Sign Up</h1>
		<div class="well">
			<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<form:form action="register.do" method="POST" commandName="user">
						<div class="row">
							<div class="form-group">
								<label for="name">Nama Lengkap</label>
								<form:input cssClass="form-control" path="name" placeholder="Nama Lengkap"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label for="username">Username</label>
								<form:input cssClass="form-control" path="username" placeholder="Username"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label for="password">Password</label>
								<form:input type="password" cssClass="form-control" path="password" placeholder="Password"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label for="password">Confirm Password</label>
								<input type="password" class="form-control" placeholder="Confirm Password"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label for="bio">Biodata</label>
								<form:textarea cssClass="form-control" path="bio" placeholder="Biodata"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<input type="submit" value="Daftar" class="btn btn-success"/>	
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>