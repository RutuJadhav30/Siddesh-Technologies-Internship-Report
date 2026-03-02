package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/feedback_system";
        String user = "root";
        String password = "aakanksha0401@";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected Successfully!");

            Scanner sc = new Scanner(System.in);

            System.out.print("Enter your name: ");
            String name = sc.nextLine();

            System.out.print("Enter your email: ");
            String email = sc.nextLine();

            System.out.print("Rate the session (1-5): ");
            int rating = sc.nextInt();
            sc.nextLine(); // clear buffer

            System.out.print("Enter your comments: ");
            String comments = sc.nextLine();

            String sql = "INSERT INTO feedback (name, email, session_rating, comments) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setInt(3, rating);
            stmt.setString(4, comments);

            stmt.executeUpdate();

            System.out.println("Feedback submitted successfully!");

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
