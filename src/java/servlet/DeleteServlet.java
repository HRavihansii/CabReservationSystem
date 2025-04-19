package servlet;

import util.DBConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class DeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String type = request.getParameter("type"); // user, vehicle, driver
        String idStr = request.getParameter("id");

        if (type == null || idStr == null) {
            response.sendRedirect("adminDashboard.jsp");
            return;
        }

        int id = Integer.parseInt(idStr);
        String sql = "";

        switch (type) {
            case "user":
                sql = "DELETE FROM Users WHERE uid = ?";
                break;
            case "vehicle":
                sql = "DELETE FROM Vehicles WHERE vehicle_id = ?";
                break;
            case "driver":
                sql = "DELETE FROM Drivers WHERE driver_id = ?";
                break;
            default:
                response.sendRedirect("adminDashboard.jsp");
                return;
        }

        try {
            Connection conn = DBConnection.getInstance().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect back to the correct management page
        switch (type) {
            case "user":
                response.sendRedirect("manageUsers.jsp");
                break;
            case "vehicle":
                response.sendRedirect("manageVehicles.jsp");
                break;
            case "driver":
                response.sendRedirect("manageDrivers.jsp");
                break;
        }
    }
}

