/*
-- employees 테이블 생성
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- departments 테이블 생성
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- 데이터 삽입
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

/* 내부조인 (= 동등조인) */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

/* 왼쪽 외부조인 */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* 오른쪽 외부조인 */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* 완전 외부조인 */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

/* 자연 조인 */
/*
SELECT *
FROM employees
NATURAL JOIN departments;
*/

/* MSSQL에는 자연조인을 지원안함
동일한 결과 쿼리
SELECT e.emp_id, e.emp_name, e.dept_id, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
*/

/* 세미 조인 */
SELECT e.emp_id, e.emp_name
FROM employees e
WHERE EXISTS (SELECT 1 FROM departments d WHERE e.dept_id = d.dept_id);

/* 세타 조인 */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e, departments d
WHERE e.dept_id = d.dept_id;

/* 크로스 조인 */
SELECT e.emp_id, e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;

/* 셀프조인(employees 사용) */
SELECT e.emp_id AS EmployeeID, e.emp_name AS EmployeeName, m.emp_id AS ManagerID, m.emp_name AS ManagerName
FROM employees e
LEFT JOIN employees m
ON e.dept_id = m.dept_id AND e.emp_id != m.emp_id;

/* MSSQL에는 자연조인을 지원안함
동일한 결과 쿼리 */
SELECT e.emp_id, e.emp_name, e.dept_id, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

drop table employees;

/* 셀프 조인 */
-- employees 테이블 생성 (manager_id 추가)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT
);
-- 데이터 삽입 (manager_id 포함)
INSERT INTO employees (emp_id, emp_name, dept_id, manager_id) VALUES
(1, 'Alice', 1, NULL),   -- Alice는 매니저가 없음
(2, 'Bob', 2, 1),        -- Bob의 매니저는 Alice
(3, 'Charlie', 3, 1),    -- Charlie의 매니저는 Alice
(4, 'David', NULL, 2);   -- David의 매니저는 Bob

select * from employees;

SELECT e.emp_id AS EmployeeID, e.emp_name AS EmployeeName, m.emp_name AS ManagerName
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;

/* 셀프 조인 (수제비) */ 
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
-- employees 테이블 생성
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- departments 테이블 생성
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- employees 데이터 삽입
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 3),
(5, 'Eva', 2),
(6, 'Frank', 4),
(7, 'George', 4);

-- departments 데이터 삽입
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

-- employees 테이블 생성
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- salaries 테이블 생성
CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2),
    PRIMARY KEY(emp_id)
);

-- employees 데이터 삽입
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 3),
(5, 'Eva', 2),
(6, 'Frank', 4),
(7, 'George', 4);

-- salaries 데이터 삽입
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

--IN 연산
-- 부서 ID가 2 또는 3인 직원 조회
SELECT emp_name
FROM employees
WHERE dept_id IN (2, 3);

--ANY 연산
-- 직원의 월급이 50000 이상인 직원 중 월급이 적어도 한 명이라도 48000보다 많은 경우
SELECT emp_name
FROM employees
WHERE emp_id = ANY (SELECT emp_id FROM salaries WHERE salary > 48000);

--ALL 연산
-- 모든 직원의 월급이 48000 이상인 경우,
-- 월급이 50000 미만인 직원들의 이름을 조회합니다.
SELECT emp_name
FROM employees
WHERE emp_id = ALL (SELECT emp_id FROM salaries WHERE salary < 48000);

--EXISTS 연산
-- 부서 ID가 1인 직원이 존재하는지 확인
SELECT emp_name
FROM employees
WHERE EXISTS (SELECT 1 FROM employees WHERE dept_id = 1);
