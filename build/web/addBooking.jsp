<%@ page session="true" %>
<%
    // Ensure only authorized customers can access this page
    String username = (String) session.getAttribute("firstname");
    String role = (String) session.getAttribute("role");

    if (username == null || !"3".equals(role)) { // Role 3 = Customer
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Booking</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
        }

        .main-content {
            margin-left: 250px; /* Adjust for sidebar */
            padding: 20px;
            min-height: 100vh;
            background: #f8f9fa;
        }

        .card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 100%;
        }

        .card h1 {
            font-size: 24px;
            font-weight: bold;
            color: #001f3f; /* Dark Blue */
            margin-bottom: 20px;
            text-align: center;
        }

        .form-label {
            font-weight: bold;
            color: #001f3f;
        }

        .btn-submit {
            width: 100%;
            background-color: #001f3f; /* Dark Blue */
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-submit:hover {
            background-color: #FFC72C; /* Taxi Yellow */
            color: #001f3f;
        }
    </style>
</head>
<body>

    

    <div class="main-content">
        <div class="card">
            <h1>Create a Booking</h1>
            <form action="AddBookingServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Customer Name</label>
                    <input type="text" class="form-control" value="<%= username %>" readonly>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Telephone</label>
                        <input type="text" name="telephone" class="form-control" required>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Destination</label>
                    <input type="text" name="destination" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Booking Date</label>
                    <input type="date" name="bookingDate" class="form-control" required>
                </div>

                <button type="submit" class="btn-submit">Submit Booking</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
