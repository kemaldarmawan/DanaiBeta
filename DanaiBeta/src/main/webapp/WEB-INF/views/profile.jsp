<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="prefix.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Profile</title>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<link href="<c:url value="/resources/css/jasny-bootstrap.css"/>" type="text/css" rel="stylesheet" />
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="container">
		<h1>&nbsp;</h1>
		<h1>${user.name}'s Profile</h1>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
			<li><a href="#project" data-toggle="tab">Created Project by ${user.name}</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="profile">
				<div class="well">
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
								<div class="row">
									<div class="form-group">
										<img src="<c:url value="/resources/photos/users/"/>${user.userId}.png" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/0.png"/>';" class="img-thumbnail" style="height:200px;width:200px">
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="name">Full Name : </label>
										<label for="name">${user.name}</label>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="username">Username : </label>
										<label for="name">${user.username}</label>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<label for="bio">Biodata : </label>
										<label for="name">${user.bio}</label>
									</div>
								</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="project">
				<div class="well">
					<c:choose>
						<c:when test="${not empty user.createdProject}">
							<div class="row">
								<div class="container">
									<c:forEach var="item" items="${user.createdProject}">
										<div class="col-md-3" >
											<div class="panel panel-default" style="height:370px;">
							 						<div class="panel-body">
							 							<a href="/app/project/${item.projectId}"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="100" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/projects/0.png"/>';"></a>
													<a href="/app/project/${item.projectId}"><strong><small>${item.title }</small></strong></a>
													<p><span class="glyphicon glyphicon-user"></span>&nbsp;<small> ${item.user.name }</small></p>
													<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
							   						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
							   						<div class="progress-preview">
														<c:choose>
															<c:when test="${f:daysUntilToday(item.lastDate) == 0 && (item.currentFund / item.minimalFund) < 1}">
																<div class="progress-bar progress-bar-danger"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 + 1}%">
												  				</div>
															</c:when>
															<c:otherwise>
																<div class="progress-bar progress-bar-success"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 + 1}%">
												  				</div>
															</c:otherwise>
														</c:choose>									
													</div>
													<ul class="nav nav-pills nav-justified">
												  	  <c:set var="funded" ><fmt:parseNumber type="number" value="${(item.currentFund / item.minimalFund) * 100}" /></c:set>
													  <li><a title="funded" data-toggle="tooltip"><small><strong>${funded}%</strong></small></a></li>
													  <li><a title="pledged" data-toggle="tooltip"><small><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0"  type="currency"/></strong></small></a></li>
													  <c:if test="${f:daysUntilToday(item.lastDate) == 0 && (item.currentFund / item.minimalFund) < 1}">
													  	<li><a title=""><small><strong><span class="label label-danger">Unsuccessful</span></strong></strong></small></a></li>
													  </c:if>
													  <c:if test="${f:daysUntilToday(item.lastDate) == 0 && (item.currentFund / item.minimalFund) >= 1}">
													  	<li><a title=""><small><strong><span class="label label-success">Funded</span></strong></small></a></li>
													  </c:if>
													  <c:if test="${f:daysUntilToday(item.lastDate) > 0}">
													  	<li><a title="days to go"><small><strong>${f:daysUntilToday(item.lastDate)}</strong></small></a></li>
													  </c:if>
													</ul>
							 						</div>	
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:when test="${empty user.createdProject}">
				    		<div class="alert alert-info">
				    			${user.name} haven't created any projects.
				    		</div>
				    		</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
	<script src="<c:url value="/resources/js/jasny-bootstrap.js"/>"></script>
</body>
</html>