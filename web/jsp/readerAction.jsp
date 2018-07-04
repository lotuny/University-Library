<%@ page import="javacode.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String renewID = request.getParameter("renew");
    String returnID = request.getParameter("return");

    String prompt;
%>

<html>

<head>
    <title>Reader operating...</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <%
        if (renewID != null) {
            if (Utils.renew(renewID))
                prompt = "Renew succeed!";
            else
                prompt = "Renew failed! A book can be renewed for only once.";
        } else {
            if (Utils.returnBook(returnID))
                prompt = "Return succeed!";
            else
                prompt = "Return failed!";
        }

        request.setAttribute("prompt", prompt);
        request.getRequestDispatcher("personal_info.jsp").forward(request, response);
    %>
</body>
</html>
