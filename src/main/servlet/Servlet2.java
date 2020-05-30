package main.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
@WebServlet(name = "Servlet2", urlPatterns = {"/Servlet2"})
public class Servlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

            successText = "Bad login or password";
            e.printStackTrace();
        }
    }
}