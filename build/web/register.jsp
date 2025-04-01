<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mega City Cabs - Register</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- SweetAlert -->
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #FFD700; /* Taxi Yellow */
                display: flex;
                align-items: center;
                justify-content: center;
                min-height: 100vh; /* Allows scrolling if needed */
                padding: 20px;
            }
            .signup-container {
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 500px;
                overflow-y: auto; /* Enables scrolling inside form if necessary */
                max-height: 90vh; /* Prevents form from going out of screen */
            }
            .signup-container h2 {
                text-align: center;
                color: #333;
                font-weight: bold;
                margin-bottom: 20px;
            }
            .form-label {
                font-weight: bold;
                color: #333;
            }
            .form-control {
                border: 2px solid #FFC107; /* Taxi Gold */
                background: #FFF8DC;
            }
            .form-control:focus {
                border-color: #FFB300;
                box-shadow: 0 0 5px #FFB300;
            }
            .btn-primary {
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                background-color: #222; /* Dark taxi color */
                color: #FFD700;
                font-weight: bold;
                border-radius: 50px;
                transition: 0.3s;
                display: block;
                text-align: center;
                border: none;
            }
            .btn-primary:hover {
                background-color: #111;
            }
            .footer {
                margin-top: 15px;
                font-size: 0.9rem;
                text-align: center;
            }
            .footer a {
                color: #000;
                font-weight: bold;
                text-decoration: none;
            }
            .footer a:hover {
                color: #FFB300;
            }
        </style>
    </head>
    <body>

        <div class="signup-container">
            <h2>Register</h2>
            <form method="post" action="RegisterServlet">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="fname" class="form-label">First Name</label>
                    <input type="text" name="fname" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="lname" class="form-label">Last Name</label>
                    <input type="text" name="lname" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="telephone" class="form-label">Telephone</label>
                    <input type="text" name="telephone" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" name="address" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select name="role" class="form-select" required>
                        <option value="">Select Role</option>
                        <option value="2">Driver</option>
                        <option value="3">Customer</option>
                    </select>
                </div>

                <button type="submit" value="RegisterServlet" class="btn btn-primary w-100">Create Account</button>
            </form>

            <p class="footer mt-3">Already have an account? <a href="login.jsp">Login here</a></p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <%
            String success = request.getParameter("success");
            if (success != null && success.equals("true")) {
        %>
        <script>
    swal({
        title: "Registration Successful!",
        text: "Your account has been created. Please login.",
        icon: "success",
        button: "OK"
    }).then(() => {
        window.location.href = "login.jsp"; // Redirect to login page
    });
        </script>
        <% }%>

    </body>
</html>
