<%@ page import="java.sql.*" %> 
<%@ page import="util.DBConnection" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String adminName = (String) session.getAttribute("firstName");
    if (adminName == null) {
        adminName = "Admin";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Vehicles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .top-navbar {
            background-color: #001a3a;
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

        .table thead {
            background-color: #002b5c;
            color: white;
        }

        .btn-warning {
            color: black;
        }
    </style>
</head>
<body>

<!-- Top Navbar -->
<div class="top-navbar">
    MegaCity Cabs - Manage Vehicles
    <div class="profile-info">
        <span><%= adminName %></span>
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
    <h3 class="mb-4">Vehicle Management</h3>

    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th>Vehicle ID</th>
            <th>Type</th>
            <th>Capacity</th>
            <th>Luggage Capacity</th>
            <th>Rate Per Km</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection conn = DBConnection.getInstance().getConnection();
                String query = "SELECT * FROM Vehicles";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("vehicleId") %></td>
            <td><%= rs.getString("vehicleType") %></td>
            <td><%= rs.getInt("capacity") %></td>
            <td><%= rs.getInt("luggageCapacity") %></td>
            <td>Rs. <%= rs.getDouble("ratePerKm") %></td>
            <td>
                <img src="<%= rs.getString("imagePath") %>" alt="Vehicle Image" style="width: 80px; height: 50px;">
            </td>
            <td>
                <a href="editVehicle.jsp?vehicleId=<%= rs.getInt("vehicleId") %>" class="btn btn-sm btn-warning">Edit</a>
                <a href="DeleteServlet?type=vehicle&id=<%= rs.getInt("vehicleId") %>" class="btn btn-sm btn-danger"
                   onclick="return confirm('Are you sure you want to delete this vehicle?')">Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
        <tr><td colspan="7" class="text-danger">Error loading vehicles.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
