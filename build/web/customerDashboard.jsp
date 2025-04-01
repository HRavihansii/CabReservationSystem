<%@ page session="true" %>
<%
    String username = (String) session.getAttribute("firstname");
    String role = (String) session.getAttribute("role");

    if (username == null || !"3".equals(role)) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            display: flex;
            font-family: Arial, sans-serif;
        }
        
        .sidebar {
            width: 280px;
            height: 100vh;
            background-color: #001f3f; /* Dark Blue */
            color: white;
            position: fixed;
            padding-top: 20px;
            transition: all 0.3s ease;
        }

        .sidebar .profile {
            text-align: center;
            padding: 15px;
            border-bottom: 2px solid #FFC72C; /* Taxi Yellow */
        }

        .sidebar .profile img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            border: 3px solid #FFC72C; /* Taxi Yellow */
        }

        .sidebar .profile h5 {
            margin-top: 10px;
            font-size: 18px;
        }

        .sidebar .profile p {
            font-size: 14px;
            color: #ADB5BD;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px;
            text-decoration: none;
            font-size: 16px;
            border-radius: 5px;
            margin: 5px 10px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #FFC72C; /* Taxi Yellow */
            color: #001f3f; /* Dark Blue */
        }

        .sidebar .logout {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
        }

        .content {
            margin-left: 280px;
            padding: 20px;
            width: 100%;
        }

        iframe {
            width: 100%;
            height: 90vh;
            border: none;
        }
    </style>
</head>

<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="profile">
            <img src="images/female-customer.png" alt="User Avatar"> <!-- Replace with actual avatar path -->
            <h5><%= username %></h5>
            <p>Customer</p>
        </div>

        <!-- Sidebar links specific to customer -->
        <a href="#" onclick="loadPage('addBooking.jsp')">Book a Ride</a>
        <a href="#" onclick="loadPage('viewBookings.jsp')">View Bookings</a>
        <a href="#" onclick="loadPage('calculateBill.jsp')">Calculate Bill</a>

        <!-- Logout Button -->
        <div class="logout">                     
            <a href="logout.jsp" class="text-danger">Logout</a>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="content">
        <iframe id="contentFrame" src="viewBookings.jsp"></iframe> <!-- Default page loaded -->
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function loadPage(page) {
            document.getElementById("contentFrame").src = page;
        }
    </script>
</body>
</html>

