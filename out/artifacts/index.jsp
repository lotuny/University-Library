<%@ page import="javacode.MyDBConnection" %>
<%@ page import="javacode.BookDAO" %>
<%@ page import="javacode.Reader" %>
<%@ page import="javacode.ReaderDAO" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String pic1;
    String pic2;
    String pic3;
    String pic4;

    String userID = (String) session.getAttribute("userID");
    Reader reader = null;
    if (userID != null)
        reader = ReaderDAO.getReaderByID(userID);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Index</title>
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
				    <a class="navbar-brand" href="#">Library System</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="#">Index</a>
						</li>
						<li>
							 <a href="#">Introduction</a>
						</li>
					</ul>

                    <form class="navbar-form navbar-left" action="jsp/search.jsp" method="post" style="margin-left: 200px;" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" name="book_name"/>
                        </div> <button type="submit" class="btn btn-default">Search</button>
                    </form>
                    <%
                        if (reader == null) {%>
                        <form class="navbar-form navbar-right log-in" style="margin-right: 50px;" action="jsp/login.jsp">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-user"></span> Log in
                            </button>
                        </form>
                        <%}
                    %>
                    <%
                        if (reader != null) {%>
                        <form class="navbar-form navbar-right log-out" style="margin-right: 50px; visibility: visible;" action="jsp/logout.jsp">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-user"></span> Log out
                            </button>
                        </form>
                        <%}
                    %>
				</div>
			</nav>

			<div class="jumbotron" style="margin-top: 80px;">
				<h1>
					Welcome to my Library System!
				</h1>
				<p>
					This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.
				</p>
			</div>
			<div class="carousel slide" id="carousel-903630">
				<ol class="carousel-indicators">
					<li class="active" data-slide-to="0" data-target="#carousel-903630">
					</li>
					<li data-slide-to="1" data-target="#carousel-903630">
					</li>
					<li data-slide-to="2" data-target="#carousel-903630">
					</li>
				</ol>
				<div class="carousel-inner" style="height: 320px;">
					<div class="item active">
						<img alt="" src="resources/news1.jpg" />
					</div>
					<div class="item">
						<img alt="" src="resources/news2.jpg" />
					</div>
					<div class="item">
						<img alt="" src="resources/news3.jpg" />
					</div>
				</div> <a class="left carousel-control" href="#carousel-903630" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> <a class="right carousel-control" href="#carousel-903630" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>

            <%
            MyDBConnection.init();
            pic1 = basePath + "resources/books/" + BookDAO.getBookByID("1").getTitle() + ".jpg";
            pic2 = basePath + "resources/books/" + BookDAO.getBookByID("2").getTitle() + ".jpg";
            pic3 = basePath + "resources/books/" + BookDAO.getBookByID("3").getTitle() + ".jpg";
            pic4 = basePath + "resources/books/" + BookDAO.getBookByID("4").getTitle() + ".jpg";
            %>

			<div class="row clearfix">
                <form action="jsp/book.jsp" method="post">
                    <div class="col-md-3 column">
                        <a href="jsp/book.jsp?bookID=<%=BookDAO.getBookByID("1").getBookID()%>"><img style="margin-top: 50px; width: 260px; height: 325px;" src="<%=pic1%>"/></a>
                    </div>
                    <div class="col-md-3 column">
                        <a href="jsp/book.jsp?bookID=<%=BookDAO.getBookByID("2").getBookID()%>"><img style="margin-top: 50px; width: 260px; height: 325px;" src="<%=pic2%>"/></a>
                    </div>
                    <div class="col-md-3 column">
                        <a href="jsp/book.jsp?bookID=<%=BookDAO.getBookByID("3").getBookID()%>"><img style="margin-top: 50px; width: 260px; height: 325px;" src="<%=pic3%>"/></a>
                    </div>
                    <div class="col-md-3 column">
                        <a href="jsp/book.jsp?bookID=<%=BookDAO.getBookByID("4").getBookID()%>"><img style="margin-top: 50px; width: 260px; height: 325px;" src="<%=pic4%>"/></a>
                    </div>
                </form>
            </div>

		</div>
	</div>

	</div>
	    <p style="margin: 100px;"><footer><h4 style="text-align: center;">Made by Li Zhuoling, 2015050556, CST</h4></footer></p>
    </div>
</div>
</body>
</html>
