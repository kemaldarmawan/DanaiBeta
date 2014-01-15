<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="prefix.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="staticCss.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<h1>&nbsp;</h1>
		
		<div class="dropdown">
			<h4><strong>Show me</strong></h4>
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
      			${category.name }
      			<span class="caret"></span>
    		</button>
    		<ul class="dropdown-menu">
    			<c:forEach var="item" items="${categories}">
    				<li><a href='<c:url value="/discover/categories/"></c:url>${item.categoryId}'>${item.name}</a></li>
    			</c:forEach>
    		</ul>
    	</div>
    	<hr>
		
		<h3><strong>We found ${results.size()} projects</strong></h3>
		<hr>
		<div class="row">
			<div class="container">
				<c:forEach var="item" items="${results}">
					<div class="col-md-3" >
						<div class="panel panel-default" style="height:370px;box-shadow: 0 0 4px black;">
	  						<div class="panel-body">
	  							<a href="<c:url value="/project/${item.projectId }"></c:url>"><img src="<c:url value="/resources/photos/projects/"/>${item.projectId}.png" class="img-rounded" height="100" width="100%" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/1.png"/>';"></a>
								<a href="<c:url value="/project/${item.projectId }"></c:url>"><strong><small>${item.title }</small></strong></a>
								<p><span class="glyphicon glyphicon-user"></span>&nbsp;<small> ${item.user.name }</small></p>
								<div class="well well-sm" style="height:100px"><small>${item.description }</small></div>
	    						<small><span class="glyphicon glyphicon-map-marker"></span>&nbsp; ${item.location.city}, ${item.location.province}</small>
	    						<div class="progress-preview">
									<c:choose>
										<c:when test="${f:daysUntilToday(item.lastDate) == 0 && (item.currentFund / item.minimalFund) < 1}">
											<div class="progress-bar progress-bar-danger"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 + 1}%">
							  				</div>
										</c:when>
										<c:otherwise >
											<div class="progress-bar progress-bar-success"  aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width:${item.currentFund / item.minimalFund * 100 + 1}%">
							  				</div>
										</c:otherwise>
									</c:choose>									
								</div>
								<ul class="nav nav-pills nav-justified">
							  	  <c:set var="funded" ><fmt:parseNumber type="number" value="${(item.currentFund / item.minimalFund) * 100}" /></c:set>
								  <li><a title="funded" data-toggle="tooltip"><small><strong>${funded}%</strong></small></a></li>
								  <li><a title="pledged" data-toggle="tooltip"><small><strong><fmt:formatNumber value="${item.currentFund}" minFractionDigits="0" currencySymbol="$" type="currency"/></strong></small></a></li>
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
	</div>
	<%@ include file="staticJs.jsp"%>
	
</body>
</html>