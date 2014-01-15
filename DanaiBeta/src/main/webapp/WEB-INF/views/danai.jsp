<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://danai.com/functions" prefix="f" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Home</title>
<script type="text/javascript">
	$('#myTab a:first').tab('show'); // Select first tab
</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div style="position: static; left: 0px; right: 0px; width: 100%; height: 100%;">
		<img src="<c:url value="/resources/photos/homepage-image.jpg"></c:url>" width="100%" />
	</div>
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
												<a href="<c:url value="/project/${item.projectId}"></c:url>"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="200" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/1.png"/>';"></a>
											</div>
											<div class="col-md-6">
												<a href="<c:url value="/project/${item.projectId }"></c:url>"><strong><small>${item.title }</small></strong></a>
												<p><span class="glyphicon glyphicon-user"></span>&nbsp;<a href="<c:url value="/profile/${item.user.userId }"></c:url>"><small> ${item.user.name }</small></a></p>
												<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
					    						<p></p>
					    						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
					    						<p></p>
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
												  <li><a title="funded" data-toggle="tooltip"><strong>${funded}%</strong></a></li>
												  <li><a title="pledged" data-toggle="tooltip"><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0" currencySymbol="$" type="currency"/></strong></a></li>
												  <c:if test="${f:daysUntilToday(item.lastDate) == 0 && (item.currentFund / item.minimalFund) < 1}">
												  	<li><a title=""><strong><span class="label label-danger">Unsuccessful</span></strong></strong></small></a></li>
												  </c:if>
												  <c:if test="${f:daysUntilToday(item.lastDate) == 0 && (item.currentFund / item.minimalFund) >= 1}">
												  	<li><a title=""><strong><span class="label label-success">Funded</span></strong></a></li>
												  </c:if>
												  <c:if test="${f:daysUntilToday(item.lastDate) > 0}">
												  	<li><a title="days to go"><strong>${f:daysUntilToday(item.lastDate)}</strong></a></li>
												  </c:if>
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
	  							<a href="<c:url value="/project/${item.projectId }"></c:url>"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="100" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/1.png"/>';"></a>
								<a href="<c:url value="/project/${item.projectId }"></c:url>"><strong><small>${item.title }</small></strong></a>
								<p><span class="glyphicon glyphicon-user"></span>&nbsp;<a href="<c:url value="/profile/${item.user.userId }"></c:url>"><small> ${item.user.name }</small></a></p>
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
								  <li ><a title="pledged" data-toggle="tooltip"><small><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0" currencySymbol="$"  type="currency"/></strong></small></a></li>
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
  		<hr>
  	</div>
	<div style="position: relative;"><%@ include file="footer.jsp" %></div>
  	<%@ include file="staticJs.jsp" %>
</body>
</html>