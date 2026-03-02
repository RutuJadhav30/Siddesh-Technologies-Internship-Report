CREATE DATABASE employee_db;
USE employee_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100)
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

CREATE TABLE salaries (
    emp_id INT PRIMARY KEY,
    salary DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO departments (dept_name) VALUES
('HR'),
('IT'),
('Finance');

INSERT INTO employees (name, dept_id, manager_id) VALUES
('Rutuja Jadhav', 1, NULL),
('Riya Jadhav', 2, NULL),
('Rahul Patil', 2, 2),
('Sneha Wagh', 1, 1),
('Kiran Mehta', 3, NULL),
('Ram Joshi', 3, 5),
('Rohan Kulkarni', 2, 2),
('Anjali Desai', 1, 1);

INSERT INTO projects (project_name) VALUES
('Website Development'),
('Mobile App'),
('Software Development');


INSERT INTO employee_projects VALUES
(1,1),
(2,1),
(2,2),
(3,1),
(3,2),
(4,3),
(5,3),
(6,3),
(7,2),
(8,1);

INSERT INTO salaries VALUES
(1,70000),
(2,90000),
(3,60000),
(4,50000),
(5,85000),
(6,55000),
(7,65000),
(8,48000);
