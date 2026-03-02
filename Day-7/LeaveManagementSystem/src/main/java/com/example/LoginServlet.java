package com.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement pst = con.prepareStatement(
                    "SELECT * FROM users WHERE username=? AND password=?");

            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", rs.getString("role"));

                if ("admin".equals(rs.getString("role"))) {
                    response.sendRedirect("admin-dashboard.jsp");
                } else {
                    response.sendRedirect("employee-dashboard.jsp");
                }

            } else {
                response.getWriter().println("Invalid Username or Password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Server Error");
        }
    }
}
