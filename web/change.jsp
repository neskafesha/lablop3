<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%
    String id = request.getParameter("id");
    String success = "alert alert-danger";
    String successText = "";
    String dbName = "mysql";
    String dbUser = "root";
    String dbPassword = "123456789";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, dbUser, dbPassword);
        Statement st = conn.createStatement();
        st.executeUpdate("DELETE FROM itemsList WHERE id=" + id);
        success = "alert alert-success";
        successText = "Data Deleted Successfully!";
    } catch (Exception e) {
        successText = e.toString();
        e.printStackTrace();
    }
%>
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
    <br><br>
    <div class="<%=success%>" role = "alert" >
        <strong > </strong > <%=successText%>
    </div>
</div>