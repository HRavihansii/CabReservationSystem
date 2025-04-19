<%@ page import="util.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = (String) session.getAttribute("username");
    String role = (String) session.getAttribute("role");

    if (username == null || !"1".equals(role)) {
        response.sendRedirect("adminDashboard.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Mega City Cabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            background-color: #f4f4f4;
            font-family: 'Segoe UI', sans-serif;
        }

        .top-navbar {
            background-color: #001a33;
            color: white;
            padding: 15px 30px;
            font-size: 22px;
            font-weight: bold;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .profile-info {
            display: flex;
            align-items: center;
        }

        .profile-info span {
            margin-right: 10px;
            font-size: 16px;
            font-weight: 500;
        }

        .profile-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #ffd700;
        }

        .sidebar {
            height: 100vh;
            width: 220px;
            position: fixed;
            top: 60px;
            left: 0;
            background-color: #002b5c;
            padding-top: 30px;
        }

        .sidebar a {
            display: block;
            padding: 12px 25px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #ffd700;
            color: #002b5c;
        }

        .main-content {
            margin-left: 220px;
            padding: 100px 30px 30px 30px;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border: none;
        }

        .card-yellow {
            background-color: #ffd700;
            color: #002b5c;
        }

        .count {
            font-size: 36px;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    int userCount = 0;
    int vehicleCount = 0;
    int driverCount = 0;
    int bookingCount = 0;

    try {
        Connection conn = DBConnection.getInstance().getConnection();
        Statement stmt = conn.createStatement();

        ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM Users");
        if (rs1.next()) userCount = rs1.getInt(1);

        ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM Vehicles");
        if (rs2.next()) vehicleCount = rs2.getInt(1);

        ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM Drivers");
        if (rs3.next()) driverCount = rs3.getInt(1);

        ResultSet rs4 = stmt.executeQuery("SELECT COUNT(*) FROM Bookings");
        if (rs4.next()) bookingCount = rs4.getInt(1);

        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    String firstName = (String) session.getAttribute("firstname");
    if (firstName == null) {
        firstName = "Admin";
    }
%>

<!-- Top Navbar -->
<div class="top-navbar">
    Mega City Cabs - Admin Dashboard

    <div class="profile-info">
        <span><%= firstName %></span>
        <img src="images/admin.png" alt="Admin Avatar">
    </div>
</div>

<!-- Sidebar -->
<div class="sidebar">
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="manageUsers.jsp">Manage Users</a>
    <a href="manageVehicles.jsp">Manage Vehicles</a>
    <a href="manageDrivers.jsp">Manage Drivers</a>
    <a href="viewAllBookings.jsp">All Bookings</a>
    <a href="logout.jsp">Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <div class="row mt-4 g-4">
        <div class="col-md-3">
            <div class="card card-yellow text-center p-3">
                <h5>Users</h5>
                <div class="count"><%= userCount %></div>
                <a href="manageUsers.jsp" class="btn btn-dark mt-2">View</a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-yellow text-center p-3">
                <h5>Vehicles</h5>
                <div class="count"><%= vehicleCount %></div>
                <a href="manageVehicles.jsp" class="btn btn-dark mt-2">View</a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-yellow text-center p-3">
                <h5>Drivers</h5>
                <div class="count"><%= driverCount %></div>
                <a href="manageDrivers.jsp" class="btn btn-dark mt-2">View</a>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card card-yellow text-center p-3">
                <h5>Bookings</h5>
                <div class="count"><%= bookingCount %></div>
                <a href="viewAllBookings.jsp" class="btn btn-dark mt-2">View</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
