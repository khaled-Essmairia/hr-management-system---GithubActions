-- ============================================================
-- Converted from MySQL syntax to SQL Server (T-SQL)
-- Creates hr_dev_db, hr_test_db, hr_prod_db
-- Run this in SSMS (connected as sa or an admin login)
-- ============================================================

-- =================== hr_dev_db ===================
IF DB_ID('hr_dev_db') IS NOT NULL
BEGIN
    ALTER DATABASE hr_dev_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE hr_dev_db;
END
GO

CREATE DATABASE hr_dev_db;
GO

USE hr_dev_db;
GO

CREATE TABLE departments (
    deptno INT NOT NULL,
    dname  VARCHAR(100) NULL,
    loc    VARCHAR(100) NULL
);
GO

CREATE TABLE employees (
    empno    INT NOT NULL,
    ename    VARCHAR(100) NULL,
    job      VARCHAR(100) NULL,
    mgr      INT NULL,
    hiredate DATE NULL,
    sal      DECIMAL(7,2) NULL,
    comm     DECIMAL(7,2) NULL,
    deptno   INT NULL
);
GO

CREATE TABLE users_credentials (
    user_id         INT IDENTITY(1,1) NOT NULL,
    email           VARCHAR(255) NULL,
    enabled         BIT NULL,
    password        VARCHAR(255) NULL,
    phone           VARCHAR(255) NULL,
    role            VARCHAR(255) NULL,
    username        VARCHAR(255) NULL,
    employee_empno  INT NULL
);
GO

