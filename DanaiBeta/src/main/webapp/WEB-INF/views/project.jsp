<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ include file="prefix.jsp" %>
<%@ page import="com.danai.model.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Danai - Project</title>
</head>
<body>
	<%@ include file="header.jsp" %>
  	<div class="container">
  		<h1>&nbsp;</h1>
  		<h1>${project.title}</h1>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
			<li><a href="#comment" data-toggle="tab">Comment</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<div class="row">
					<div class="container">
						<div class="col-md-8">
							<div class="row">
								<img src="<c:url value="/resources/photos/projects/"/>${project.projectId}.png" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/projects/0.png"/>';" class="img-thumbnail" style="height:450px;width:800px">
							</div>
							
							<div>&nbsp;</div>
							<div class="row">
								${project.description}
							</div>
						</div>
						<div class="col-md-2">
							<div class="row">
								<div class="container">
									<h1>${project.fundedNumber}</h1>
									<p>backers</p>
								</div>
								<div class="container">
									<h1><fmt:formatNumber value="${project.currentFund}" minFractionDigits="0"  type="currency"/></h1>
									<p>pledged of goal</p>
								</div>
								<div class="container">
									<h1>${f:daysUntilToday(project.lastDate)}</h1>
									<p>days to go</p>
								</div>
								<div class="container">
									<h1>&nbsp;</h1>
									<%
						          		User iuser = (User) request.getSession().getAttribute("user");
						          		Project project = (Project) request.getSession().getAttribute("projectId");
										if (iuser != null && iuser.getUserId() != project.getUser().getUserId()){
						          			out.println("<a href='donation'><input type='submit' value='Donation' class='btn btn-primary' /></a>");
						          		}
						          	%>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			<div class="tab-pane fade" id="comment">
				<table class="table table-hover">
									<tr>
									<th></th>
									<th>Username</th>
									<th>Comment</th>
									</tr>
									<c:forEach items="${comment}" var="com">
									<tr>
										<td><img src="<c:url value="/resources/photos/users/"/>${com.user.userId}.png" alt="Image not found" onError="this.onerror=null;this.src='<c:url value="/resources/photos/users/0.png"/>';" class="img-thumbnail" style="height:50px;width:50px"></td>
										<td>${com.user.username}</td>
										<td>${com.content}</td>
									</tr>
									</c:forEach>
				</table>
				<div class="row">
				<div class="col-md-3 col-md-offset-1">
					<form:form action="insertcomment.do" method="POST" commandName="addcomment">
						<div class="row">
							<div class="form-group">
								<label for="content">Add Comment</label>
								<form:input cssClass="form-control" path="content" placeholder="Add Comment"/>
								<form:errors path="content"></form:errors>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<input type="submit" value="Submit" class="btn btn-primary"/>	
							</div>
						</div>
					</form:form>
				</div>
				</div>
  	</div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
</body>
</html>