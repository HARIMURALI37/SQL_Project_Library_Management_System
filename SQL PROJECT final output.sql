/* creating a database named library adding following tables in the database:
1.Branch 2.Employee 3.Books 4.Customers 5.Issue status 6.Return status */

create database library; -- THIS QUERY CREATE DATABASE NAMED LIBRARY --
use  library; -- THIS QUERY SELECTS DATABASE

-- Creating table named Branch in database library --
create table branch (
branch_no int primary key,
manager_id int,
branch_address varchar(20),
contact_no bigint);

-- Inserting values into table branch --
INSERT INTO branch (branch_no, manager_id, branch_address, contact_no)
VALUES
  (1, 101, 'New York', 1234567890),
  (2, 102, 'Los Angeles', 0987654321),
  (3, 103, 'Chicago', 5551112222),
  (4, 104, 'Houston', 3334445555),
  (5, 105, 'Phoenix', 6667778888),
  (6, 106, 'Philadelphia', 2221113333),
  (7, 107, 'San Antonio', 9990001111),
  (8, 108, 'San Diego', 4445556666),
  (9, 109, 'Dallas', 8882223333),
  (10, 110, 'San Jose', 7778889999); 
  select *from branch;
  
-- creating table named employee in database library --
create table employee(
emp_id int primary key,
emp_name varchar(20),
position varchar(20),
salary int,
branch_no int,
foreign key(branch_no) references branch(branch_no));

-- inserting values for table employee --
insert into employee( emp_id,emp_name,position,salary,branch_no) values
('01','ramesh','cleaning','25000','3'),
('02','hima','manager','42000','1'),
('03','subhash','cleaning','25000','1'),
('04','abu','security','35000','3'),
('05','fasal','keeper','55000','2'),
('06','ramesh','manager','40000','3'),
('07','ullas','keeper','51000','3'),
('08','usha','cleaning','55000','4'),
('09','suneesh','security','45000','2'),
('10','maasha','keeper','39000','4'),
('11','ammini','cleaning','40000','2'),
('12','veena','cleaning','41000','5'),
('13','binu','manager','51000','5'),
('14','hima','keeeper','42000','5'),
('15','velu','security','45000','3'),
('16','ancy','cleaning','28000','3');
select *from employee; -- THIS QUERY DISPLAYS TABLE VALUES --

-- creating table named books in database library --
create table books(
isbn int primary key,
book_title varchar(20),
category varchar(20),
Rental_Price DECIMAL(10,2),
Status ENUM('Yes','No'),
Author VARCHAR(30),
Publisher VARCHAR(30)
);
select *from books; -- THIS QUERY SHOWS TABLE --

-- inserting values to the table books --
INSERT INTO books (isbn, book_title, category, Rental_Price, Status, Author, Publisher)
VALUES 
(234567890, 'Book Title 1', 'Fiction', 10.99, 'Yes', 'Author 1', 'Publisher 1'),
(345678901, 'Book Title 2', 'Non-Fiction', 20.99, 'No', 'Author 2', 'Publisher 2'),
(456789012, 'Book Title 3', 'Biography', 15.99, 'Yes', 'Author 3', 'Publisher 3'),
(567890123, 'Book Title 4', 'Self-Help', 25.99, 'No', 'Author 4', 'Publisher 4'),
(678901234, 'Book Title 5', 'History', 30.99, 'Yes', 'Author 5', 'Publisher 5'),
(789012345, 'Book Title 6', 'Science', 22.99, 'Yes', 'Author 6', 'Publisher 6'),
(890123456, 'Book Title 7', 'Romance', 18.99, 'No', 'Author 7', 'Publisher 7'),
(901234567, 'Book Title 8', 'Thriller', 28.99, 'Yes', 'Author 8', 'Publisher 8'),
(012345678, 'Book Title 9', 'Comedy', 19.99, 'No', 'Author 9', 'Publisher 9'),
(123456789, 'Book Title 10', 'Drama', 24.99, 'Yes', 'Author 10', 'Publisher 10');
select *from books; -- THIS QUERY DISPLAYS TABLE VALUES --
 
 -- creating table named customer in database library --
create table Customer (
customer_id int primary key,
customer_name varchar(15),
Customer_address varchar(20),
Reg_date date );
select * from customer; -- THIS QUERY SHOWS TABLE --

