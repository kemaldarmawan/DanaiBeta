<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="prefix.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="staticCss.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Discover</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div style="position: static; left: 0px; right: 0px; width: 100%; height: 100%;">
		<img src="http://i1216.photobucket.com/albums/dd370/farisghani/discover-image_zpsa9850f68.jpg~original" width="100%">
	</div>
	<div class="container">
		<h1>&nbsp;</h1>
		<div class="col-md-9">
			<div class="row">
				<h3><span class="glyphicon glyphicon-thumbs-up"></span><strong>&nbsp;Staff Picks</strong></h3>
				<div class="container">
					<c:forEach var="item" items="${staffPicks}">
					<div class="col-md-3" >
						<div class="panel panel-default" style="height:370px;">
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
										<c:otherwise>
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
			<hr>
			<div class="row">
				<h3><span class="glyphicon glyphicon-globe"></span><strong>&nbsp;Popular</strong></h3>
				<div class="container">
					<c:forEach var="item" items="${populars}">
					<div class="col-md-3" >
						<div class="panel panel-default" style="height:370px;">
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
										<c:otherwise>
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
			<hr>
		</div>
		<div class="col-md-3">
          <div class="bs-sidebar hidden-print affix" role="complementary">
            <ul class="nav bs-sidenav">
            	<li class="disabled"><a href=""><strong>Categories</strong></a></li>
            	<c:forEach var="item" items="${categories }">
            		<li class=""><a href="<c:url value="/discover/categories/"></c:url>${item.categoryId}">${item.name}</a></li>
            	</c:forEach>
            </ul>
          </div>
        </div>
	</div>
	<div style="position: relative;"><%@ include file="footer.jsp" %></div>
	<%@ include file="staticJs.jsp" %>
</body>
</html>