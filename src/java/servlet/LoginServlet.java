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
import javax.servlet.http.HttpSession;
import util.DBConnection;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Get the database connection
            Connection conn = DBConnection.getInstance().getConnection();

            // SQL query to validate user credentials and fetch role
            String query = "SELECT * FROM Users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password); // Use hashed passwords in production for security

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login successful
                String firstname = rs.getString("firstname"); // Retrieve the first name
                String role = rs.getString("role");

                // Start a session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("firstname", firstname);
                session.setAttribute("role", role);

                // Redirect based on the user's role
                switch (role) {
                    case "1": // Admin
                        response.sendRedirect("adminDashboard.jsp");
                        break;
                    case "2": // Driver
                        response.sendRedirect("driverDashboard.jsp");
                        break;
                    case "3": // Customer
                        response.sendRedirect("customerDashboard.jsp");
                        break;
                    default:
                        session.invalidate(); // End session for invalid roles
                        request.setAttribute("errorMessage", "Unauthorized role detected.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                        break;
                }
            } else {
                // Login failed
                request.setAttribute("errorMessage", "Invalid username or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

