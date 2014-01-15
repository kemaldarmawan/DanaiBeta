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
	<div style="position: static; left: 0px; right: 0px; width: 100%; height: 100%;">
		<img src="<c:url value="/resources/photos/start-image.jpg"></c:url>" width="100%" />
	</div>
  	<div class="container">
  		<c:choose>
			<c:when test="${not empty  eror}">
	    		<div class="alert alert-danger">
	    			<c:forEach items="${eror}" var="err">
	        		${err.defaultMessage}<br>
	    			</c:forEach>
	    		</div>
			</c:when>
		</c:choose>
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
										    <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="fileUploaded.file" accept="image/jpg,image/jpeg,image/png"></span>
										    <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
										  </div>
										</div>
									</div>
									
									</div>
								</div>
								<div class="row">
									<div class="form-group">
										<p>Project Name</p>
										<form:input cssClass="form-control" path="project.title"/>	
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
										<form:textarea cssClass="form-control" path="project.description"/>	
									</div>
								</div>
								
								<div class="row">
									<div class="form-group">
										<p>Project Location</p>
										<form:select path="project.location" >
											<c:forEach var="loc" items="${locations}">
												<form:option value="${loc.locationId}">${loc.city} , ${loc.province}</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
								
								<div class="row">
									<div class="form-group">
										<p>Minimal Fund</p>
										<form:input cssClass="form-control" path="project.minimalFund"/>
											
									</div>
								</div>

								<div class="row">
									<div class="form-group">
										<p>Last Date</p>
										<form:input cssClass="form-control" type="date" path="project.lastDate" />
									</div>
								</div>
								
 
								<div class="row">
									<div class="form-group">
										<p>Explanation</p>
										<form:textarea cssClass="form-control" path="project.explanation"/>	
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
  	
  	<div style="position: relative;"><%@ include file="footer.jsp" %></div>
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
    <script src="<c:url value="/resources/js/jasny-bootstrap.js"/>"></script>
</body>
</html>