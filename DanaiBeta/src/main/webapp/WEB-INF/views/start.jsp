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
<title>Danai - Start Making Your Project..</title>
<link href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
<link href="<c:url value="/resources/css/jasny-bootstrap.css"/>" type="text/css" rel="stylesheet" />
</head>
<body>
	<%@ include file="header.jsp" %>
  	<div class="container">
  		<h1>&nbsp;</h1>
  		<div align="center">
  		<h1>
  			"A way for every creative
			<br>
			person to control their destiny"
  		</h1>
  		</div>
  		<div align="center">
  			<h1>Meet your new project.</h1>
  			<p>Start by giving it a name, a pic, and other important details.</p>
  		</div>
		<div class="well">
					<div class="row">
						<div class="col-md-3 col-md-offset-1">
							<form:form method="post" commandName="project" action="insertdata.do" enctype="multipart/form-data">
								<div class="row">
									<div class="form-group">
									   <div class="fileinput fileinput-new" data-provides="fileinput">
									   	  <p>Project Image</p>
										  <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 950px; height: 150px;"></div>
										  <div>
										  	<div>
										    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="fileUploaded.file"></span>
										    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										  </div>
										</div>
									</div>
									<form:errors path="file"></form:errors>
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<p>Project Name</p>
										<form:input path="project.title"/>	
									</div>
								</div>
								
								<div class="row">
									<div class="form-group">
										<p>Category</p>
										<form:select path="project.category" items="${categories}"
										itemLabel="name" itemValue="categoryId">
										</form:select>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group">
										<p>Description</p>
										<form:textarea path="project.description"/>	
									</div>
								</div>
								
								<div class="row">
									<div class="form-group">
										<p>Project Location</p>
										<form:select path="project.location" items="${locations}"
										itemLabel="city" itemValue="locationId">
										</form:select>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group">
										<p>Minimal Fund</p>
										<form:input path="project.minimalFund"/>
										<br><form:errors path="minimalFund"></form:errors>	
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<p>Last Date</p>
										<form:input type="date" path="project.lastDate" />
									</div>
								</div>
								
 
								<div class="row">
									<div class="form-group">
										<p>Explanation</p>
										<form:textarea path="project.explanation"/>	
									</div>
								</div>
								
								
								<div class="row">
									<div class="form-group">
									   <input type="submit" value="Publish" class="btn btn-success"/>	
									</div>
								</div>
							</form:form>
			  			</div>
			  		</div>
		</div>
  	</div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/resources/js/jasny-bootstrap.js"/>"></script>
</body>
</html>