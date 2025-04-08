<%@ page import="util.DBConnection"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Session validation
    String firstname = (String) session.getAttribute("firstname");
    String role = (String) session.getAttribute("role");
    if (firstname == null || !"3".equals(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Homepage - Mega City Cabs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        /* Your original styles */
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #000;
            color: #FFD700;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .brand {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .navbar .profile span {
            color: white;
            font-weight: 500;
        }

        .navbar .logout-link {
            color: #FFD700;
            text-decoration: none;
            margin-left: 20px;
        }

        .navbar .logout-link:hover {
            color: white;
        }

        .menu-bar {
            background-color: #FFD700;
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 12px 0;
        }

        .menu-bar a {
            color: #000;
            text-decoration: none;
            font-weight: bold;
            padding: 6px 12px;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        .menu-bar a:hover {
            background-color: #000;
            color: #FFD700;
        }

        .hero {
            background: url('images/ban.png') center center/cover no-repeat;
            height: 300px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 2rem;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);
            text-align: center;
        }

        .modal-content {
            border-radius: 10px;
        }

        .modal-header {
            background-color: #FFD700;
            color: black;
            font-weight: bold;
        }

        .modal-body {
            padding: 30px;
        }

        .step-indicator {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .step {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin: 0 10px;
            transition: 0.3s;
        }

        .step.active {
            background: #FFA500;
            color: white;
        }

        .step-line {
            width: 50px;
            height: 4px;
            background: #ddd;
            transition: 0.3s;
        }

        .step.active + .step-line {
            background: #FFA500;
        }

        .form-section {
            display: none;
        }

        .form-section.active {
            display: block;
        }

        .vehicle-option {
            border: 2px solid transparent;
            transition: border 0.3s ease-in-out;
        }

        .vehicle-option input[type="radio"]:checked + img {
            border: 2px solid #FFA500;
        }

        .vehicle-option input[type="radio"]:checked ~ h6,
        .vehicle-option input[type="radio"]:checked ~ div {
            color: #FFA500;
        }
        /* Dashboard Cards */
        .dashboard {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin: 50px auto;
            max-width: 1000px;
            flex-wrap: wrap;
        }

        .dash-box {
            background-color: white;
            flex: 1 1 250px;
            padding: 25px 20px;
            border-left: 6px solid #FFD700;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .dash-box:hover {
            transform: translateY(-5px);
        }

        .dash-box h5 {
            color: #000;
            font-weight: bold;
        }

        .dash-box p {
            color: #555;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="brand">Mega City Cabs</div>
    <div class="profile">
        <img src="images/woman1.png" alt="Avatar" width="40" height="40" style="border-radius: 50%;">
        <span><%= firstname%></span>
        <a href="logout.jsp" class="logout-link">Logout</a>
    </div>
</div>

<div class="menu-bar">
    <a class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</a>
    <a href="viewBooking.jsp">My Bookings</a>
    <a href="airportBooking.jsp">Airport Cab</a>
    <a href="quickTour.jsp">Quick Tour</a>
</div>

<div class="hero">
    <h1>Welcome Back, <%= firstname%>!</h1>
    <p>Ready to ride the city with Us?</p>
</div>

<!-- Booking Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Need a Taxi?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="step-indicator">
                    <div class="step active">1</div>
                    <div class="step-line"></div>
                    <div class="step">2</div>
                    <div class="step-line"></div>
                    <div class="step">3</div>
                    <div class="step-line"></div>
                    <div class="step">4</div>
                </div>

                <form id="bookingForm" action="BookingServlet" method="post">
                    <!-- Step 1 -->
                    <div class="form-section active">
                        <h5>Enter Ride Details</h5>
                        <label class="form-label">Pickup Date</label>
                        <input type="date" class="form-control" name="pickupDate" required>
                        <label class="form-label">Pickup Time</label>
                        <input type="time" class="form-control" name="pickupTime" required>
                        <label class="form-label">Pickup Location</label>
                        <input type="text" class="form-control" name="pickupLocation" required>
                        <label class="form-label">Drop-off Location</label>
                        <input type="text" class="form-control" name="dropoffLocation" required>
                    </div>

                    <!-- Step 2 -->
                    <div class="form-section">
                        <h5>Choose a Vehicle</h5>
                        <div class="row">
                            <%
                                util.DBConnection dbConnection = util.DBConnection.getInstance();
                                Connection conn = dbConnection.getConnection();
                                String sql = "SELECT * FROM Vehicles";
                                PreparedStatement stmt = conn.prepareStatement(sql);
                                ResultSet rs = stmt.executeQuery();

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
                                stmt.close();
                                dbConnection.closeConnection();
                            %>
                        </div>
                    </div>

                    <!-- Step 3 -->
                    <div class="form-section">
                        <h5>Enter Contact Details</h5>
                        <label class="form-label">Full Name</label>
                        <input type="text" class="form-control" name="customerName" required>
                        <label class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" name="customerPhone" required>
                        <label class="form-label">Email</label>
                        <input type="email" class="form-control" name="customerEmail" required>
                    </div>
                    
                    

                    <!-- Step 4 -->
                    <div class="form-section">
                        <h5>Booking Summary</h5>
                        <p>Review your booking details before confirming.</p>
                        
                        <input type="hidden" name="customerId" value="<%= session.getAttribute("userId") %>">
                        <input type="text" name="pickupLocation" placeholder="Enter Pickup Location">
                        <input type="text" name="dropoffLocation" placeholder="Enter Drop-off Location">
                                                
                        <button type="submit" class="btn btn-success">Confirm Booking</button>
                    </div>
                </form>

                <div class="d-flex justify-content-between mt-4">
                    <button type="button" class="btn btn-secondary" id="prevBtn" disabled>Previous</button>
                    <button type="button" class="btn btn-warning" id="nextBtn">Next</button>
                </div>
            </div>
        </div>
    </div>
</div>
                        
<!-- Dashboard Quick Access -->
    <div class="dashboard">
        <div class="dash-box" onclick="location.href='#bookingModal'">
            <h5>Book a Ride</h5>
            <p>Plan your journey and reserve your cab in a few clicks.</p>
        </div>
        <div class="dash-box" onclick="location.href='viewBooking.jsp'">
            <h5>My Bookings</h5>
            <p>Check all your past and upcoming reservations.</p>
        </div>
        <div class="dash-box" onclick="location.href='airportBooking.jsp'">
            <h5>Airport Transfers</h5>
            <p>Get to and from the airport with ease.</p>
        </div>
        <div class="dash-box" onclick="location.href='quickTour.jsp'">
            <h5>Quick Tour</h5>
            <p>Need help? Get a tour on how to use the dashboard.</p>
        </div>
    </div>                        

<!-- Bootstrap & Step Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const sections = document.querySelectorAll(".form-section");
    const nextBtn = document.getElementById("nextBtn");
    const prevBtn = document.getElementById("prevBtn");
    const steps = document.querySelectorAll(".step");

    let currentStep = 0;

    function showStep(step) {
        sections.forEach((section, index) => {
            section.classList.toggle("active", index === step);
            steps[index].classList.toggle("active", index <= step);
        });
        prevBtn.disabled = step === 0;
        nextBtn.textContent = step === sections.length - 1 ? "Finish" : "Next";
    }

    nextBtn.addEventListener("click", () => {
        if (currentStep < sections.length - 1) {
            currentStep++;
            showStep(currentStep);
        } else {
            document.getElementById("bookingForm").submit();
        }
    });

    prevBtn.addEventListener("click", () => {
        if (currentStep > 0) {
            currentStep--;
            showStep(currentStep);
        }
    });

    showStep(currentStep);
</script>
</body>
</html>
