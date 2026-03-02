package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class Feedback {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter your name:");
        String name = sc.nextLine();

        System.out.println("Enter your email:");
        String email = sc.nextLine();

        System.out.println("Rate the session (1-5):");
        int rating = sc.nextInt();
        sc.nextLine();  // clear buffer

        System.out.println("Enter your comments:");
        String comments = sc.nextLine();

        String url = "jdbc:mysql://localhost:3306/feedback_system";
        String user = "root";
        String password = "aakanksha0401@";

        try {
            Connection con = DriverManager.getConnection(url, user, password);

            String query = "INSERT INTO feedback (name, email, session_rating, comments) VALUES (?, ?, ?, ?)";

            PreparedStatement pst = con.prepareStatement(query);

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setInt(3, rating);
            pst.setString(4, comments);

            pst.executeUpdate();

            System.out.println("Feedback submitted successfully!");

            con.close();

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());

        }
    }
}
