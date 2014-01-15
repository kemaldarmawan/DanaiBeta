<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Login</title>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="container">
		<h1>&nbsp;</h1>
		<c:choose>
			<c:when test="${not empty  eror}">
	    		<div class="alert alert-danger">
	    			<c:forEach items="${eror}" var="err">
	        		${err.defaultMessage}
	    			</c:forEach>
	    		</div>
			</c:when>
		</c:choose>
		<h1>Login</h1>
		<div class="well">
			<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<form:form action="login.do" method="POST" commandName="user">
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
								<input type="submit" value="Login" class="btn btn-primary"/>	
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