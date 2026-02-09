# SQL Music Store Project

## Project Summary

In this project, I used SQL to analyze a digital music store database and answer real business questions about revenue, customers, and popular music. This project strengthened my skills with joins, GROUP BY, and working with relational data.

## About This Project

This is a beginner SQL project where I explored a music store database (Chinook). I used SQL to look through the data and answer business-style questions about sales performance, customer activity, and music trends.

The main goal was to practice writing SQL queries and getting comfortable working with multiple related tables.

## Tools I Used

SQLite
DB Browser for SQLite
Git & GitHub

## Project Folder Layout

SQL_Music_Store_Project/
│
├── data/
├── SQL/
│   ├── 01_exploration.sql
│   ├── 02_business_questions.sql
│   └── 03_advanced.sql
│
└── README.md

## What Each File Does

### 01_exploration.sql
Used to explore the database structure and preview the tables.

### 02_business_questions.sql
Contains queries that answer basic business questions like revenue, top countries, genres, and artists.

### 03_advanced.sql
Includes more advanced queries I practiced, like revenue trends over time and finding customers who haven’t purchased in a while.

## Business Questions I Answered

While working on this project, I used SQL to answer questions a music store might care about:

How much total revenue has the store made?

Which countries bring in the most money?

What genres of music sell the most?

Which artists generate the most revenue?

How has revenue changed over time?

Which customers haven’t bought anything in a long time?

These helped me practice joins, grouping, and aggregate functions in a real-world style scenario.

## Example Queries

### Total Revenue

SELECT SUM(total) AS total_sales
FROM invoices;

### Revenue by Genre

SELECT
    g.Name AS Genre,
    SUM(ii.UnitPrice * ii.Quantity) AS Revenue
FROM invoice_items ii
JOIN tracks t ON ii.TrackId = t.TrackId
JOIN genres g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY Revenue DESC;

### Customers Who Haven't Purchased Recently

SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    t.LastPurchaseDate
FROM customers c
JOIN (
    SELECT CustomerId, MAX(InvoiceDate) AS LastPurchaseDate
    FROM invoices
    GROUP BY CustomerId
) t ON c.CustomerId = t.CustomerId
ORDER BY LastPurchaseDate;

## Interesting Things I Found

Here are a few things I noticed while exploring the data:

Some countries contribute much more to total revenue than others.

A small number of genres and artists make up a large share of total sales.

Revenue changes month to month, and using a running total helped show overall growth.

There are customers who haven’t made a purchase in a long time, which could be a sign of churn in a real business.

## What I Learned

How to join multiple tables together
How to use GROUP BY and SUM for analysis
How to filter and sort results
How to explore a database using SQL
How to organize SQL files into a structured project

## Notes

The database file is stored locally in the data folder and is not uploaded to GitHub.