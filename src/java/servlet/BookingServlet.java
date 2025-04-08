package servlet; 

import util.DBConnection;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int customerId = (int) session.getAttribute("userId");

        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        String bookingDate = request.getParameter("pickupDate");
        String bookingTime = request.getParameter("pickupTime");
        int vehicleId = Integer.parseInt(request.getParameter("vehicle"));

        double distanceInKm = 10.0; // Hardcoded for now

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            DBConnection db = DBConnection.getInstance();
            conn = db.getConnection();

            // Get ratePerKm for the selected vehicle
            double ratePerKm = 0.0;
            ps = conn.prepareStatement("SELECT ratePerKm FROM Vehicles WHERE vehicleId = ?");
            ps.setInt(1, vehicleId);
            rs = ps.executeQuery();
            if (rs.next()) {
                ratePerKm = rs.getDouble("ratePerKm");
            } else {
                throw new Exception("Vehicle not found!");
            }

            double totalFare = ratePerKm * distanceInKm;

            // Insert into Bookings table
            ps = conn.prepareStatement(
                "INSERT INTO Bookings (customerId, vehicleId, pickupLocation, dropoffLocation, bookingDate, bookingTime, distanceInKm, totalFare, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setInt(1, customerId);
            ps.setInt(2, vehicleId);
            ps.setString(3, pickupLocation);
            ps.setString(4, dropoffLocation);
            ps.setString(5, bookingDate);
            ps.setString(6, bookingTime);
            ps.setDouble(7, distanceInKm);
            ps.setDouble(8, totalFare);
            ps.setString(9, "Pending");

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("viewBooking.jsp");
            } else {
                response.getWriter().write("Booking failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
}
