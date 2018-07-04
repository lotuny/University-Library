<%@ page import="javacode.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String readerID = (String)request.getParameter("readerID");
    String name = (String)request.getParameter("name");
    String age = (String)request.getParameter("age");
    String gender = (String)request.getParameter("gender");
    String tel = (String)request.getParameter("tel");
    String role = (String)request.getParameter("role");
    String password = (String)request.getParameter("password");

    String prompt;
%>

<html>
<head>
    <title>Adding reader...</title>
</head>
<body>
    <%
        if (readerID.equals("") || name.equals("") || age.equals("") || gender.equals("") || tel.equals("") || role.equals("") || password.equals("")) {
            prompt = "Please fill up all fields!";
        } else {
            Utils.addReader(readerID, name, Integer.parseInt(age), gender, tel, role, password);
            prompt = "Succeed!";
        }

        request.setAttribute("addReaderPrompt", prompt);
        request.getRequestDispatcher("manage.jsp").forward(request, response);
    %>
</body>
</html>
