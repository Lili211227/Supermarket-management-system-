Supermarket Management System

A SQL-based database system for managing supermarket operations including inventory, sales, customers, and suppliers.

Features

· Inventory Management - Track products and stock levels
· Sales Processing - Handle transactions and billing
· Customer Database - Manage customer information
· Reporting - Generate sales and inventory reports

Technology

· Database: SQL PostgreSQL
· Key Concepts: Database normalization, stored procedures, complex queries

Database Tables

· Products, Customers, Suppliers
· Inventory, Sales, Employees

Setup

1. Create database: CREATE DATABASE supermarket_db;
2. Import schema file
3. Load sample data

Sample Query

```sql
-- Check low stock products
SELECT product_name, current_stock 
FROM products 
WHERE current_stock <= minimum_stock;
