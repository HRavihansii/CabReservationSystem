package servlet;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type"); // user, vehicle, driver
        String idStr = request.getParameter("id");
        
        if (type == null || idStr == null) {
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        int id = Integer.parseInt(idStr);
        String sql = "";
        
        // Adjust SQL queries based on the type
        switch (type) {
            case "user":
                sql = "UPDATE Users SET username = ?, password = ?, role = ?, firstname = ?, lastname = ?, email = ?, telephone = ?, address = ? WHERE uid = ?";
                break;
            // Add other cases for vehicles, drivers if needed in the future
            default:
                response.sendRedirect("adminDashboard.jsp");
                return;
        }

        try {
            Connection conn = DBConnection.getInstance().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            // For user update, set the updated data from the form (getParameter)
            if (type.equals("user")) {
                ps.setString(1, request.getParameter("username"));
                ps.setString(2, request.getParameter("password"));
                ps.setInt(3, Integer.parseInt(request.getParameter("role")));
                ps.setString(4, request.getParameter("firstname"));
                ps.setString(5, request.getParameter("lastname"));
                ps.setString(6, request.getParameter("email"));
                ps.setString(7, request.getParameter("telephone"));
                ps.setString(8, request.getParameter("address"));
                ps.setInt(9, id);
            }
            // Add other cases for vehicles, drivers if needed

            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the correct management page after update
        switch (type) {
            case "user":
                response.sendRedirect("manageUsers.jsp");
                break;
            // Add other cases for vehicle, driver if needed
        }
    }
}

