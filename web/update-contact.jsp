<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
    String id = request.getParameter("id");
    String FirstName = request.getParameter("FirstName");
    String LastName = request.getParameter("LastName");
    String MiddleName = request.getParameter("MiddleName");
    String DateBirth = request.getParameter("DateBirth");
    String Email = request.getParameter("Email");
    String Phone = request.getParameter("Phone");

    String dbName = "mysql";
    String dbUser = "root";
    String dbPassword = "123456789";

    String success = "alert alert-danger";
    String successText = "";

    if (id != null) {
        Connection con;
        PreparedStatement ps;
        int contactId = Integer.parseInt(id);
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                request.setAttribute("error", e);
                successText = e.toString();
            }
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=false", dbUser, dbPassword);
            String sql = "Update itemsList set FirstName=?,LastName=?,MiddleName=?,DateBirth=?,Email=?,Phone=? where id=" + contactId;
            ps = con.prepareStatement(sql);
            ps.setString(1, FirstName);
            ps.setString(2, LastName);
            ps.setString(3, MiddleName);
            ps.setString(4, DateBirth);
            ps.setString(5, Email);
            ps.setString(6, Phone);

            int i = ps.executeUpdate();
            if (i > 0) {
                success = "alert alert-success";
                successText = "Contact successfully updated";
            } else {
                successText = "There is a problem in updating contact";
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            successText = sql.toString();
        }
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