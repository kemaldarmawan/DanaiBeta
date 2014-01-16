<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="prefix.jsp" %>
<%@ page import="com.danai.model.User"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Donation</title>
</head>
<body>
	<%@ include file="header.jsp" %>
  	<div class="container">
  		<div align="center">
  			<h1>&nbsp;</h1>
  			<h1>${project.title}</h1>
  		</div>
  		
  		<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<form:form action="insertdonation.do" method="POST" commandName="fund">
						<div class="row">
							<div class="form-group">
								<label for="value">Put Your Donation here</label>
								<form:input cssClass="form-control" path="value" placeholder="Donation"/>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<input type="submit" value="Donate!" class="btn btn-primary"/>	
							</div>
						</div>
					</form:form>
				</div>
		</div>
  	</div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>