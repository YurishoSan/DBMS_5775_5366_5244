WITH StdSTDIES AS (SELECT Student.stdid, Student.name AS stdname, Studies.bookid, Student.ravid From Student INNER JOIN Studies ON Student.stdid = Studies.stdid),
StdBook AS (SELECT StdSTDIES.stdID, StdSTDIES.stdName,StdSTDIES.ravID, StdSTDIES.bookID, Book.name AS BookName, Book.pubYear FROM StdSTDIES INNER JOIN  Book ON StdSTDIES.bookID = Book.BookID),
RavBook AS ( SELECT Rav.ravID, Rav.ravName, Teaches.bookID FROM Rav INNER JOIN Teaches ON Rav.ravID = Teaches.ravID)
SELECT StdBook.stdName, StdBook.stdID ,RavBook.ravName, StdBook.bookName, StdBook.bookID FROM RavBook, StdBook WHERE StdBook.ravID = RavBook.ravID AND StdBook.bookID = RavBook.bookID
