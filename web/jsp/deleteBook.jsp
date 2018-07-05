<%@ page import="javacode.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String bookID = request.getParameter("bookID");
%>

<html>
<head>
    <title>Deleting book...</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
    Utils.deleteBook(bookID);
    response.sendRedirect("manage.jsp");
%>
</body>
</html>
