<%@ page import="javacode.Book" %>
<%@ page import="javacode.BookDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="javacode.MyDBConnection" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    request.setCharacterEncoding("utf-8");
    String book_name = (String)request.getParameter("book_name");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Searching System</title>
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

                    <form class="navbar-form navbar-left" action="#" method="post" style="margin-left: 200px;" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" name="book_name" placeholder="<%=book_name%>"/>
                        </div> <button type="submit" class="btn btn-default">Search</button>
                    </form>

                    <form class="navbar-form navbar-right" style="margin-right: 50px;">
                        <button type="button" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-user"></span> Login
                        </button>
                    </form>
                </div>
            </nav>

            <div class="row clearfix" style="margin-top: 80px;">
                <form>
                    <%
                        String coverPath = "../resources/default.png";
                        List<Book> books = BookDAO.getBooksByTitle(book_name);
                        for (int i = 0; i < books.size(); i++) {
                            if (books.get(i).getCoverPath() != null) {
                                MyDBConnection.init();
                                coverPath = basePath + "resources/books/" + books.get(i).getTitle() + ".jpg";
                            }%>
                        <div class="col-md-3 column">
                            <a href="book.jsp?bookID=<%=books.get(i).getBookID()%>"><img style="margin-top: 50px; width: 260px; height: 325px;" src="<%=coverPath%>"/></a>
                        </div>
                        <%}
                    %>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>