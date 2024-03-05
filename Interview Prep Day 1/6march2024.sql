-- SQL Interview Questions for Data Science

-- Common Interview Questions
-- Write a query to add multiple rows in a table
-- Write a query to add/delete multiple cols in a table
-- Write a query to find out the 2nd highest value in a table
-- Find max value without using ORDER BY
-- Find managers of all employees
-- Use of wild cards
-- If else based questions
-- Find category-wise top value
-- Find/delete all the duplicate values
-- Joining tables

-- Write a query to add multiple rows in a table
INSERT INTO users VALUES 
(NULL,'Romi',18,10),
(NULL,'Akash',27,17),
(NULL,'Himanshu',28,40);
-- and more rows like this 

-- Write a query to add/delete multiple cols in a table
ALTER TABLE users 
ADD email VARCHAR(255) NOT NULL,
ADD password VARCHAR(255) NOT NULL;

-- Write a query to find out the 2nd highest value in a table
SELECT MAX(age) AS '2nd_Highest' FROM users 
WHERE age < (SELECT MAX(age) FROM users);

-- Find max value without using ORDER BY
SELECT MAX(age) FROM users 
LIMIT 1 ;
-- OR 
SELECT name,age FROM users 
WHERE age = (SELECT MAX(age) FROM users);

-- Find managers of all employees
SELECT e1.fname,e2.fname FROM emplyoee e1 JOIN employee e2 
ON  e1.manager_id=e2.id;

-- Use of wild cards
SELECT name,rating,genre FROM movies 
WHERE country LIKE "United%";
-- OR 
SELECT name,rating,genre FROM movies 
WHERE genre LIKE "_r%";

-- If else based questions
SELECT name,genre,
CASE 
	WHEN genre="Drama" THEN 'Pagal'
	WHEN genre = "Crime" THEN 'Fear'
	ELSE 'Moye Na Pta :)' END 'Reaction'
FROM movies ;

-- Find category-wise top value
SELECT genre,MAX(score) FROM movies 
GROUP BY genre;

-- Find/delete all the duplicate values
SELECT name,company,COUNT(name) FROM movies 
GROUP BY name,company
HAVING COUNT(*)>1;
-- FOR DELETE 
DELETE t1 
FROM movies t1, movies t2 
WHERE t1.id > t2.id 
AND t1.column1 = t2.column1 
AND t1.column2 = t2.column2;

-- Joining tables
SELECT * FROM movies m
LEFT OUTER JOIN users u 
ON m.id=u.id 
RIGHT OUTER JOIN membership p
ON p.user_id=m.id;

-- Theory Questions
-- SQL Vs NoSQL Databases
-- Tables required for many to many relationship
-- Draw schema design for swiggy.
-- Types of Joins -> Union Vs Union All
-- OLAP Vs OLTP [Normalized Vs Denormalized Data]
-- Database keys
-- Types of normalization
-- What are indexes in Databases and what are it’s types
-- What are transactions in databases? Explain ACID properties.
-- Define Views and Stored Procedures

SQL vs NoSQL Databases:
Question: Can you explain the difference between SQL and NoSQL databases?
Answer: SQL databases are relational, using structured query language. NoSQL databases are non-relational, providing flexible schema design.
Example: MySQL is an SQL database, while MongoDB is a NoSQL database.

Tables required for many-to-many relationship:
Question: How do you handle a many-to-many relationship in a database schema?
Answer: You create a junction table that connects the primary keys of the two related tables.
Example: In a library database, a Books table and an Authors table would have a junction table Book_Author.

Draw schema design for Swiggy:
Question: Can you sketch the schema design for an online food delivery platform like Swiggy?
Answer: The schema would include tables for Users, Restaurants, Orders, and Items, with appropriate relationships between them.

Types of Joins - Union vs Union All:
Question: Explain the difference between UNION and UNION ALL in SQL.
Answer: UNION combines result sets and removes duplicates, while UNION ALL retains duplicates.
Example: SELECT name FROM table1 UNION SELECT name FROM table2;

OLAP vs OLTP (Normalized vs Denormalized Data):
Question: Differentiate between OLAP and OLTP databases and their data models.
Answer: OLAP databases are for analytics, OLTP databases handle transactions. 
Normalized data reduces redundancy, while denormalized data improves query performance.

Database keys:
Question: What are primary keys and foreign keys in a database?
Answer: Primary keys uniquely identify records in a table, while foreign keys establish relationships between tables.
Example: In an Orders table, OrderID could be the primary key linked to a CustomerID in a Customers table.

Types of normalization:
Question: Explain the concept of normalization in databases.
Answer: Normalization organizes data into tables to avoid redundancy and dependency, ensuring data integrity.
Example: First Normal Form (1NF) eliminates repeating groups in tables.

Indexes in Databases and its types:
Question: What are database indexes, and what are their types?
Answer: Indexes speed up data retrieval by providing quick access paths. Types include B-tree, Hash, and Bitmap indexes.

Transactions in databases and ACID properties:
Question: Define database transactions and the ACID properties.
Answer: Transactions are sequences of database operations treated as a single unit. ACID properties ensure Atomicity, Consistency, Isolation, and Durability.

Define Views and Stored Procedures:
Question: What are views and stored procedures in a database?
Answer: Views are virtual tables generated by queries, while stored procedures are precompiled SQL scripts stored in the database.
Example: A view could be SELECT * FROM Employees WHERE Department='IT'. A stored procedure could calculate monthly payroll.










