<%@ page import="java.util.*" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Leave Status</title>
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

        .card {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: #2c3e50;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f2f2f2;
        }

        .status {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            color: white;
            display: inline-block;
        }

        .Pending { background: orange; }
        .Approved { background: green; }
        .Rejected { background: red; }

        .no-data {
            margin-top: 20px;
            color: #777;
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
        <h2>My Leave Requests</h2>

        <%
            List<String[]> leaveData = (List<String[]>) request.getAttribute("leaveData");

            if (leaveData != null && !leaveData.isEmpty()) {
        %>

        <table>
            <tr>
                <th>From Date</th>
                <th>To Date</th>
                <th>Reason</th>
                <th>Status</th>
            </tr>

            <%
                for(String[] row : leaveData){
            %>
            <tr>
                <td><%= row[0] %></td>
                <td><%= row[1] %></td>
                <td><%= row[2] %></td>
                <td>
                    <span class="status <%= row[3] %>">
                        <%= row[3] %>
                    </span>
                </td>
            </tr>
            <% } %>

        </table>

        <% } else { %>
            <div class="no-data">
                No leave requests found.
            </div>
        <% } %>

    </div>
</div>

</body>
</html>
