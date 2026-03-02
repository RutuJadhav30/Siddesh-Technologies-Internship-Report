<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply Leave</title>
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
        }

        .sidebar a {
            display: block;
            padding: 14px 25px;
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .sidebar a:hover {
            background: #34495e;
        }

        .content {
            margin-left: 230px;
            padding: 40px;
        }

        .form-card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            width: 500px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        label {
            font-size: 14px;
            color: #555;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            padding: 10px 20px;
            background: #2c3e50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background: #1a252f;
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
    <div class="form-card">
        <h2>Apply for Leave</h2>

        <form action="applyLeave" method="post">
            <label>From Date</label>
            <input type="date" name="fromDate" required>

            <label>To Date</label>
            <input type="date" name="toDate" required>

            <label>Reason</label>
            <textarea name="reason" rows="4" required></textarea>

            <button type="submit">Submit Request</button>
        </form>
    </div>
</div>

</body>
</html>
