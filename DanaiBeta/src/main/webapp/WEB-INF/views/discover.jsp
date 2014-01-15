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
	<div class="container">
		<h1>&nbsp;</h1>
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
	<%@ include file="staticJs.jsp" %>
</body>
</html>