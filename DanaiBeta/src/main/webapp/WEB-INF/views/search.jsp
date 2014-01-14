<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<h2><strong>Results for <small>"${res}"</strong></small></h2>
		</div>
		<div class="row">
			<div class="container">
				<c:forEach var="item" items="${result}">
					<div class="col-md-3" >
						<div class="panel panel-default" style="height:370px;">
	  						<div class="panel-body">
	  							<a href="#"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="100" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/1.png"/>';"></a>
								<a href="#"><strong><small>${item.title }</small></strong></a>
								<p><span class="glyphicon glyphicon-user"></span>&nbsp;<small> ${item.user.name }</small></p>
								<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
	    						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
	    						<div class="progress-preview">
									<div class="progress-bar progress-bar-success"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 + 1}%">
							  		</div>
								</div>
								<ul class="nav nav-pills nav-justified">
							  	  <c:set var="funded" ><fmt:parseNumber type="number" value="${(item.currentFund / item.minimalFund) * 100}" /></c:set>
								  <li><a title="funded" data-toggle="tooltip"><small><strong>${funded}%</strong></small></a></li>
								  <li><a title="pledged" data-toggle="tooltip"><small><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0"  type="currency"/></strong></small></a></li>
								</ul>
	  						</div>	
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">$('[data-toggle="tooltip"]').tooltip({'placement': 'top'});</script>
</body>
</html>