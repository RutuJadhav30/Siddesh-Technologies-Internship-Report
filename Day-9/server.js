const express = require("express");
const app = express();
const PORT = 3000;

// Middleware to read form data
app.use(express.urlencoded({ extended: true }));

// Dummy user
const user = {
  username: "admin",
  password: "1234"
};

// 1️⃣ Login Page (GET request)
app.get("/", (req, res) => {
  res.send(`
    <html>
      <head>
        <title>Login Page</title>
        <style>
          body {
            font-family: Arial;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f2f2f2;
          }
          .box {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
          }
          input {
            width: 200px;
            padding: 8px;
            margin: 10px;
          }
          button {
            padding: 8px 20px;
            background: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
          }
        </style>
      </head>
      <body>
        <div class="box">
          <h2>Login</h2>
          <form method="POST" action="/login">
            <input type="text" name="username" placeholder="Username" required /><br/>
            <input type="password" name="password" placeholder="Password" required /><br/>
            <button type="submit">Login</button>
          </form>
        </div>
      </body>
    </html>
  `);
});

// 2️⃣ Handle Login (POST request)
app.post("/login", (req, res) => {
  const { username, password } = req.body;

  if (username === user.username && password === user.password) {
    res.send("<h2>Login Successful ✅</h2>");
  } else {
    res.send("<h2>Invalid Credentials ❌</h2>");
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});