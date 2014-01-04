<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
	<link href="<c:url value="/resources/css/bootstrap-theme.css"/>" type="text/css" rel="stylesheet" />
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is. ${user.name} </P>
</body>
</html>
