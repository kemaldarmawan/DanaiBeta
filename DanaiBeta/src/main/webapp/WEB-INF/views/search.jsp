<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Search</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="staticJs.jsp" %>
	<div class="container">
		<h1>&nbsp;</h1>
		<div class="page-header">
			<h1>Result for <small>"${res}"</small></h1>
		</div>
		<div class="row">
			<div class="container">
				<c:forEach var="item" items="${result}">
					<div class="col-md-3" >
						<div class="panel panel-default" style="height:300px">
	  						<div class="panel-body">
								<a href="#"><strong><small>${item.title }</small></strong></a>
								<p><span class="glyphicon glyphicon-user"></span>&nbsp;<small> ${item.user.name }</small></p>
								<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
	    						<p></p>
	    						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
	    						<p></p>
	    						<div class="progress-preview">
									<div class="progress-bar progress-bar-success"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100}%">
							  		</div>
								</div>
	  						</div>	
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>