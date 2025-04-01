package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnection;

//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user input from the registration form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String telephone = request.getParameter("telephone");
        String address = request.getParameter("address");

        try {
            // Connect to the database
            Connection conn = DBConnection.getInstance().getConnection();

            // Check if the username or email already exists
            String checkQuery = "SELECT * FROM Users WHERE username = ? OR email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Username or email already exists
                request.setAttribute("errorMessage", "Username or email is already taken!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // Insert new user into the database
                String insertQuery = "INSERT INTO Users (username, password, role, firstname, lastname, email, telephone, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement insertStmt = conn.prepareStatement(insertQuery);

                insertStmt.setString(1, username);
                insertStmt.setString(2, password); // Later, hash the password
                insertStmt.setString(3, role);
                insertStmt.setString(4, fname);
                insertStmt.setString(5, lname);
                insertStmt.setString(6, email);
                insertStmt.setString(7, telephone);
                insertStmt.setString(8, address);

                int row = insertStmt.executeUpdate();
                if (row > 0) {
                    response.sendRedirect("login.jsp"); // Redirects to the login page
                    return; // Ends further execution
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
