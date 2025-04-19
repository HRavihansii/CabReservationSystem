package servlet;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ManageVehiclesServlet extends HttpServlet {

    // Fetch all vehicles and forward to manageVehicles.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection conn = DBConnection.getInstance().getConnection();
            String query = "SELECT * FROM Vehicles";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            // Store the result in the request scope for JSP
            request.setAttribute("vehicles", rs);
            RequestDispatcher dispatcher = request.getRequestDispatcher("manageVehicles.jsp");
            dispatcher.forward(request, response);

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp");
        }
    }

    // Handle the vehicle deletion request
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String vehicleIdStr = request.getParameter("vehicleId");
        if (vehicleIdStr != null) {
            try {
                int vehicleId = Integer.parseInt(vehicleIdStr);
                Connection conn = DBConnection.getInstance().getConnection();
                String deleteQuery = "DELETE FROM Vehicles WHERE vehicleId = ?";
                PreparedStatement ps = conn.prepareStatement(deleteQuery);
                ps.setInt(1, vehicleId);
                ps.executeUpdate();
                ps.close();
                conn.close();

                // After deleting the vehicle, redirect to manageVehicles.jsp
                response.sendRedirect("ManageVehiclesServlet");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminDashboard.jsp");
            }
        } else {
            response.sendRedirect("adminDashboard.jsp");
        }
    }
}
