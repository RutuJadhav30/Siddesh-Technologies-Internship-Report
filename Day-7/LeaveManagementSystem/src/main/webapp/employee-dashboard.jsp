<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
        }

        .sidebar {
            width: 230px;
            height: 100vh;
            background: #2c3e50;
            position: fixed;
            padding-top: 30px;
            color: white;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 40px;
            font-weight: 500;
        }

        .sidebar a {
            display: block;
            padding: 14px 25px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #34495e;
        }

        .content {
            margin-left: 230px;
            padding: 40px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .welcome {
            font-size: 22px;
            margin-bottom: 10px;
            color: #2c3e50;
        }

        .info {
            color: #777;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="sidebar">
    <h2>Employee Panel</h2>
    <a href="employee-dashboard.jsp">Dashboard</a>
    <a href="apply-leave.jsp">Apply Leave</a>
    <a href="myLeaves">My Leave Status</a>
    <a href="login.jsp">Logout</a>
</div>

<div class="content">
    <div class="card">
        <div class="welcome">
            Welcome,
            <%= (session.getAttribute("username") != null) ? session.getAttribute("username") : "User" %>
        </div>
        <div class="info">
            Manage your leave requests, track approvals and stay updated.
        </div>
    </div>
</div>

</body>
</html>
