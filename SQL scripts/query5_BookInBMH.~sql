WITH StdSTDIES AS (SELECT Student.name, Student.stdID, Student.BMHID , Studies.bookID FROM Student INNER JOIN Studies ON Student.stdID = Studies.stdID),
StdBMH AS (SELECT stdSTDIES.name, stdSTDIES.stdID, stdSTDIES.bookID FROM stdSTDIES INNER JOIN Placed ON stdSTDIES.bookID = Placed.bookID AND stdSTDIES.BMHID = Placed.BMHID)
SELECT StdBMH.name, StdBMH.stdID, StdBMH.bookID, Book.name AS bookName From StdBMH INNER JOIN Book ON StdBMH.bookID = Book.bookID
