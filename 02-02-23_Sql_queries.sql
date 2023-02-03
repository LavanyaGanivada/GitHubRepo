--Write a query to display the member id, member name, city and membership status who are all having life time membership. Hint: Life time membership status is “Permanent”.
--display the bookcode,book name and supplier name of the books in the library
select * from LMS_BOOK_DETAILS;
select * from LMS_BOOK_ISSUE;
select * from LMS_FINE_DETAILS;
select * from LMS_SUPPLIERS_DETAILS;
select * from LMS_MEMBERS;
select BOOK_CODE,BOOK_TITLE,SUPPLIER_NAME FROM LMS_BOOK_DETAILS JOIN LMS_SUPPLIERS_DETAILS
ON LMS_BOOK_DETAILS.SUPPLIER_ID=LMS_SUPPLIERS_DETAILS.SUPPLIER_ID;

--DISPLAY THE BOOK TITLE AND MEMBER ID WHO HAS TAKEN THE BOOK LIBRARY
SELECT DISTINCT BOOK_TITLE,MEMBER_ID FROM LMS_BOOK_DETAILS JOIN LMS_BOOK_ISSUE ON
LMS_BOOK_DETAILS.BOOK_CODE=LMS_BOOK_ISSUE.BOOK_CODE

SELECT * FROM EMPLOYEE;

SELECT * FROM department;

--display the employyee name Email and deARTMENT name
select first_name+','+last_name as name ,email,name from employee join department
on department_id=department.id;

--N tables will need n-1 joins
--display the booktiltle and the member id with alias
--inner join
select l1.BOOK_CODE,l1.BOOK_TITLE,l2.SUPPLIER_NAME FROM LMS_BOOK_DETAILS as l1 JOIN LMS_SUPPLIERS_DETAILS as l2
ON l1.SUPPLIER_ID=l2.SUPPLIER_ID;

--display the book name and the membername who has taken book from the library
select * from LMS_BOOK_DETAILS;
select * from LMS_MEMBERS;
select * from LMS_BOOK_ISSUE;

--display emp name,dept name and state location
select e.first_name,d.name as dept ,l.state from employee as e join department as d
on e.department_id=d.id join location as l on l.id=d.location_id; 

--display department_id and number of emp in each department 
select department_id,count(id) as Countof from employee group by department_id;

--display department_id name  and number of emp in each department with group by clause 
select d.name,count(*) from employee as e join department as d on e.department_id=d.id group by name;
select supplier_id,count(*) from LMS_BOOK_DETAILS where supplier_id is not null  group by SUPPLIER_ID ;
select * from LMS_SUPPLIERS_DETAILS;
select * from LMS_BOOK_ISSUE;

--display supplier name and no of books issued by the supplier
select supplier_name,count(BOOK_CODE) from LMS_SUPPLIERS_DETAILS as l1 join LMS_BOOK_DETAILS as l2
on l1.SUPPLIER_ID=l2.SUPPLIER_ID group by l1.supplier_name;

--1.Write a query to display the book title, supplier name who has supplied books to library.
select * from LMS_BOOK_DETAILS;
select * from LMS_SUPPLIERS_DETAILS;
select distinct  l1.book_title,l2.SUPPLIER_NAME from LMS_BOOK_DETAILS as l1 join LMS_SUPPLIERS_DETAILS as l2 on l1.SUPPLIER_ID=l2.SUPPLIER_ID; 

--2.Write a query to display member name and book code for the book he/she taken from the library.
select * from LMS_MEMBERS;
select * from LMS_BOOK_ISSUE;
select l1.member_name,l2.book_code from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2 on l1.MEMBER_ID=l2.MEMBER_ID;

--3.Write a query to display the book title and date when the book was taken from the library.
select * from LMS_BOOK_DETAILS;
select * from LMS_BOOK_ISSUE;
select distinct l1.book_title,l2.date_issue from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 on l1.book_code=l2.book_code;

--4.Write a query to display the member id and the fine amount paid by the member in the library.
select * from LMS_FINE_DETAILS;
select * from LMS_BOOK_ISSUE;
select l1.member_id,l2.fine_amount from LMS_BOOK_ISSUE as l1 join LMS_FINE_DETAILS as l2 on l1.FINE_RANGE=l2.FINE_RANGE;

--5.Write a query to display the member name and the date difference between the date return and date returned.
select l1.member_name,datediff(day,date_return,date_returned) as datedifference 
from lms_members as l1 join lms_book_issue as l2 on l1.member_id=l2.member_id; 

--6.Write a query to display the book title and the member name of member who has taken book from library.
select * from LMS_BOOK_DETAILS;
select * from LMS_MEMBERS;
select * from LMS_BOOK_ISSUE;
select l1.book_title, l3.member_name from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 
on l1.BOOK_CODE=l2.BOOK_CODE join LMS_MEMBERS as l3 on l3.MEMBER_ID=l2.MEMBER_ID;

--7.Write a query to display the book title, member name and the supplier name for the books taken from the library.
select l1.book_title,l4.member_name,l3.supplier_name from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2
on l1.book_code=l2.book_code join LMS_SUPPLIERS_DETAILS as l3 
on l3.SUPPLIER_ID=l1.SUPPLIER_ID join LMS_MEMBERS as l4 on l4.MEMBER_ID=l2.MEMBER_ID;

--8.Write a query to display the book title and the different fine amount paid for the book in library.
select l1.book_title,l3.fine_amount from LMS_BOOK_DETAILS as l1 join LMS_BOOK_ISSUE as l2 
on l1.BOOK_CODE=l2.BOOK_CODE join LMS_FINE_DETAILS as l3 on l3.FINE_RANGE=l2.FINE_RANGE;

--1.Write a query to display the member id, member name of the members, book code and book title of the books taken by them.
select l1.member_id,l1.member_name,l3.book_code,l3.book_title from LMS_MEMBERS as l1 join LMS_BOOK_ISSUE as l2 
on l1.MEMBER_ID=l2.MEMBER_ID join LMS_BOOK_DETAILS as l3 on l3.BOOK_CODE=l2.BOOK_CODE;

--3.Write a query to display the member id, member name, fine range and fine amount of the members whose fine amount is less than 100. 

--Problem # 4:
--Write a query to display the book code, book title, publisher, edition, price and year of publication and sort based on year of publication, publisher and edition.
select book_code,book_title,publication,book_edition,price,publish_date from LMS_BOOK_DETAILS
order by PUBLISH_DATE,PUBLICATION,BOOK_EDITION;
--Problem # 5:
--Write a query to display the book code, book title and rack number of the books 
--which are placed in rack 'A1' and sort by book title in ascending order. 
select book_code,book_title,rack_num from LMS_BOOK_DETAILS where rack_num='A1' order by book_title;
--6.Write a query to display the member id, member name, due date and date returned of the members who has returned the books after the due date. Hint: Date_return is due date and Date_returned is actual book return date. 

--7.Write a query to display the member id, member name and date of registration who have not taken any book. 



--8.Write a Query to display the member id and member name of the members who has not paid any fine in the year 2012.
--10.Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" and the book edition is 5 and supplied by supplier ‘S01’. 

--11.Write a query to display the rack number and the number of books in each rack with alias name “NOOFBOOKS” and sort by rack number in ascending order.

--Problem # 12:
--Write a query to display book issue number, member name, date or registration, date of expiry, book title, category author, price, date of issue, date of return, actual returned date, issue status, fine amount. 

--Problem # 13:
--Write a query to display the book code, title, publish date of the books which is been published in the month of December. 
--15.Write a query to display book code, book name, and publisher, how old the book is. Sorted as older to newer.

