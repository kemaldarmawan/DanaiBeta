<%@ page import="com.danai.model.User"  %>
	<header class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          	<a href="<c:url value='/ ' />">
				<img alt="Danai.Com" src="http://i1216.photobucket.com/albums/dd370/farisghani/danai-logo_zpsf671911f.png~original" height="44px">
			</a>
          <!-- <a class="navbar-brand" href="#">Danai</a> -->
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="<c:url value='/ ' />">Home</a></li>
            <li><a href="<c:url value='/discover' />">Discover</a></li>
            <li><a href="<c:url value='/start' />">Start</a></li>
          </ul>
          <form id="searchForm" action="<c:url value='/search' />" class="nav navbar-form navbar-left"  method="GET">
          	<div class="right-inner-addon">
          		<input type="text" placeholder="Search Project" class="form-control" name="s" />
          		<i class="glyphicon glyphicon-search"></i>
          	</div>
          </form>
          <ul class="nav navbar-nav navbar-right">
          	<%
          		User user = (User) request.getSession().getAttribute("user");
          		if (user == null){
          			out.println("<li><a href='/app/register'><span class='glyphicon glyphicon-pencil'></span> Register</a></li>");
          			out.println("<li><a href='/app/login'><span class='glyphicon glyphicon-log-in'></span> Log In</a></li>");
          		}
          		else {
          			out.println("<li><a href='/app/dashboard'><span class='glyphicon glyphicon-user'></span> "+user.getUsername()+"</a></li>");
          			out.println("<li><a href='/app/logout'><span class='glyphicon glyphicon-log-out'></span> Log Out</a></li>");
          		}
          	%>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </header>