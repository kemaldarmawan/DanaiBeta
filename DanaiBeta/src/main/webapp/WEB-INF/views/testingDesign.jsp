<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai---Home</title>
<script type="text/javascript">
	$('#myTab a:first').tab('show'); // Select first tab
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div style="height: 300px; position: static; left: 0px; right: 0px;">
		<img src="http://i1216.photobucket.com/albums/dd370/farisghani/homepage_zps2f548a52.jpg~original" width="100%">
	</div>
	<h3>&nbsp;</h3>
	<div class="well well-sm">
	  	<div class="container">
	  		<div class="row">
	  			<div class="col-md-4">
	  				<br/>
					<ul class="nav nav-pills nav-stacked">
						<c:forEach var="item" items="${projectsByCategory}" varStatus="counter">
							<li class='<c:if test="${counter.count == 1}"><% out.print("active"); %></c:if>'><a href="#category${item.category.categoryId}" data-toggle="tab">${item.category.name }</a></li>
						</c:forEach>
					</ul>
				</div>
	  			<div class="col-md-7 col-md-offset-1">
					<div class="tab-content">
					<c:forEach var="item" items="${projectsByCategory}" varStatus="counter">
						<div class="tab-pane fade <c:if test="${counter.count == 1}"><% out.print("in active"); %></c:if>" id="category${item.category.categoryId }">
							<h3><strong>Staff Picks: ${item.category.name }</strong></h3>
							<div class="" >
								<div class="panel panel-default" style="height:300px">
			  						<div class="panel-body">
			  							<div class="row">
											<div class="col-md-6">
												<a href="#"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="200" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/1.png"/>';"></a>
											</div>
											<div class="col-md-6">
												<a href="#"><strong><small>${item.title }</small></strong></a>
												<p><span class="glyphicon glyphicon-user"></span>&nbsp;<small> ${item.user.name }</small></p>
												<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
					    						<p></p>
					    						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
					    						<p></p>
					    						<div class="progress-preview">
													<div class="progress-bar progress-bar-success"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 + 1}%"></div>
											  	</div>
											  	<ul class="nav nav-pills nav-justified">
											  	  <c:set var="funded" ><fmt:parseNumber type="number" value="${(item.currentFund / item.minimalFund) * 100}" /></c:set>
												  <li ><a title="funded" data-toggle="tooltip"><strong>${funded}%</strong></a></li>
												  <li ><a title="pledged" data-toggle="tooltip"><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0"  type="currency"/></strong></a></li>
												</ul>
											</div>
										</div>
			  						</div>
								</div>
							</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
	  	</div>
  	</div>
  	<hr>
  	<div class="container">
  		<h1><small><span class="glyphicon glyphicon-globe"></span></small><strong>&nbsp;Popular</strong></h1>
  		<hr>
  		<div class="row">
  			<div class="container">
	  			<c:forEach var="item" items="${projectsByPopular}">
					<div class="col-md-3" >
						<div class="panel panel-default" style="height:370px">
	  						<div class="panel-body">
	  							<a href="#"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="100" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/1.png"/>';"></a>
								<a href="#"><strong><small>${item.title }</small></strong></a>
								<p><span class="glyphicon glyphicon-user"></span>&nbsp;<small> ${item.user.name }</small></p>
								<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
	    						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
	    						<div class="progress-preview">
									<div class="progress-bar progress-bar-success"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 +1}%">
							  		</div>
								</div>
								<ul class="nav nav-pills nav-justified">
							  	  <c:set var="funded" ><fmt:parseNumber type="number" value="${(item.currentFund / item.minimalFund) * 100}" /></c:set>
								  <li><a title="funded" data-toggle="tooltip"><small><strong>${funded}%</strong></small></a></li>
								  <li ><a title="pledged" data-toggle="tooltip"><small><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0"  type="currency"/></strong></small></a></li>
								</ul>
	  						</div>	
						</div>
					</div>
				</c:forEach>
			</div>
  		</div>
  		<hr>
  	</div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>