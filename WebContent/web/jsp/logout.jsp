<%@ page contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Log out...</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body onload="countdown()">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">

                <div class="jumbotron" style="margin-top: 80px; text-align: center;">
                    <h1>
                        Back in 2 seconds...
                    </h1>
                </div>

            </div>
        </div>
    </div>
</body>
</html>

<script>
    function countdown() {
        <%
            session.removeAttribute("userID");
            session.invalidate();
            response.setHeader("refresh","2;URL=../index.jsp") ;
        %>
    }

</script>