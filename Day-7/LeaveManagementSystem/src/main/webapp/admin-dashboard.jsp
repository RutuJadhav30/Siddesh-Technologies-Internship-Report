<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #eef1f5;
        }

        .sidebar {
            width: 240px;
            height: 100vh;
            background: #1f2d3d;
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
            background: #2e3e50;
        }

        .content {
            margin-left: 240px;
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
            color: #1f2d3d;
            margin-bottom: 10px;
        }

        .info {
            color: #666;
            font-size: 14px;
        }

        .stats {
            margin-top: 25px;
            display: flex;
            gap: 20px;
        }

        .stat-card {
            flex: 1;
            padding: 20px;
            border-radius: 8px;
            color: white;
        }

        .blue { background: #3498db; }
        .green { background: #2ecc71; }
        .orange { background: #f39c12; }

    </style>
</head>

<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="admin-dashboard.jsp">Dashboard</a>
    <a href="viewLeaves">View Leave Requests</a>
    <a href="login.jsp">Logout</a>
</div>

<div class="content">
    <div class="card">
        <div class="welcome">
            Welcome Admin
        </div>
        <div class="info">
            Manage employee leave requests and approvals.
        </div>

        <div class="stats">
            <div class="stat-card blue">
                Total Requests
            </div>

            <div class="stat-card green">
                Approved Leaves
            </div>

            <div class="stat-card orange">
                Pending Leaves
            </div>
        </div>

    </div>
</div>

</body>
</html>
