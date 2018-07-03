<%@ page import="java.util.List" %>
<%@ page import="javacode.Book" %>
<%@ page import="javacode.Utils" %>
<%@ page import="javacode.Reader" %>
<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Management</title>
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
                            <span class="glyphicon glyphicon-user"></span> Log out
                        </button>
                    </form>
				</div>
			</nav>

            <div class="jumbotron" style="margin-top: 80px;">
   				<h1>
					Hello, Administrator!
				</h1>
				<p>
					Help yourself and find out what you can manage.
				</p>
			</div>
			<div class="tabbable" id="tabs-755888">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-1" data-toggle="tab">Update books</a>
					</li>
					<li>
						 <a href="#panel-2" data-toggle="tab">Update readers</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-1">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Book ID</th>
									<th>Title</th>
									<th>Author</th>
									<th>ISBN</th>
								</tr>
							</thead>
							<tbody>
								<%
                                    List<Book> allBooks = Utils.getAllBooks();
                                    for (int i = 0; i < allBooks.size(); i++) {%>
                                        <tr>
                                            <td><%=allBooks.get(i).getBookID()%></td>
                                            <td><%=allBooks.get(i).getTitle()%></td>
                                            <td><%=allBooks.get(i).getAuthor()%></td>
                                            <td><%=allBooks.get(i).getISBN()%></td>
                                        </tr>
                                    <%}
                                %>
							</tbody>
						</table>
					</div>
					<div class="tab-pane" id="panel-2">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>Reader ID</th>
                                <th>Reader name</th>
                                <th>Age</th>
                                <th>Gender</th>
                                <th>Contact</th>
                                <th>Role</th>
                                <th>Max Num of Books</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Reader> allReaders = Utils.getAllReaders();
                                for (int i = 0; i < allReaders.size(); i++) {%>
                                    <tr>
                                        <td><%=allReaders.get(i).getId()%></td>
                                        <td><%=allReaders.get(i).getName()%></td>
                                        <td><%=allReaders.get(i).getAge()%></td>
                                        <td><%=allReaders.get(i).getGender()%></td>
                                        <td><%=allReaders.get(i).getTel()%></td>
                                        <td><%=allReaders.get(i).getRole()%></td>
                                        <td><%=allReaders.get(i).getMaxnum()%></td>
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

</body>
</html>