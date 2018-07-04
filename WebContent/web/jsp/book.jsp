<%@ page import="javacode.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    request.setCharacterEncoding("utf-8");
    String bookID = (String)request.getParameter("bookID");
    Book book = BookDAO.getBookByID(bookID);

    String coverPath = "../resources/default.png";
    if (book.getCoverPath() != null) {
        MyDBConnection.init();
        coverPath = basePath + "resources/books/" + book.getTitle() + ".jpg";
    }

    String readerID = (String) session.getAttribute("readerID");
    Reader reader = null;
    if (readerID != null)
        reader = ReaderDAO.getReaderByID(readerID);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Information</title>
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
				    <a class="navbar-brand" href="/">Library System</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="/">Index</a>
						</li>
						<li>
							 <a href="/">Introduction</a>
						</li>
					</ul>

                    <form class="navbar-form navbar-left" action="search.jsp" method="post" style="margin-left: 200px;" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" name="book_name" placeholder="input key word"/>
                        </div> <button type="submit" class="btn btn-default">Search</button>
                    </form>

                    <%
                        if (reader == null) {%>
                        <form class="navbar-form navbar-right" style="margin-right: 50px;" action="login.jsp">
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
                                <span class="glyphicon glyphicon-log-out"></span> Log out
                            </button>
                        </form>

                        <form class="navbar-form navbar-right" style="margin-right: 50px; visibility: visible;" action="jsp/personal_info.jsp">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-user"></span> Personal Center
                            </button>
                        </form>
                        <%}
                    %>
				</div>
			</nav>

		</div>
	</div>
	<div class="row clearfix" style="margin-top: 80px;">
		<div class="col-md-4 col-md-offset-1 column">
			<img style="width: 275px; height: 350px;" src="<%=coverPath%>" />
		</div>
		<div class="col-md-5 column">
			<h2>
				Title: <%=book.getTitle()%>
			</h2>
			<p>
				Author: <%=book.getAuthor()%>
			</p>
			<button type="submit" class="btn btn-default col-sm-2" onclick="tryBorrow()" >Borrow</button>
		</div>
		<div class="col-md-7 col-md-offset-2 column">
			<h2>
				Basic Information:
			</h2>
			<p style="line-height: 20pt; font-size: 0.5cm;">
				<%=book.getDescription()%>
			</p>
		</div>
	</div>
</div>

</body>
</html>

<script>
    function tryBorrow()
    {
        <%
            if (readerID == null) {
                %>alert("You need to log in first!");<%
            } else {
                Calendar calendar = Calendar.getInstance();
                int flag = Utils.borrowBook(bookID,readerID,new Date(calendar.getTime().getTime()));
                switch (flag) {
                    case 0:
                        %>alert("Succeed!");<%
                        break;
                    case 1:
                        %>alert("The book was lent!");<%
                        break;
                    case 2:
                        %>alert("You have run out of your permitted number!");<%
                }
            }
        %>
    }
</script>

<!--alert(Utils.borrowBook('<%=bookID%>','<%=readerID%>',new Date(calendar.getTime().getTime())));-->