-- INSERTING VALUES INTO TABLE CUSTOMER --
INSERT INTO Customer (customer_id, customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Smith', '123 Main St', '2022-01-01'),
(2, 'Jane Doe', '456 Elm St', '2022-01-15'),
(3, 'Bob Brown', '789 Oak St', '2022-02-01'),
(4, 'Alice Johnson', '123 Maple St', '2022-03-01'),
(5, 'Mike Davis', '456 Pine St', '2022-04-01'),
(6, 'Emily Taylor', '789 Cedar St', '2022-05-01'),
(7, 'Sarah Lee', '123 Walnut St', '2022-06-01'),
(8, 'David Hall', '456 Spruce St', '2022-07-01'),
(9, 'Olivia Martin', '789 Fir St', '2022-08-01'),
(10, 'Kevin White', '123 Birch St', '2022-09-01');
select *from customer; -- THIS QUERY SHOWS TABLE --

-- Creating table named issuestatus in database library --
create table IssueStatus (
Issue_id int primary key,
issued_cust int, foreign key(issued_cust) references customer (customer_id) ,
issued_book_name varchar(20),
issue_date date,
ISBN_Book int, foreign key(ISBN_Book) references books (ISBN)); 
select *from issuestatus; -- THIS QUERY SHOWS TABLE --

-- inserting values into table issuestatus --
INSERT INTO IssueStatus (Issue_id, issued_cust, issued_book_name, issue_date, ISBN_Book)
VALUES 
(1, 1, 'Book Title 1', '2022-01-05', 234567890),
(2, 2, 'Book Title 2', '2022-01-10', 345678901),
(3, 3, 'Book Title 3', '2022-02-02', 456789012),
(4, 4, 'Book Title 4', '2022-03-15', 567890123),
(5, 5, 'Book Title 5', '2022-04-20', 678901234),
(6, 6, 'Book Title 6', '2022-05-01', 789012345),
(7, 7, 'Book Title 7', '2022-06-15', 890123456),
(8, 8, 'Book Title 8', '2022-07-01', 901234567),
(9, 9, 'Book Title 9', '2022-08-15', 012345678),
(10, 10, 'Book Title 10', '2022-09-01', 123456789); 
select * from issuestatus; -- THIS QUERY SHOWS TABLE --

-- creating table named returnstatus in database library --
create table ReturnStatus(
Return_id int primary key,
return_cust varchar(15),
return_book_name varchar(20),
return_date date,
ISBN_book2 int, foreign key (ISBN_book2) references books (ISBN));
describe returnstatus; -- THIS QUERY SHOWS ATTRIBUTE OF TABLE CREATED --

-- Inserting values into table returnstatus --
INSERT INTO ReturnStatus (Return_id, return_cust, return_book_name, return_date, ISBN_book2)
VALUES 
(1, 'John Smith', 'Book Title 1', '2022-01-10', 234567890),
(2, 'Jane Doe', 'Book Title 2', '2022-01-17', 345678901),
(3, 'Bob Brown', 'Book Title 3', '2022-02-05', 456789012),
(4, 'Alice Johnson', 'Book Title 4', '2022-03-20', 567890123),
(5, 'Mike Davis', 'Book Title 5', '2022-04-25', 678901234),
(6, 'Emily Taylor', 'Book Title 6', '2022-05-10', 789012345),
(7, 'Sarah Lee', 'Book Title 7', '2022-06-18', 890123456),
(8, 'David Hall', 'Book Title 8', '2022-07-05', 901234567),
(9, 'Olivia Martin', 'Book Title 9', '2022-08-20', 012345678),
(10, 'Kevin White', 'Book Title 10', '2022-09-10', 123456789);
select * from returnstatus; -- THIS QUERY SHOWS TABLE --

show tables; -- THIS WILL SHOW TABLES CREATED IN THE SELECTED DATABASE --


-- QUESTION 1
-- Retrieve the book title, category, and rental price of all available books.
select BOOK_title,category,rental_price from books;

-- QUESTION 2
-- List the employee names and their respective salaries in descending order of salary.
select emp_name,salary from employee order by salary desc;

-- QUESTION 3
-- Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.book_title, c.customer_name
FROM IssueStatus i
JOIN books b ON i.ISBN_Book = b.ISBN
JOIN Customer c ON i.issued_cust = c.customer_id;

-- QUESTION 4
-- Display the total count of books in each category.
select  CATEGORY,COUNT(BOOK_TITLE) FROM BOOKS group by CATEGORY;

-- QUESTION 5
-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select EMP_NAME,POSITION FROM EMPLOYEE where SALARY>50000;

-- QUESTION 6
-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
select customer_name as 'name of not issued customer',reg_date as 'registered date' from customer where reg_date <-'2022-01-01'
and not exists (select return_book_name from returnstatus where return_cust = customer.customer_id);

-- QUESTION 7
-- Display the branch numbers and the total count of employees in each branch.
select BRANCH_NO,count(*)AS TOTAL_EMP FROM EMPLOYEE group by BRANCH_NO;

-- QUESTION 8
-- Display the names of customers who have issued books in the month of June 2023.
select issued_cust from issuestatus where month(issue_date)=6 and year(issue_date)=2023;

-- QUESTION 9
-- Retrieve book_title from book table containing history.
SELECT book_title 
FROM books
WHERE category LIKE '%history%';

-- QUESTION 10
-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT branch_nO, COUNT(emp_id) AS num_employees
FROM employee
GROUP BY branch_nO
HAVING COUNT(emp_id) > 5;

-- QUESTION 11
-- Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.emp_name, b.branch_address
FROM employee e
JOIN branch b ON e.branch_no = b.branch_no
WHERE e.position = 'manager';

-- QUESTION 12
-- Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT customer_name as 'customer name',rental_price as 'price' from issuestatus
inner join customer on customer.customer_id= issuestatus.issued_cust
inner join books on issuestatus.isbn_book = books.isbn where rental_price>25;