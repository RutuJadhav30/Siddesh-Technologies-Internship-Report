<!DOCTYPE html>
<html>
<head>
    <title>Leave Management System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            background: linear-gradient(135deg, #2c3e50, #4ca1af);
        }

        .left {
            flex: 1;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .left h1 {
            font-size: 38px;
            font-weight: 600;
        }

        .right {
            flex: 1;
            background: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: white;
            padding: 40px;
            width: 360px;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .login-card h2 {
            margin-bottom: 25px;
            text-align: center;
            color: #2c3e50;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #2c3e50;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background: #1a252f;
        }

        .footer {
            margin-top: 15px;
            font-size: 13px;
            text-align: center;
            color: #777;
        }
    </style>
</head>

<body>

<div class="left">
    <h1>Leave Management System</h1>
</div>

<div class="right">
    <div class="login-card">
        <h2>Login</h2>

        <form action="login" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Sign In</button>
        </form>

        <div class="footer">
            Admin & Employee Access
        </div>
    </div>
</div>

</body>
</html>
