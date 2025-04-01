<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cabs - Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #FFD700; /* Taxi Yellow */
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .login-container {
                background-color: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 400px;
            }
            .login-container h2 {
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
            .text-danger {
                font-size: 0.9rem;
                display: none;
            }
            .footer {
                margin-top: 15px;
                font-size: 0.9rem;
                text-align: left;
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
        <div class="login-container">
            <h2>Mega City Cabs</h2>
            <form id="loginForm" action="LoginServlet" method="POST" onsubmit="return checkSubmit();">
                <div class="mb-3 text-start">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="mb-3 text-start">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-sm">LOGIN</button>
                <div id="errorMessage" class="text-danger mt-2 text-center">Invalid credentials. Please try again.</div>
            </form>
            <div class="footer">
                <p>Don't have an account? <a href="register.jsp">Register Here</a></p>
            </div>
        </div>

        <script>
            function login() {
                console.log("Login function triggered!");
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;

                console.log("Username: " + username);
                console.log("Password: " + password);

                fetch('LoginServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: 'username=' + encodeURIComponent(username) + '&password=' + encodeURIComponent(password)
                }
                ).then(response => response.json())
                        .then(data => {
                            console.log("Server response:", data);

                            if (data.success) {
                                if (data.role === 1) {
                                    window.location.href = 'adminDashboard.jsp';
                                } else if (data.role === 2) {
                                    window.location.href = 'driverDashboard.jsp';
                                } else {
                                    window.location.href = 'customerDashboard.jsp';
                                }
                            } else {
                                alert("Login failed: " + data.error);
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                        });
            }

        </script>

        <script>
            function checkSubmit() {
                console.log("Login form submitted!");
                return true;
            }
        </script>

        <script>
            document.getElementById("loginForm").addEventListener("submit", function (event) {
                console.log("Login form submitted!");
            });
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

