<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Airport Booking</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                background: linear-gradient(rgba(173, 216, 230, 0.6), rgba(173, 216, 230, 0.6)),
                    url('images/bluey.jpg') no-repeat center center fixed;
                background-size: cover;
                font-family: 'Segoe UI', sans-serif;
                color: #00334e;
            }
            .overlay {
                backdrop-filter: blur(3px);
                background-color: rgba(173, 216, 230, 0.5); /* sky blue */
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                padding: 20px;
            }
            .intro {
                text-align: center;
                margin-bottom: 20px;
            }
            .intro h1 {
                font-size: 2.2rem;
                font-weight: bold;
                color: #002b4e;
                text-shadow: 0 2px 4px rgba(0,0,0,0.3);
            }
            .intro p {
                font-size: 1.05rem;
                color: #1c3c5e;
                text-shadow: 0 1px 2px rgba(0,0,0,0.2);
            }
            .booking-card {
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 16px;
                padding: 25px;
                max-width: 1100px;
                margin: 0 auto;
                color: #00334e;
                box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            }
            .nav-buttons {
                display: flex;
                justify-content: center;
                gap: 15px;
                margin-bottom: 20px;
            }
            .nav-buttons button {
                border: 2px solid #00334e;
                padding: 6px 18px;
                font-weight: bold;
                border-radius: 8px;
                background-color: transparent;
                color: #00334e;
                transition: 0.3s;
            }
            .nav-buttons .active {
                background-color: #FFD700;
                color: #00334e;
                border-color: #FFD700;
            }
            .vehicle-option {
                cursor: pointer;
                padding: 10px;
                border-radius: 12px;
                text-align: center;
                border: 2px solid transparent;
                background-color: #eef7fb;
                transition: all 0.3s ease;
            }
            .vehicle-option img {
                width: 50px;
                height: auto;
            }
            .vehicle-option.selected {
                background-color: #A3D5FF;
                border-color: #00334e;
            }
            .form-control:focus {
                box-shadow: none;
                border-color: #00334e;
            }
            .book-btn {
                background-color: #FFD700;
                color: #00334e;
                font-weight: bold;
                border-radius: 10px;
                padding: 8px 28px;
                border: none;
            }
            .row-cols-md-4 > * {
                flex: 0 0 auto;
                width: 25%;
            }
        </style>
    </head>
    <body>
        <div class="overlay">
            <div class="intro">
                <h1>Airport Cab Booking</h1>
                <p>Reliable taxi transfers from Colombo Airport to your destination. Travel safely with MegaCity Cabs.</p>
            </div>

            <div class="booking-card shadow">
                <div class="nav-buttons">
                    <button class="active">Airport Pickup</button>
                    <button>Airport Drop</button>
                </div>

                <h5 class="mb-3">Select a vehicle</h5>
                <div class="row row-cols-2 row-cols-md-4 g-3 mb-4">
                    <%
                        try {
                            Connection conn = DBConnection.getInstance().getConnection();
                            String query = "SELECT * FROM Vehicles";
                            PreparedStatement pst = conn.prepareStatement(query);
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                    %>
                    <div class="col-md-6 col-lg-4 mb-4">
                        <label class="vehicle-option w-100 p-2 border rounded shadow-sm d-block" style="cursor: pointer;">
                            <input type="radio" name="vehicle" value="<%= rs.getInt("vehicleId")%>" class="d-none">
                            <img src="<%= rs.getString("imagePath")%>" class="img-fluid rounded mb-2" alt="<%= rs.getString("vehicleType")%>">
                            <h6 class="text-center"><%= rs.getString("vehicleType")%></h6>
                            <div class="text-center">
                                <i class="bi bi-people-fill"></i> <%= rs.getInt("capacity")%> &nbsp;
                                <i class="bi bi-suitcase"></i> <%= rs.getInt("luggageCapacity")%>
                            </div>
                        </label>
                    </div>
                    <%
                            }
                            rs.close();
                            pst.close();
                            conn.close();
                        } catch (Exception e) {
                            out.println("Database error: " + e.getMessage());
                        }
                    %>
                </div>

                <form action="BookingServlet" method="post">
                    <input type="hidden" name="vehicleId" id="selectedVehicleId" required>
                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="pickupLocation" value="Bandaranaike International Airport" required>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="dropLocation" placeholder="Enter drop-off location" required>
                        </div>
                        <div class="col-md-2">
                            <input type="date" class="form-control" name="pickupDate" required>
                        </div>
                        <div class="col-md-2">
                            <input type="time" class="form-control" name="pickupTime" required>
                        </div>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn book-btn">Book Now</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function selectVehicle(id) {
                const all = document.querySelectorAll(".vehicle-option");
                all.forEach(v => v.classList.remove("selected"));
                document.getElementById("vehicle-" + id).classList.add("selected");
                document.getElementById("selectedVehicleId").value = id;
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
