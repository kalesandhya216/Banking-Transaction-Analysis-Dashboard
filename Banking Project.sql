
-- create database

CREATE DATABASE banking_project;

-- use database banking_project

USE banking_project;

-- create table customers

CREATE TABLE Customers(
	Customer_Id VARCHAR(20),
    Customer_Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(50),
    Account_Type VARCHAR(50)
); 

-- create table accounts

CREATE TABLE Accounts(
	Account_Id VARCHAR(20),
    Customer_Id VARCHAR(20),
    Balance DECIMAL(10, 2),
    Account_Status VARCHAR(20)
);


-- create table transactions

CREATE TABLE Transactions(
	Transaction_Id VARCHAR(20),
    Customer_Id VARCHAR(20),
    Account_Id VARCHAR(20),
    Transaction_date DATE,
    Amount DECIMAL(10, 2),
    Transaction_Type VARCHAR(20),
    Is_Fraud VARCHAR(5)
);


-- View Tables

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;


-- Select specific columns

SELECT Customer_Name, City 
FROM Customers;


-- Find transactions where type is Debit

SELECT * 
FROM Transactions
WHERE Transaction_Type = 'Debit';


-- Total number of transactions

SELECT COUNT(*) AS Total_Transactions 
FROM Transactions;


-- Total transaction amount

SELECT SUM(Amount) AS Total_Amount 
FROM Transactions;


-- Find fraud transactions

SELECT * 
FROM Transactions
WHERE Is_Fraud = 'Yes';


-- Total transactions by type

SELECT Transaction_Type, COUNT(*) AS Total_Transactions 
FROM Transactions
GROUP BY Transaction_Type;


-- Total amount by transaction type

SELECT Transaction_Type, SUM(Amount) AS Total_Amount 
FROM Transactions
GROUP BY Transaction_Type;


-- Customers per city

SELECT City, COUNT(*) AS Total_Customers 
FROM Customers
GROUP BY City;


-- Transaction amount per customer 

SELECT c.Customer_Name, t.Amount 
FROM Customers c
INNER JOIN Transactions t
ON c.Customer_ID = t.Customer_ID;


-- Total amount per customer 

SELECT c.Customer_Name, SUM(t.Amount) AS Total_Amount 
FROM Customers c
INNER JOIN Transactions t
ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Name;


-- Total fraud transactions

SELECT COUNT(*) AS Total_Fraud_Transactions 
FROM Transactions
WHERE Is_Fraud = 'Yes';


-- Number of transactions per customer 

SELECT Customer_ID, COUNT(*) AS Total_Transactions 
FROM Transactions
GROUP BY Customer_ID;


-- Number of transactions per customer

SELECT c.Customer_Name, COUNT(t.Transaction_ID) AS Total_Transactions 
FROM Customers c
INNER JOIN Transactions t
ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Name;


-- Top 5 customers by total amount

SELECT c.Customer_Name, SUM(t.Amount) AS Total_Amount 
FROM Customers c
INNER JOIN Transactions t 
ON c.Customer_ID = t.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Amount DESC
LIMIT 5;


-- Transaction amount by city

SELECT c.City, SUM(t.Amount) AS Total_Amount 
FROM Customers c
INNER JOIN Transactions t
ON c.Customer_ID = t.Customer_ID
GROUP BY c.City;


-- Fraud vs Non-Fraud count

SELECT Is_Fraud, COUNT(*) AS Total_Count 
FROM Transactions
GROUP BY Is_Fraud;


-- Fraud transactions by city

SELECT c.City, COUNT(*) AS Fraud_Transactions 
FROM Customers c
INNER JOIN Transactions t 
ON c.Customer_ID = t.Customer_ID
WHERE t.Is_Fraud = 'Yes'
GROUP BY c.City;


-- Fraud transactions by type

SELECT Transaction_Type, COUNT(*) AS Fraud_Transactions 
FROM Transactions 
WHERE Is_Fraud = 'Yes'
GROUP BY Transaction_Type;


-- Daily transaction count

SELECT Transaction_Date, COUNT(*) AS Total_Transactions 
FROM Transactions
GROUP BY Transaction_Date;


-- Show customer name, account balance and transaction amount.

SELECT c.Customer_Name, a.Balance, t.Amount FROM Customers c 
JOIN Accounts a 
ON c.Customer_Id = a.Customer_Id 
JOIN Transactions t 
ON a.Account_Id = t.Account_Id;


-- Total transaction amount with account balance per customer

SELECT c.Customer_Name, a.Balance, SUM(t.Amount) AS Total_Transaction_Amount FROM Customers c 
JOIN Accounts a 
ON c.Customer_Id = a.Customer_Id
JOIN Transactions t 
ON a.Account_Id = t.Account_Id
GROUP BY c.Customer_Name, a.Balance;


-- Number of transactions per account 

SELECT a.Account_Id, COUNT(*) AS Total_Transactions FROM Accounts a 
JOIN Transactions t 
ON a.Account_Id = t.Account_Id 
GROUP BY a.Account_Id;


-- Total balance by account status

SELECT Account_Status, SUM(Balance) AS Total_Balance FROM Accounts
GROUP BY Account_Status;


-- Transaction amount by account status

SELECT a.Account_Status, SUM(Amount) AS Total_Transaction_Amount FROM Accounts a 
JOIN Transactions t 
ON a.Account_Id = t.Account_Id
GROUP BY a.Account_Status;


-- Fraud transactions with account status

SELECT a.Account_Status, COUNT(*) AS Fraud_Transactions FROM Accounts a 
JOIN Transactions t 
ON a.Account_Id = t.Account_Id
WHERE Is_Fraud = 'Yes'
GROUP BY a.Account_Status;


-- Average transaction amount per account

SELECT a.Account_Id, AVG(t.Amount) AS Avg_Transaction_Amount FROM Accounts a 
JOIN Transactions t 
ON a.Account_Id = t.Account_Id 
GROUP BY a.Account_Id;


-- Customer with highest account balance

SELECT c.Customer_Name, a.balance FROM Customers c
JOIN Accounts a 
ON c.Customer_Id = a.Customer_Id
ORDER BY a.Balance DESC
LIMIT 5;




















































































