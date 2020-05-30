
<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<%@ page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="main.servlet.User" %>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");

    String dbName = "mysql";
    String dbUser = "root";
    String dbPassword = "123456789";

    String success = "alert alert-danger";
    String successText = "";

    ResultSet resultSet;
    Statement statement;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=false", dbUser, dbPassword);
        statement = connect.createStatement();
        resultSet = statement.executeQuery("SELECT * FROM users WHERE login = '" + login + "' and password = '" + password + "'");
        if (resultSet.first() == true) {
            User user = new User();
            user.setUser(login);
            user.setPassword(password);
            response.sendRedirect(request.getContextPath() + "/main.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
        successText = "Bad login or password";
    } catch (Exception e) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        successText = "Bad login or password";
        e.printStackTrace();
    }%>
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
        <td>
            <button type="Submit" class="btn btn-success" value="Login">Login</button></td>
    </form>
    <div class="<%=success%>" role = "alert" >
        <strong > </strong > <%=successText%>
    </div>
</div>
</body>
</body>