const http = require("http");

const server = http.createServer((req, res) => {

    res.writeHead(200, { "Content-Type": "text/html" });

    res.end(`
        <html>
            <head>
                <title>Node HTTP Server</title>
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
                        justify-content: center;
                        align-items: center;
                        background: linear-gradient(135deg, #667eea, #764ba2);
                    }

                    .card {
                        background: white;
                        padding: 40px;
                        width: 400px;
                        border-radius: 20px;
                        text-align: center;
                        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
                        animation: fadeIn 1s ease-in-out;
                    }

                    h1 {
                        color: #333;
                        margin-bottom: 15px;
                    }

                    p {
                        color: #555;
                        margin-bottom: 25px;
                    }

                    .btn {
                        display: inline-block;
                        padding: 10px 20px;
                        background: #667eea;
                        color: white;
                        text-decoration: none;
                        border-radius: 8px;
                        transition: 0.3s;
                    }

                    .btn:hover {
                        background: #5a67d8;
                        transform: scale(1.05);
                    }

                    @keyframes fadeIn {
                        from {
                            opacity: 0;
                            transform: translateY(20px);
                        }
                        to {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }
                </style>
            </head>
            <body>
                <div class="card">
                    <h1>Node.js HTTP Server</h1>
                    <p>This webpage is running using the built-in HTTP module.</p>
                    <a href="#" class="btn">Explore More</a>
                </div>
            </body>
        </html>
    `);
});

server.listen(5000, () => {
    console.log("Server running at http://localhost:5000");
});