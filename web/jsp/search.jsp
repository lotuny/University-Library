<%@ page import="javacode.Book" %>
<%@ page import="javacode.BookDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="javacode.Reader" %>
<%@ page import="javacode.ReaderDAO" %>
<%@ page import="javacode.MyDBConnection" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    request.setCharacterEncoding("utf-8");
    String book_name = (String)request.getParameter("book_name");

    String readerID = (String) session.getAttribute("readerID");
    Reader reader = null;
    if (readerID != null)
        reader = ReaderDAO.getReaderByID(readerID);
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
                        <form class="navbar-form navbar-right log-out" style="margin-right: 50px; visibility: visible;" action="logout.jsp">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-log-out"></span> Log out
                            </button>
                        </form>

                        <form class="navbar-form navbar-right" style="margin-right: 50px; visibility: visible;" action="personal_info.jsp">
                            <button type="submit" class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-user"></span> Personal Center
                            </button>
                        </form>
                        <%}
                    %>
                </div>
            </nav>

            <div class="row clearfix" style="margin-top: 80px;">
                <form>
                    <%
                        List<Book> books = BookDAO.getBooksByTitle(book_name);
                        for (int i = 0; i < books.size(); i++) {
                            String coverPath = "../resources/books/default.png";
                            if (books.get(i).getCoverPath() != null) {
                                coverPath = basePath + "resources/books/" + books.get(i).getTitle() + ".jpg";
                            }%>
                        <div class="col-md-3 column">
                            <a href="book.jsp?bookID=<%=books.get(i).getBookID()%>"><img style="margin-top: 50px; width: 260px; height: 325px;" src="<%=coverPath%>"/></a>
                            <h3 style="text-align: center;"><%=books.get(i).getTitle()%></h3>
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