INSERT INTO employees (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(120, 'Selim Horri', 'Software Developer', 7782, '2019-04-15', 900.00, NULL, 10),
(121, 'Amine Ladjimi', 'Accountant', 7782, '2020-01-01', 800.00, NULL, 10),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
GO

INSERT INTO departments (deptno, dname, loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
GO

SET IDENTITY_INSERT users_credentials ON;
INSERT INTO users_credentials (user_id, username, password, enabled, role) VALUES
(1, 'selimhorri', '$2y$12$g1zWC1G1Ywl7pQzfsuj86uMI2XsK8QQuhpYL7LR7C1JIkwdYzTskG', 1, 'ROLE_ADMIN'), -- 0000
(2, 'amineladjimi', '$2y$12$UVxchYn/NzwNIOX4cAJix.B8Hst444hutFwBDHLPXIEmvjhicZx.S', 1, 'ROLE_EMP'); -- 0000
SET IDENTITY_INSERT users_credentials OFF;
GO

ALTER TABLE departments ADD CONSTRAINT PK_departments_dev PRIMARY KEY (deptno);
ALTER TABLE employees   ADD CONSTRAINT PK_employees_dev PRIMARY KEY (empno);
ALTER TABLE users_credentials ADD CONSTRAINT PK_users_credentials_dev PRIMARY KEY (user_id);
ALTER TABLE users_credentials ADD CONSTRAINT UK_users_credentials_dev UNIQUE (username);
GO

ALTER TABLE employees
  ADD CONSTRAINT fk_deptno_dev FOREIGN KEY (deptno) REFERENCES departments (deptno);

ALTER TABLE users_credentials
  ADD CONSTRAINT FK_users_credentials_emp_dev FOREIGN KEY (employee_empno) REFERENCES employees (empno);
GO

-- =================== hr_test_db ===================
IF DB_ID('hr_test_db') IS NOT NULL
BEGIN
    ALTER DATABASE hr_test_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE hr_test_db;
END
GO

CREATE DATABASE hr_test_db;
GO

USE hr_test_db;
GO

CREATE TABLE departments (
    deptno INT NOT NULL,
    dname  VARCHAR(100) NULL,
    loc    VARCHAR(100) NULL
);
GO

CREATE TABLE employees (
    empno    INT NOT NULL,
    ename    VARCHAR(100) NULL,
    job      VARCHAR(100) NULL,
    mgr      INT NULL,
    hiredate DATE NULL,
    sal      DECIMAL(7,2) NULL,
    comm     DECIMAL(7,2) NULL,
    deptno   INT NULL
);
GO

CREATE TABLE users_credentials (
    user_id         INT IDENTITY(1,1) NOT NULL,
    email           VARCHAR(255) NULL,
    enabled         BIT NULL,
    password        VARCHAR(255) NULL,
    phone           VARCHAR(255) NULL,
    role            VARCHAR(255) NULL,
    username        VARCHAR(255) NULL,
    employee_empno  INT NULL
);
GO

INSERT INTO employees (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(120, 'Selim Horri', 'Software Developer', 7782, '2019-04-15', 900.00, NULL, 10),
(121, 'Amine Ladjimi', 'Accountant', 7782, '2020-01-01', 800.00, NULL, 10),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
GO

INSERT INTO departments (deptno, dname, loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
GO

SET IDENTITY_INSERT users_credentials ON;
INSERT INTO users_credentials (user_id, username, password, enabled, role) VALUES
(1, 'selimhorri', '$2y$12$g1zWC1G1Ywl7pQzfsuj86uMI2XsK8QQuhpYL7LR7C1JIkwdYzTskG', 1, 'ROLE_ADMIN'), -- 0000
(2, 'amineladjimi', '$2y$12$UVxchYn/NzwNIOX4cAJix.B8Hst444hutFwBDHLPXIEmvjhicZx.S', 1, 'ROLE_EMP'); -- 0000
SET IDENTITY_INSERT users_credentials OFF;
GO

ALTER TABLE departments ADD CONSTRAINT PK_departments_test PRIMARY KEY (deptno);
ALTER TABLE employees   ADD CONSTRAINT PK_employees_test PRIMARY KEY (empno);
ALTER TABLE users_credentials ADD CONSTRAINT PK_users_credentials_test PRIMARY KEY (user_id);
ALTER TABLE users_credentials ADD CONSTRAINT UK_users_credentials_test UNIQUE (username);
GO

ALTER TABLE employees
  ADD CONSTRAINT fk_deptno_test FOREIGN KEY (deptno) REFERENCES departments (deptno);

ALTER TABLE users_credentials
  ADD CONSTRAINT FK_users_credentials_emp_test FOREIGN KEY (employee_empno) REFERENCES employees (empno);
GO

-- =================== hr_prod_db ===================
IF DB_ID('hr_prod_db') IS NOT NULL
BEGIN
    ALTER DATABASE hr_prod_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE hr_prod_db;
END
GO

CREATE DATABASE hr_prod_db;
GO

USE hr_prod_db;
GO

CREATE TABLE departments (
    deptno INT NOT NULL,
    dname  VARCHAR(100) NULL,
    loc    VARCHAR(100) NULL
);
GO

CREATE TABLE employees (
    empno    INT NOT NULL,
    ename    VARCHAR(100) NULL,
    job      VARCHAR(100) NULL,
    mgr      INT NULL,
    hiredate DATE NULL,
    sal      DECIMAL(7,2) NULL,
    comm     DECIMAL(7,2) NULL,
    deptno   INT NULL
);
GO

CREATE TABLE users_credentials (
    user_id         INT IDENTITY(1,1) NOT NULL,
    email           VARCHAR(255) NULL,
    enabled         BIT NULL,
    password        VARCHAR(255) NULL,
    phone           VARCHAR(255) NULL,
    role            VARCHAR(255) NULL,
    username        VARCHAR(255) NULL,
    employee_empno  INT NULL
);
GO

INSERT INTO employees (empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(120, 'Selim Horri', 'Software Developer', 7782, '2019-04-15', 900.00, NULL, 10),
(121, 'Amine Ladjimi', 'Accountant', 7782, '2020-01-01', 800.00, NULL, 10),
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1982-12-09', 3000.00, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1983-01-12', 1100.00, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
GO

INSERT INTO departments (deptno, dname, loc) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');
GO

SET IDENTITY_INSERT users_credentials ON;
INSERT INTO users_credentials (user_id, username, password, enabled, role) VALUES
(1, 'khaled', '$2y$12$g1zWC1G1Ywl7pQzfsuj86uMI2XsK8QQuhpYL7LR7C1JIkwdYzTskG', 1, 'ROLE_ADMIN'), -- 0000
(2, 'khaled123', '$2y$12$UVxchYn/NzwNIOX4cAJix.B8Hst444hutFwBDHLPXIEmvjhicZx.S', 1, 'ROLE_EMP'); -- 0000
SET IDENTITY_INSERT users_credentials OFF;
GO

ALTER TABLE departments ADD CONSTRAINT PK_departments_prod PRIMARY KEY (deptno);
ALTER TABLE employees   ADD CONSTRAINT PK_employees_prod PRIMARY KEY (empno);
ALTER TABLE users_credentials ADD CONSTRAINT PK_users_credentials_prod PRIMARY KEY (user_id);
ALTER TABLE users_credentials ADD CONSTRAINT UK_users_credentials_prod UNIQUE (username);
GO

ALTER TABLE employees
  ADD CONSTRAINT fk_deptno_prod FOREIGN KEY (deptno) REFERENCES departments (deptno);

ALTER TABLE users_credentials
  ADD CONSTRAINT FK_users_credentials_emp_prod FOREIGN KEY (employee_empno) REFERENCES employees (empno);
GO