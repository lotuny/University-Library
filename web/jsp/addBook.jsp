<%@ page import="javacode.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String bookID = request.getParameter("bookID");
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    String ISBN = request.getParameter("ISBN");

    String prompt;
%>

<html>
<head>
    <title>Adding Book...</title>
</head>
<body>
<%
    if (bookID.equals("") || title.equals("") || author.equals("") || ISBN.equals("")) {
        prompt = "Please fill up all fields!";
    } else {
        //Utils.addBook(bookID,title,author,ISBN);
        prompt = "Succeed!";
    }

    request.setAttribute("addReaderPrompt", prompt);
    request.getRequestDispatcher("manage.jsp").forward(request, response);
%>
</body>
</html>
