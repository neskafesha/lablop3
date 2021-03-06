<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection,java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<link rel="stylesheet" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">

<%

    Statement st;
    ResultSet rs;
    String dbName = "mysql";
    String dbUser = "root";
    String dbPassword = "123456789";

%>
<body>
<div class="wrapper container">
    <header>

        <nav class="navbar navbar-light bg-faded">
            <form class="navbar-form navbar-right" role="search" method="post" action="listItems.jsp">
                <div class="input-group">
                    <input type="text" class="form-control" name = "search" placeholder="Search" />
                    <span class="input-group-btn">

            <button type="Submit" value="Create" class="btn btn-default"><span class="glyphicon glyphicon glyphicon-search" aria-hidden="true">Ok</span></button>
                        <td><a href="listItems.jsp">
                        <button type="button" class="btn btn-default"><span class="glyphicon glyphicon glyphicon-search" aria-hidden="true">Clear</span></button>
                        </a></td>
        </span>
                </div>
            </form>
        <a class="navbar-brand" href="#">Contact List</a>
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="main.jsp">Main</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="listItems.jsp">Contact List<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="addForm.jsp">Create new contact</a>
            </li>
        </ul>
    </nav></header>
<table class="table">
    <thead class="thead-inverse">
        <th scope="col">#</th>
        <th scope="col">First name</th>
        <th scope="col">Last name</th>
        <th scope="col">Middle name</th>
        <th scope="col">Date birth</th>
        <th scope="col">Email</th>
        <th scope="col">Phone</th>
        <th scope="col"></th>
        <th scope="col"></th>
    </thead>
    <tbody>
        <%

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName + "?allowPublicKeyRetrieval=true&useSSL=false", dbUser, dbPassword);
        st=connect.createStatement();
        String searchText = request.getParameter("search");
        String[] splitResult;
        String sqlQuery = "SELECT * FROM itemsList";
        if (searchText != null){
            splitResult = searchText.split(" ");
            sqlQuery = "SELECT * FROM itemsList where LastName like '%" + splitResult[0] + "%'" + " and FirstName like '%" + splitResult[1] + "%'" + " and MiddleName like '%" + splitResult[2] + "%'";
        }
        rs = st.executeQuery(sqlQuery);
        while(rs.next()){%>
        <thead>
        <th><%=rs.getInt("id")%>
        </th>
        <td><%=rs.getString("FirstName")%>
        </td>
        <td><%=rs.getString("LastName")%>
        </td>
        <td><%=rs.getString("MiddleName")%>
        </td>
        <td><%=rs.getString("DateBirth")%>
        </td>
        <td><%=rs.getString("Email")%>
        </td>
        <td><%=rs.getString("Phone")%>
        </td>
        <td><a href="update.jsp?id=<%=rs.getInt("id")%>">
            <button type="button" class="btn btn-info">Update</button>
        </a></td>
        <td><a href="delete.jsp?id=<%=rs.getInt("id")%>">
            <button type="button" class="btn btn-danger">Remove</button>
        </a></td>
        </thead>
<%
}
rs.close();
st.close();
connect.close();
}
catch(Exception e){
	out.println("Неверный формат поиска - Фамилия Имя Отчество");
	e.printStackTrace();	
}
%>

</table>
    <br><br>
</div>
</body>