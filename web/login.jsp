<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<%@ page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<body>
<body>
<div class="wrapper container">
    <header><nav class="navbar navbar-light bg-faded">
        <a class="navbar-brand" href="#">Contact List</a>

    </nav></header>

    <form method="post" action="index.jsp">
        <h1>Sign In</h1>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Login:</label>
            <div class="col-xs-10">
                <input class="form-control" type="text" name="login">
            </div>
        </div>
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Password:</label>
            <div class="col-xs-10">
                <input class="form-control" type="text" name="password">
            </div>
        </div>
        <br><br>
        <td><button type="Submit" class="btn btn-success" value="Login">Login</button></td>
    </form>

</div>
</body>
</body>