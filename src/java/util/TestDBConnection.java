/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TestDBConnection {
    public static void main(String[] args) {
        try {
            Connection conn = DBConnection.getInstance().getConnection();
            if (conn != null) {
                System.out.println("Connection successful!");

                // Test query
                String query = "SELECT 1";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    System.out.println("Test query executed successfully!");
                }
            } else {
                System.err.println("Connection failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
