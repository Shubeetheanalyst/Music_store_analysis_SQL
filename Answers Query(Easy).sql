--Q1) Who is the senior most employee based on job title?
Select * From employee
ORDER BY levels desc
LIMIT 1

-- Q2) Which countries have the most Invoices?
Select COUNT(*) as c, billing_country
FROM invoice
Group by billing_country
order by c desc

-- Q3) What are top 3 values of total invoice?
SELECT total AS Total_Invoices FROM invoice
order by total desc
LIMIT 3

-- Q4) Which city has the best customers? We would like to throw a promotional 
--     Music Festival in the city we made the most money. 
--     Write a query that returns one city that has the highest sum of invoice totals. 
--     Return both the city name & sum of all invoice totals
Select SUM(total) as total_invoice, billing_city 
from invoice
Group by billing_city
order by total_invoice desc

-- Q5) Who is the best customer? The customer who has spent the most money will be declared the best customer.
--     Write a query that returns the person who has spent the most money
Select customer.customer_id, customer.first_name, last_name, SUM(invoice.total) as total
From customer
Join invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
Limit 1