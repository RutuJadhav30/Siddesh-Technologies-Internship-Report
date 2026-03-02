package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/myLeaves")
public class MyLeavesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        List<String[]> leaveList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "SELECT l.from_date, l.to_date, l.reason, l.status " +
                            "FROM leaves l JOIN users u ON l.employee_id=u.id WHERE u.username=?");

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] row = new String[4];
                row[0] = rs.getString("from_date");
                row[1] = rs.getString("to_date");
                row[2] = rs.getString("reason");
                row[3] = rs.getString("status");

                leaveList.add(row);
            }

            request.setAttribute("leaveData", leaveList);
            request.getRequestDispatcher("my-leaves.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
