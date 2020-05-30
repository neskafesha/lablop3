<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<%@ page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%
    String firstName = request.getParameter("FirstName");
    String lastName = request.getParameter("LastName");
    String middleName = request.getParameter("MiddleName");
    String dateBirth = request.getParameter("DateBirth");

    String email = request.getParameter("Email");
    String phone = request.getParameter("Phone");

    String dbName = "mysql";
    String dbUser = "root";
    String dbPassword = "123456789";

    String success = "alert alert-danger";
    String successText = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=false", dbUser, dbPassword);
        Statement st = connect.createStatement();

        st.executeUpdate("insert into itemsList values(0,'" + firstName + "','" + lastName + "','" + middleName + "', str_to_date('" + dateBirth + "','%m/%d/%Y %h:%i:%s %k'),'" + email + "','" + phone + "')");
        success = "alert alert-success";
        successText = "Contact added";
    } catch (Exception e) {
        successText = e.toString();
        e.printStackTrace();
    }%>
<body>
<div class="wrapper container">
    <header><nav class="navbar navbar-light bg-faded">
        <a class="navbar-brand" href="#">Contact List</a>
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">Main<span class="sr-only">(current)</span></a>
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
</body>