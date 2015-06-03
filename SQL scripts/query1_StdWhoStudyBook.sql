WITH StdAtRav AS (SELECT stdID, Name ,Rav.ravID FROM Student INNER JOIN Rav ON Student.ravID = Rav.ravID),
StdLearnBook AS
(
     SELECT Studies.bookID, Book.Name AS bookName, Studies.stdID, Student.Name As StudentName FROM Studies INNER JOIN Student ON Student.StdID = Studies.StdID INNER JOIN Book ON Studies.BookID = Book.bookID
     UNION
     SELECT Teaches.bookID, Book.Name AS bookName, stdID, StdAtRav.Name As StudentName FROM StdAtRav INNER JOIN Teaches ON StdAtRav.ravID = Teaches.ravID INNER JOIN Book ON Teaches.bookID = Book.bookID
)

SELECT bookID, bookName, LISTAGG(stdID || ' ' || studentName,',') WITHIN GROUP (ORDER BY stdID) AS studentLearning
FROM StdLearnBook GROUP BY bookID, bookName
