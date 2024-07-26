/*
-- employees ���̺� ����
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- departments ���̺� ����
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- ������ ����
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', NULL);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales');

select * from employees;
select * from departments;

/* �������� (= ��������) */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

/* ���� �ܺ����� */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* ������ �ܺ����� */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* ���� �ܺ����� */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* �ڿ� ���� */
/*
SELECT *
FROM employees
NATURAL JOIN departments;
*/

/* MSSQL���� �ڿ������� ��������
������ ��� ����
SELECT e.emp_id, e.emp_name, e.dept_id, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
*/

/* ���� ���� */
SELECT e.emp_id, e.emp_name
FROM employees e
WHERE EXISTS (SELECT 1 FROM departments d WHERE e.dept_id = d.dept_id);

/* ��Ÿ ���� */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e, departments d
WHERE e.dept_id = d.dept_id;

/* ũ�ν� ���� */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

/* ��������(employees ���) */
SELECT e.emp_id AS EmployeeID, e.emp_name AS EmployeeName, m.emp_id AS ManagerID, m.emp_name AS ManagerName
FROM employees e
LEFT JOIN employees m
ON e.dept_id = m.dept_id AND e.emp_id != m.emp_id;

/* MSSQL���� �ڿ������� ��������
������ ��� ���� */
SELECT e.emp_id, e.emp_name, e.dept_id, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

drop table employees;

/* ���� ���� */
-- employees ���̺� ���� (manager_id �߰�)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT
);
-- ������ ���� (manager_id ����)
INSERT INTO employees (emp_id, emp_name, dept_id, manager_id) VALUES
(1, 'Alice', 1, NULL),   -- Alice�� �Ŵ����� ����
(2, 'Bob', 2, 1),        -- Bob�� �Ŵ����� Alice
(3, 'Charlie', 3, 1),    -- Charlie�� �Ŵ����� Alice
(4, 'David', NULL, 2);   -- David�� �Ŵ����� Bob

select * from employees;

SELECT e.emp_id AS EmployeeID, e.emp_name AS EmployeeName, m.emp_name AS ManagerName
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;

/* ���� ���� (������) */ 
CREATE TABLE book
(
BookNumber INT,
BookName VARCHAR(10),
FSubjectBookNumber INT
);

INSERT INTO book
VALUES
(111, 'OS', 222),
(222, 'DataStructure', 555),
(555, 'ComputerStructure', NULL);

select * from book;

SELECT A.BookNumber, A.BookName, B.BookNumber, B.BookName
FROM book A JOIN book B
on A.FSubjectBookNumber = B.BookNumber;
*/
/*
-- employees ���̺� ����
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- departments ���̺� ����
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- employees ������ ����
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 3),
(5, 'Eva', 2),
(6, 'Frank', 4),
(7, 'George', 4);

-- departments ������ ����
INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Alice'),
(6, 'Charlie');

select * from employees;
select * from departments;

--UNION
SELECT emp_name AS Name
FROM employees
UNION
SELECT dept_name AS Name
FROM departments;

--UNION ALL
SELECT emp_name AS Name
FROM employees
UNION ALL
SELECT dept_name AS Name
FROM departments;

--INTERSECT
SELECT emp_name AS Name
FROM employees
INTERSECT
SELECT dept_name AS Name
FROM departments;

--MINUS(EXCEPT)
SELECT emp_name AS Name
FROM employees
EXCEPT
SELECT dept_name AS Name
FROM departments;
*/

drop table employees;
drop table departments;

-- employees ���̺� ����
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- salaries ���̺� ����
CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY(emp_id)
);

-- employees ������ ����
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 3),
(5, 'Eva', 2),
(6, 'Frank', 4),
(7, 'George', 4);

-- salaries ������ ����
INSERT INTO salaries (emp_id, salary) VALUES
(1, 60000.00),
(2, 50000.00),
(3, 55000.00),
(4, 45000.00),
(5, 70000.00),
(6, 48000.00),
(7, 52000.00);

select * from employees;
select * from salaries;

--IN ����
-- �μ� ID�� 2 �Ǵ� 3�� ���� ��ȸ
SELECT emp_name
FROM employees
WHERE dept_id IN (2, 3);

--ANY ����
-- ������ ������ 50000 �̻��� ���� �� ������ ��� �� ���̶� 48000���� ���� ���
SELECT emp_name
FROM employees
WHERE emp_id = ANY (SELECT emp_id FROM salaries WHERE salary > 48000);

--ALL ����
-- ��� ������ ������ 48000 �̻��� ���,
-- ������ 50000 �̸��� �������� �̸��� ��ȸ�մϴ�.
SELECT emp_name
FROM employees
WHERE emp_id = ALL (SELECT emp_id FROM salaries WHERE salary < 48000);

--EXISTS ����
-- �μ� ID�� 1�� ������ �����ϴ��� Ȯ��
SELECT emp_name
FROM employees
WHERE EXISTS (SELECT 1 FROM employees WHERE dept_id = 1);
