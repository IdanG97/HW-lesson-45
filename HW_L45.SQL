CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(20),
    phone_number VARCHAR(20),
    work_start_date DATE,
    work_end_date DATE,
    is_manager BOOLEAN,
    manager_id INT,
    FOREIGN KEY(manager_id) REFERENCES employee(id)
);

CREATE TABLE manager_employee (
      employee_id INT NOT NULL,
      manager_id INT NOT NULL,
      PRIMARY KEY(employee_id, manager_id),
      FOREIGN KEY (employee_id) REFERENCES employee(id),
      FOREIGN KEY (manager_id) REFERENCES employee(id)
  );

CREATE TABLE job (
    id INT PRIMARY KEY,
    job_name VARCHAR(20),
    salary DECIMAL
);

CREATE TABLE employee_job (
    employee_id INT NOT NULL,
    job_id INT NOT NULL,
    PRIMARY KEY (employee_id, job_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

ALTER TABLE job 
ADD CONSTRAINT unique_job_name UNIQUE (job_name);

ALTER TABLE employee 
MODIFY work_start_date DATE NOT NULL;

ALTER TABLE job 
ADD CONSTRAINT check_salary CHECK (salary >= 30000);

INSERT INTO employee (id, first_name, last_name, email, phone_number, work_start_date, work_end_date, is_manager, manager_id) 
VALUES 
(1, 'idan', 'gueta', 'idan@email.com', '0501234567', '2020-05-10', NULL, TRUE, NULL),
(2, 'panda', 'black', 'panda@email.com', '0507654321', '2021-06-15', NULL, FALSE, 1),
(3, 'amity', 'gabay', 'amtay@email.com', '0509877891', '2022-08-01', NULL, FALSE, 1);

INSERT INTO manager_employee (employee_id, manager_id) VALUES 
(2, 1),
(3, 1);

INSERT INTO job (id, job_name, salary) VALUES 
(1, 'Software Engineer', 80000),
(2, 'HR Manager', 60000),
(3, 'Accountant', 45000);

INSERT INTO employee_job (employee_id, job_id) VALUES 
(1, 1),
(2, 3),
(3, 2);

SELECT * FROM employee;

SELECT * FROM job;

SELECT * FROM manager_employee;

SELECT * FROM employee_job;
