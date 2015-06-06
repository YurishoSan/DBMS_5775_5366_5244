CREATE OR REPLACE VIEW view_Rav205465212 AS

WITH Student_BmhName AS (SELECT stdID, beitMidrashHall.name AS bmhName FROM Student INNER JOIN BeitMidrashHall ON Student.bmhID = BeitMidrashHall.bmhID),
Student_VolGrp AS (SELECT stdID, organization AS volGroupOrg, VolunteerGroup.Phone AS volGroupPhone FROM Student INNER JOIN VolunteerGroup ON Student.vgID = VolunteerGroup.vgID),

Student_BookName AS (SELECT stdID, name AS bookName FROM Studies INNER JOIN Book ON Studies.bookID = Book.bookID),
Student_Books AS (SELECT stdID,  LISTAGG(bookName,', ') WITHIN GROUP (ORDER BY bookName) AS booksLearning FROM Student_BookName GROUP BY stdID)

SELECT Student.stdID, Student.name, Student.address, Student.phone, bmhName, volGroupOrg, volGroupPhone, booksLearning
FROM Student INNER JOIN Student_BmhName ON Student.stdID = Student_BmhName.stdID
     INNER JOIN Student_VolGrp ON Student.stdID = Student_VolGrp.stdID
     INNER JOIN Student_Books ON Student.stdID = Student_Books.stdID
WHERE ravID=205465212
