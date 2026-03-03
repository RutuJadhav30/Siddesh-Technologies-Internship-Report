# 📊 E-Commerce Analytics Dashboard (Day-10)

A backend analytics dashboard built using Django and Django REST Framework.

This project analyzes e-commerce order data and provides business insights via a REST API.

---

## 🚀 Technologies Used

- Python 3.x
- Django
- Django REST Framework
- NumPy
- SQLite
- JSON

---

## 📦 Dependencies

Install the following packages:

```
pip install django
pip install djangorestframework
pip install numpy
```

Or install all at once:

```
pip install -r requirements.txt
```

---

## 🔗 API Endpoint

After running the server, open:

```
http://127.0.0.1:8000/api/dashboard/
```

Admin Panel:

```
http://127.0.0.1:8000/admin/
```

---

## 📈 Features

- Product Management
- Order & Order Item Tracking
- Total Revenue Calculation
- Average Order Value
- Total Products Sold
- Analytics Dashboard API

---

## 🖥️ Project Screenshot

![Dashboard Screenshot](screenshot/1.png)

---
![Dashboard Screenshot](screenshot/2.png)

---
![Dashboard Screenshot](screenshot/3.png)

---
![Dashboard Screenshot](screenshot/4.png)

---


## ⚙️ How to Run the Project

1️⃣ Navigate to project folder  
2️⃣ Create virtual environment:

```
python -m venv venv
```

3️⃣ Activate virtual environment:

Windows:
```
venv\Scripts\activate
```

4️⃣ Install dependencies:

```
pip install -r requirements.txt
```

5️⃣ Apply migrations:

```
python manage.py migrate
```

6️⃣ Run server:

```
python manage.py runserver
```

