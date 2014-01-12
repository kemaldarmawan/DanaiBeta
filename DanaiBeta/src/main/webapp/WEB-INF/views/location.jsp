<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<title>Danai---Location</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
    
    <div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Danai</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<c:url value='/' />">Home</a></li>
            <li><a href="<c:url value='/' />">Projects</a></li>
          </ul>
          <form name="searchForm" id="searchForm" action="<c:url value='/search' />" class="nav navbar-form navbar-left" role="search" method="GET">
          	<div class="right-inner-addon">
          		<input type="text" placeholder="Search Project" class="form-control" name="s" />
          		<i class="glyphicon glyphicon-search"></i>
          	</div>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Sign Up</a></li>
            <li><a href="#">Log In</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
	<div class="container">
		<h1>Location</h1>
	    <br>
	    <div class="well">
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<form:form action="add" method="POST" commandName="location">
					<div class="row">
						<div class="form-group">
							<label for="city">City</label>
							<form:input cssClass="form-control" path="city"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label for="province">Province</label>
							<form:input cssClass="form-control" path="province"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<input type="submit" value="add location" class="btn btn-success">	
						</div>
					</div>
				</form:form>
			</div>
		</div>
		</div>
		<br>
		<table class="table table-hover" width="100">
			<tr class="warning">
				<th style="width:40%">City</th>
				<th style="width:40%">Province</th>
				<th style="width:10%"></th>
				<th style="width:10%"></th>
			</tr>
			<c:forEach items="${locations}" var="item">
				<tr >
					<td>${item.city}</td>
					<td>${item.province}</td>
					<td><a href="<c:url value="/admin/location/delete/${item.locationId}"/>">delete</a></td>
					<td><a href="">update</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>