<%@ page import="javacode.MyDBConnection" %>
<%@ page import="javacode.Utils" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Log in...</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<%
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    String userID = (String)request.getParameter("userID");
    String passWord = (String)request.getParameter("password");
    String checkBox = request.getParameter("save_password");
    String login_type = request.getParameter("login_type");
    boolean login_test = false;

    try {
        MyDBConnection.init();
        if (login_type.equals("reader")) {
            login_test = Utils.readerCheck(userID, passWord);
        } else if (login_type.equals("ad")) {
            login_test = Utils.adCheck(userID, passWord);
        }

        if(login_test) {
            if ("save".equals(checkBox)) {
                String name = java.net.URLEncoder.encode(userID,"UTF-8");
                Cookie nameCookie = new Cookie("userID", name);
                nameCookie.setMaxAge(60 * 60 * 24 * 3); //Set valid time of Cookie for 3 days

                String pwd = java.net.URLEncoder.encode(passWord,"UTF-8");
                Cookie pwdCookie = new Cookie("password", pwd);
                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
                response.addCookie(nameCookie);
                response.addCookie(pwdCookie);
            }

            if (login_type.equals("reader")) {
                session.setAttribute("readerID", userID);
                request.setAttribute("userID", userID);
                request.getRequestDispatcher("personal_info.jsp").forward(request, response);
            } else if (login_type.equals("ad")){
                response.sendRedirect("manage.jsp");
            }
        }
        else{
            response.sendRedirect("login.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>