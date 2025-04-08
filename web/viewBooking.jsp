<%@ page import="util.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Retrieve session attributes
    Integer userId = (Integer) session.getAttribute("userId");
    String firstname = (String) session.getAttribute("firstname");
    String role = (String) session.getAttribute("role");

    // Validate user session and role
    if (userId == null || !"3".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings - Mega City Cabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa;">

<div class="container mt-5">
    <h2 class="mb-4 text-center text-warning">My Bookings</h2>

    <table class="table table-bordered table-striped table-hover shadow-sm bg-white">
        <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>Pickup Date</th>
                <th>Pickup Time</th>
                <th>Pickup Location</th>
                <th>Drop-off Location</th>
                <th>Vehicle</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    DBConnection db = DBConnection.getInstance();
                    conn = db.getConnection();

                    String sql = "SELECT b.bookingDate, b.bookingTime, b.pickupLocation, b.dropoffLocation, v.vehicleType, b.status " +
                                 "FROM Bookings b " +
                                 "JOIN Vehicles v ON b.vehicleId = v.vehicleId " +
                                 "WHERE b.customerId = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, userId);
                    rs = stmt.executeQuery();

                    int count = 1;
                    while (rs.next()) {
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= rs.getString("bookingDate") %></td>
                <td><%= rs.getString("bookingTime") %></td>
                <td><%= rs.getString("pickupLocation") %></td>
                <td><%= rs.getString("dropoffLocation") %></td>
                <td><%= rs.getString("vehicleType") %></td>
                <td><%= rs.getString("status") %></td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<tr><td colspan='7' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                }
            %>
        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="customerDashboard.jsp" class="btn btn-dark">Back to Dashboard</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
