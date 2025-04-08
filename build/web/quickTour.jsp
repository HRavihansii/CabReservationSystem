<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quick Tour - Mega City Cabs</title>
    <style>
        :root {
            --taxi-yellow: #FFD700;
            --dark-bg: #0f0f0f;
            --card-bg: #1e1e1e;
            --step-bg: #2b2b2b;
            --navy-blue: #112B4E;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            background-color: var(--dark-bg);
            color: #f8f9fa;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 30px 20px;
        }

        .header {
            background-color: var(--taxi-yellow);
            color: black;
            padding: 25px 15px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.4);
            margin-bottom: 30px;
        }

        .header h1 {
            margin: 0;
            font-size: 2.2rem;
        }

        .header p {
            font-size: 1.1rem;
            margin-top: 8px;
        }

        .section {
            background-color: var(--card-bg);
            border-left: 5px solid var(--taxi-yellow);
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
        }

        .section h2 {
            color: var(--taxi-yellow);
            margin-bottom: 15px;
        }

        .step {
            background-color: var(--step-bg);
            border: 1px solid var(--taxi-yellow);
            border-radius: 8px;
            padding: 15px 20px;
            margin-bottom: 15px;
        }

        .step h3 {
            color: var(--taxi-yellow);
            margin-top: 0;
        }

        .button {
            display: inline-block;
            background-color: var(--navy-blue);
            color: white;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: bold;
            text-decoration: none;
            border: 2px solid var(--taxi-yellow);
            transition: 0.3s ease;
        }

        .button:hover {
            background-color: var(--taxi-yellow);
            color: var(--navy-blue);
        }

        @media (max-width: 768px) {
            .header h1 {
                font-size: 1.6rem;
            }

            .header p {
                font-size: 0.95rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Welcome to Mega City Cabs</h1>
            <p>Take a quick tour of how to use the system</p>
        </div>

        <div class="section">
            <h2>Step 1: Select Your Vehicle</h2>
            <div class="step">
                <h3>Select a vehicle from the available options</h3>
                <p>Choose the vehicle that suits your travel needs. Our fleet includes economy, standard, and luxury options.</p>
            </div>
        </div>

        <div class="section">
            <h2>Step 2: Enter Pickup and Drop-off Locations</h2>
            <div class="step">
                <h3>Provide your trip details</h3>
                <p>Enter your pickup location, drop-off location, and the date and time of your trip.</p>
            </div>
        </div>

        <div class="section">
            <h2>Step 3: Confirm Booking</h2>
            <div class="step">
                <h3>Review your booking</h3>
                <p>Once you've entered all your details, review the booking information and confirm your trip.</p>
            </div>
        </div>

        <div class="section" style="text-align: center;">
            <a href="customerDashboard.jsp" class="button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
