<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<h3>&nbsp;</h3>
	<div class="well well-sm">
  	<div class="container">
  		<div class="row">
  			<div class="col-md-3">
  				<br/>
				<ul class="nav nav-pills nav-stacked">
					<c:forEach var="item" items="${projectsByCategory}" varStatus="counter">
						<li class='<c:if test="${counter.count == 1}"><% out.print("active"); %></c:if>'><a href="#category${item.category.categoryId}" data-toggle="tab">${item.category.name }</a></li>
					</c:forEach>
				</ul>
			</div>
  			<div class="col-md-6 col-md-offset-2">
				<div class="tab-content">
				<c:forEach var="item" items="${projectsByCategory}" varStatus="counter">
					<div class="tab-pane fade <c:if test="${counter.count == 1}"><% out.print("in active"); %></c:if>" id="category${item.category.categoryId }">
						<h3>Staff Picks: ${item.category.name }</h3>
						<div class="" >
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
					</div>
				</c:forEach>
				</div>
			</div>
			
		</div>
  	</div>
  	</div>
  	<hr>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>