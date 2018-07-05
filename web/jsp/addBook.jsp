<%@ page import="javacode.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String bookID = (String) request.getParameter("bookID");
    String coverPath = (String) request.getParameter("coverPath");
    String title = (String) request.getParameter("title");
    String author = (String) request.getParameter("author");
    String ISBN = (String) request.getParameter("ISBN");
    String description = (String) request.getParameter("description");

    String prompt = "Failed!";
%>

<html>
<head>
    <title>Adding Book...</title>
</head>
<body>
<%
    if (bookID.equals("") || title.equals("") || author.equals("") || ISBN.equals("") || description.equals("")) {
        prompt = "Please fill up all fields!";
    } else if (coverPath.equals("") && Utils.addBook(bookID,null,title,author,ISBN,description)) {
        prompt = "Succeed!";
    } else if (Utils.addBook(bookID,coverPath,title,author,ISBN,description)){
        prompt = "Succeed!";
    }

    request.setAttribute("addBookPrompt", prompt);
    request.getRequestDispatcher("manage.jsp").forward(request, response);
%>
</body>
</html>
