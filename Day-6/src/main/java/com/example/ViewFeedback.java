package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ViewFeedback {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/feedback_system";
        String user = "root";
        String password = "aakanksha0401@";

        try {
            Connection con = DriverManager.getConnection(url, user, password);

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM feedback");

            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id"));
                System.out.println("Name: " + rs.getString("name"));
                System.out.println("Email: " + rs.getString("email"));
                System.out.println("Rating: " + rs.getInt("session_rating"));
                System.out.println("Comments: " + rs.getString("comments"));
                System.out.println("---------------------------");
            }

            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
