-- Setup for OCBC Banking
-- Create Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Accounts Table
CREATE TABLE accounts (
    account_id SERIAL PRIMARY KEY,
    branch_id INT NOT NULL,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Transactions Table
CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT NOT NULL,
    type VARCHAR(20) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Insert Fake Data into Customers
INSERT INTO customers (customer_id, first_name, last_name, email, phone_number, created_at)
VALUES 
(1,'John', 'Doe', 'john.doe@example.com', '555-1234', '2023-01-01 09:00:00'),
(2, 'Jane', 'Doe', 'jane.doe@example.com', '555-5678', '2023-01-01 09:00:00'),
(3, 'Alex', 'Smith', 'alex.smith@example.com', '555-2345', '2023-01-01 09:00:00'),
(4, 'Maria', 'Garcia', 'maria.garcia@example.com', '555-6789', '2023-01-01 09:00:00'),
(5, 'Michael', 'Brown', 'michael.brown@example.com', '555-3456', '2023-01-01 09:00:00'),
(6, 'Linda', 'Williams', 'linda.williams@example.com', '555-7890', '2023-01-01 09:00:00'),
(7, 'Robert', 'Jones', 'robert.jones@example.com', '555-4567', '2023-01-01 09:00:00');

-- Insert Fake Data into Accounts
INSERT INTO accounts (account_id, branch_id, customer_id, account_type, balance, created_at)
VALUES 
(501, 901, 1, 'Checking', 1000.00, '2023-01-02 09:00:00'),
(502, 902, 2, 'Savings', 1500.00, '2023-01-02 09:01:00'),
(503, 902, 3, 'Checking', 500.00, '2023-01-02 09:02:00'),
(504, 901, 3, 'Savings', 2500.00, '2023-01-02 09:03:00'),
(505, 901, 4, 'Checking', 750.00, '2023-01-02 09:04:00'),
(506, 903, 5, 'Savings', 1200.00, '2023-01-02 09:05:30'),
(507, 903, 5, 'Checking', 950.00, '2023-01-02 09:06:00'),
(508, 903, 6, 'Savings', 600.00, '2023-01-03 09:07:00'),
(509, 903, 7, 'Checking', 460.00, '2023-01-04 09:07:15');

-- Insert Fake Transactions
INSERT INTO transactions (account_id, type, amount, transaction_date)
VALUES 
(1001, 1, 'Deposit', 100.00, '2023-01-02 09:00:00'),
(1002, 1, 'Withdrawal', 50.00, '2023-01-03 10:00:00'),
(1003, 2, 'Deposit', 200.00, '2023-02-01 11:00:00'),
(1004, 2, 'Withdrawal', 100.00, '2023-02-05 09:30:00'),
(1005, 3, 'Deposit', 500.00, '2023-03-12 14:00:00'),
(1006, 3, 'Withdrawal', 150.00, '2023-03-13 16:00:00'),
(1007, 4, 'Deposit', 750.00, '2023-04-10 10:00:00'),
(1008, 4, 'Withdrawal', 350.00, '2023-04-11 11:30:00'),
(1009, 5, 'Deposit', 950.00, '2023-05-15 13:45:00'),
(1010, 5, 'Withdrawal', 450.00, '2023-05-18 15:00:00'),
(1011, 6, 'Deposit', 1200.00, '2023-06-20 09:00:00'),
(1012, 6, 'Withdrawal', 200.00, '2023-06-21 10:20:00'),
(1013, 7, 'Deposit', 1420.00, '2023-07-25 14:00:00'),
(1014, 7, 'Withdrawal', 500.00, '2023-07-26 16:30:00'),
(1015, 8, 'Deposit', 1600.00, '2023-08-27 12:00:00'),
(1016, 8, 'Withdrawal', 600.00, '2023-08-28 14:45:00'),
(1017, 9, 'Deposit', 1850.00, '2023-09-29 10:15:00'),
(1018, 9, 'Withdrawal', 750.00, '2023-09-30 11:50:00');
