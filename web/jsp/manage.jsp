<%@ page import="java.util.List" %>
<%@ page import="javacode.Book" %>
<%@ page import="javacode.Utils" %>
<%@ page import="javacode.Reader" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%
    String bookID = "";
    String title = "";
    String author = "";
    String ISBN = "";

    String readerID = "";
    String name = "";
    String age = "";
    String gender = "";
    String tel = "";
    String role = "";
    String password = "";

    String addReaderPrompt = (String)request.getAttribute("addReaderPrompt");
    String addBookPrompt =  (String)request.getAttribute("addBookPrompt");
    String thePrompt = addReaderPrompt==null?addBookPrompt:addReaderPrompt;
%>

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
                            <span class="glyphicon glyphicon-log-out"></span> Log out
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

                        <div class="col-md-12 column">
                            <a id="modal-599523" href="#modal-container-599523" role="button" class="btn" data-toggle="modal"><button>Add Reader</button></a>

                            <div class="modal fade" id="modal-container-599523" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" >
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title">
                                                Please input information for reader:
                                            </h4>
                                        </div>
                                        <form action="addBook.jsp" method="post">
                                            <div>
                                                <div class="form-group">
                                                    <label for="inputBookID" style="margin-top: 5px;" class="col-sm-3 col-sm-offset-2 control-label">Book ID</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="bookID" value="<%=bookID%>" class="form-control" id="inputBookID"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputTitle" class="col-sm-3 col-sm-offset-2 control-label">Title</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="title" value="<%=title%>" class="form-control" id="inputTitle"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputAuthor" class="col-sm-3 col-sm-offset-2 control-label">Author</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="author" value="<%=author%>" class="form-control" id="inputAuthor"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputISBN" class="col-sm-3 col-sm-offset-2 control-label">ISBN</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="ISBN" value="<%=ISBN%>" class="form-control" id="inputISBN"/>
                                                    </div>
                                                </div>
                                                <div class="modal-footer form-group col-sm-15">
                                                    <button type="submit" class="col-sm-2 col-sm-offset-5" style="height: 50px; margin-top: 20px; font-size: 0.5cm;">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
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
                                <th>Operation</th>
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
                                        <td>
                                            <form action="deleteReader.jsp" method="post">
                                                <button type="submit" style="align-content: center;" name="readerID" value="<%=allReaders.get(i).getId()%>">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                <%}
                            %>
                            </tbody>
                        </table>

                        <div class="col-md-12 column">
                            <a id="modal-599524" href="#modal-container-599524" role="button" class="btn" data-toggle="modal"><button>Add Reader</button></a>

                            <div class="modal fade" id="modal-container-599524" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" >
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                Please input information for reader:
                                            </h4>
                                        </div>
                                        <form action="addReader.jsp" method="post">
                                            <div>
                                                <div class="form-group">
                                                    <label for="inputID" style="margin-top: 5px;" class="col-sm-3 col-sm-offset-2 control-label">Reader ID</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="readerID" value="<%=readerID%>" class="form-control" id="inputID"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputName" class="col-sm-3 col-sm-offset-2 control-label">Name</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="name" value="<%=name%>" class="form-control" id="inputName"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputAge" class="col-sm-3 col-sm-offset-2 control-label">Age</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="age" value="<%=age%>" class="form-control" id="inputAge"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputGender" class="col-sm-3 col-sm-offset-2 control-label">Gender</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="gender" value="<%=gender%>" class="form-control" id="inputGender"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputTelephone" class="col-sm-3 col-sm-offset-2 control-label">Telephone</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="tel" value="<%=tel%>" class="form-control" id="inputTelephone"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputRole" class="col-sm-3 col-sm-offset-2 control-label">Role</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="role" value="<%=role%>" class="form-control" id="inputRole"/>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-15">
                                                    <label for="inputPassword" class="col-sm-3 col-sm-offset-2 control-label">Password</label>
                                                    <div class="col-sm-5">
                                                        <input type="text" name="password" value="<%=password%>" class="form-control" id="inputPassword"/>
                                                    </div>
                                                </div>
                                                <div class="modal-footer form-group col-sm-15">
                                                    <button type="submit" class="col-sm-2 col-sm-offset-5" style="height: 50px; margin-top: 20px; font-size: 0.5cm;">Save</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

					</div>
				</div>
            </div>

		</div>


	</div>
</div>

<%
    if (thePrompt != null) {%>
    <div class="modal fade in" id="popup" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: block;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="closePopUp()">×</button>
                    <h4 class="modal-title">
                        Notice:
                    </h4>
                </div>
                <div class="modal-body">
                    <%=thePrompt%>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    <%}
%>

</body>
</html>

<script>
    function closePopUp() {
        var show = document.getElementById("popup");
        show.style.display = 'none';
    }
</script>