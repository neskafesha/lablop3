<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%
    String id = request.getParameter("id");
    String dbName = "mysql";
    String dbUser = "root";
    String dbPassword = "123456789";

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        out.println(e);
        e.printStackTrace();
    }
    Connection connection;
    Statement statement;
    ResultSet resultSet;
%>
<%
    try {
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=false", dbUser, dbPassword);
        statement = connection.createStatement();
        String sql = "select * from itemsList where id=" + id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
<body>
<div class="wrapper container">
    <header><nav class="navbar navbar-light bg-faded">
        <a class="navbar-brand" href="#">Contact List</a>
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">Main<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listItems.jsp">Contact List</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addForm.jsp">Create new contact</a>
            </li>
        </ul>
    </nav></header>
<h2>Update contact</h2>

<form method="post" action="update-contact.jsp">

    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">id:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="<%=resultSet.getInt("id") %>" name="id">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">First name:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="<%=resultSet.getString("FirstName") %>" name="FirstName">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">LastName:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="<%=resultSet.getString("LastName") %>" name="LastName">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">MiddleName:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="<%=resultSet.getString("MiddleName") %>" name="MiddleName">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Date birth:</label>
        <div class="col-xs-10">
            <input class="form-control" type="text" value="<%=resultSet.getString("DateBirth") %>" name="DateBirth">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Email:</label>
        <div class="col-xs-10">
            <input class="form-control" type="email" value="<%=resultSet.getString("Email")%>" name="Email">
        </div>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-xs-2 col-form-label">Phone:</label>
        <div class="col-xs-10">
            <input class="form-control" type="number" value="<%=resultSet.getString("Phone") %>" name="Phone">
        </div>
    </div>

    <br><br>
    <td>
        <button type="Submit" class="btn btn-success" value="Update">Update</button></td>
    <td><a href="index.jsp">
        <button type="button" class="btn btn-danger">Cancel</button>
    </a></td>

</form>
<%
        }
        connection.close();
    } catch (Exception e) {
        out.println(e);
        e.printStackTrace();
    }
%>
</div>
</body>
</html>