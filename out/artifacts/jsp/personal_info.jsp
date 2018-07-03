<%@ page import="java.util.List" %>
<%@ page import="javacode.*" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
    request.setCharacterEncoding("utf-8");

    String readerID = (String)session.getAttribute("readerID");
    Reader reader = ReaderDAO.getReaderByID(readerID);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Personal Page</title>
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
                    <a class="navbar-brand" href="../index.jsp">Library System</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="../index.jsp">Index</a>
                        </li>
                        <li>
                            <a href="../index.jsp">Introduction</a>
                        </li>
                    </ul>

                    <form class="navbar-form navbar-left" action="search.jsp" method="post" style="margin-left: 200px;" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" name="book_name"/>
                        </div> <button type="submit" class="btn btn-default">Search</button>
                    </form>

                    <form class="navbar-form navbar-right log-out" style="margin-right: 50px; visibility: visible;" action="logout.jsp">
                        <button type="submit" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-log-out"></span> Log out
                        </button>
                    </form>
                </div>
            </nav>

			<div class="jumbotron" style="margin-top: 80px;">
				<h1>
					Hello, <%=reader.getName()%>!
				</h1>
				<p>
					Here is your personal page. You can check your basic personal information and borrowing record.
				</p>
			</div>
            <div class="panel-group" id="panel-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-3" href="#panel-element-4">Personal Information</a>
					</div>
					<div id="panel-element-4" class="panel-collapse collapse in">
						<div class="panel-body" style="padding-left: 380px; font-size: 0.7cm">
                            <ul class="list-unstyled">
                                <li><label>Reader ID:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getId()%></span></li>
                                <li><label>Name:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getName()%></span></li>
                                <li><label>Age:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getAge()%></span></li>
                                <li><label>Gender:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getGender()%></span></li>
                                <li><label>Telephone num:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getTel()%></span></li>
                                <li><label>Role:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getRole()%></span></li>
                                <li><label>Max num of books:</label>&nbsp;&nbsp;&nbsp;<span><%=reader.getMaxnum()%></span></li>
                            </ul>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-3" href="#panel-element-5">Borrowing Record</a>
					</div>
					<div id="panel-element-5" class="panel-collapse collapse">
						<div class="panel-body">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>Book ID</th>
                                    <th>Title</th>
                                    <th>Lent time</th>
                                    <th>Deadline</th>
                                    <th>Fine</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Record> records = RecordDAO.getRecordsByReaderID(readerID);
                                    for (int i = 0; i < records.size(); i++) {%>
                                <tr>
                                    <td><%=records.get(i).getBookID()%></td>
                                    <td><%=records.get(i).getTitle()%></td>
                                    <td><%=records.get(i).getBegin()%></td>
                                    <td><%=records.get(i).getDeadline()%></td>
                                    <td><%=records.get(i).getFine()%></td>
                                </tr>
                                <%}
                                %>
                                </tbody>
                            </table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>