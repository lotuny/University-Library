<%@ page contentType="text/html; charset=utf-8" %>
<%
String userID = "";
String password = "";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login System</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">

            <nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
				    <a class="navbar-brand" href="../index.jsp">Library System</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="../index.jsp">Index</a>
						</li>
						<li>
							 <a href="../index.jsp">Introduction</a>
						</li>
					</ul>

                    <form class="navbar-form navbar-left" action="search.jsp" method="post" style="margin-left: 200px;" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" name="book_name"/>
                        </div> <button type="submit" class="btn btn-default">Search</button>
                    </form>
				</div>
			</nav>

			<form action="login_action.jsp" method="post" class="form-horizontal" role="form" style="width: 500px; height: 300px; margin-top: 200px; margin-left: 300px;; border-style: solid; padding: 60px 0 0 60px;">
				<div class="form-group col-sm-15">
					<label for="inputID" class="col-sm-2 col-sm-offset-1 control-label">ID</label>
					<div class="col-sm-5">
						<input type="text" name="userID" value="<%=userID%>" class="form-control" id="inputID"/>
					</div>
				</div>
				<div class="form-group col-sm-15">
					<label for="inputPassword" class="col-sm-2 col-sm-offset-1 control-label">Password</label>
					<div class="col-sm-5">
						<input type="password" name="password" value="<%=password%>" class="form-control" id="inputPassword"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10 col-sm-offset-3">
						<div class="checkbox">
							 <label><input type="checkbox" value="save" name="save_password"/>Remember me</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div>
						 <button type="submit" value="reader" name="login_type" class="btn btn-default col-sm-4" style="margin: 0px 25px;" onclick="window.location.href('personal_info.jsp')">Log in as reader</button>
						 <button type="submit" value="ad" name="login_type" class="btn btn-default col-sm-4" style="" onclick="window.location.href('manage.jsp')" >Log in as Ad</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>