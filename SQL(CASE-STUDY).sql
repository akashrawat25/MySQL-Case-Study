CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 # Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
 select first_name as WORKER_NAME from worker;
 
 # Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
 select upper(first_name) from worker;
 
 # Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
 select distinct(department) from worker;
 
 # Q-4. Write an SQL query to print the first three characters of FIRST_NAME from the Worker table.
 select substring(first_name,1,3) from worker;
 
# Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select instr(first_name,binary "a") as Name from worker
where first_name = "Amitabh"; 

# Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
select rtrim(first_name) as Name from worker;

# Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select ltrim(first_name) as Name from worker;

# Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select distinct department,length(department) as length from worker;

# Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,"a","A") as Name from worker;

# Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name," " ,last_name) as COMPLETE_NAME from worker;

# Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select first_name from worker
order by first_name asc;

# Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. 
select * from worker
ORDER BY first_name ASC, department desc;

# Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from worker
where first_name in ("vipul","satish");

# Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select * from worker
where first_name not in ("vipul","satish");

# Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
Select * from Worker where DEPARTMENT like 'Admin%';

# Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from worker
where first_name like "%a%";

# Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select * from worker
where first_name like "%a";

# Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker
where first_name like "_____h";

# Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker
where salary between 100000 and 500000;

# Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
select * from worker
where year(joining_date)=2014 and month(joining_date)=2;

# Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(worker_id) as Total_Emp, Department from worker
where department = "admin";

# Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select concat(first_name," ",last_name) as Name, salary from worker
where salary between 50000 and 100000;

# Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
select count(worker_id) as Total_Emp, department from worker
group by (department);

# Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

# Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

# Q-26. Write an SQL query to show only odd rows from a table.
select * from worker
where mod (worker_id,2)<>0;

# Q-27. Write an SQL query to show only even rows from a table.
select * from worker
where mod (worker_id,2)=0;

# Q-28. Write an SQL query to clone a new table without data from another table.
create table dummy_table like worker;
# Clone table with date
create table clone_table as select * from worker;

# Q-29. Write an SQL query to show the current date and time.
select curdate();
select now();

# Q-30. Write an SQL query to show the top n (say 10) records of a table.
select * from worker
order by salary desc limit 10;

# Q-31. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker
order by salary desc limit 5;

# Q-32. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
 # 2nd way to do same thing
select w1.salary from worker w1
where 5-1 = (select count(distinct(w2.salary)) from worker w2
where w2.salary>=w1.salary);
select distinct(salary) from worker
order by salary desc limit 4;

# Q-33. Write an SQL query to fetch the list of employees with the same salary.
select distinct w.worker_id ,w.first_name ,w.salary
from worker w , worker w1
where w.salary = w1.salary
and w.worker_id != w1.worker_id;

# Q-34. Write an SQL query to show the second-highest salary from a table.
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);

# Q-35. Write an SQL query to fetch the first 50% of records from a table.
select * from worker
where worker_id <=(select count(worker_id)/2 from worker);

# Q-36. Write an SQL query to fetch the departments that have less than five people in them.
select count(worker_id) as Total_Emp, department from worker
group by department
having count(worker_id)<5;

# Q-37. Write an SQL query to show all departments along with the number of people in there.
select count(worker_id) as Total_Emp, department from worker
group by department;

# Q-38. Write an SQL query to show the last record from a table.
select * from worker
order by worker_id desc limit 1;
#2nd way to same thing
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

# Q-39. Write an SQL query to fetch the first row of a table.
select * from worker
where worker_id = (select min(worker_id) from worker);
#2nd way to do same thing
select * from worker
order by worker_id asc limit 1;

# Q-40 Q-44. Write an SQL query to fetch the last five records from a table. 
select * from worker 
where worker_id<=5;
# 2nd way to do that same thing
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;

# Q-41. Write an SQL query to print the name of employees having the highest salary in each department.
select t.department,t.first_name,t.salary from(select max(salary) as salary ,department from worker
group by department) as tempnew 
inner join worker t 
on tempnew.department=t.department
and tempnew.salary=t.salary;

# Q-42. Write an SQL query to fetch three max salaries from a table.
select * from worker
order by salary desc limit 3;
#2nd way to do same thing
select w.salary, w.first_name,w.department from worker w
where 3>= (select count(distinct(w1.salary)) from worker w1
where w.salary<=w1.salary
order by w.salary desc); 

# Q-43. Write an SQL query to fetch three min salaries from a table.
select first_name, salary, department from worker
order by salary asc limit 3;

# 2nd way to do that same thing
select a.salary,a.first_name,a.department from worker a
where 3>=(select count(distinct(b.salary)) from worker b
where a.salary>=b.salary
order by a.salary desc);

# Q-44. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select sum(salary), department from worker
group by department;

# Q-45. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);


