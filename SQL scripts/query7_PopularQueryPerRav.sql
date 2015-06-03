WITH StudiesCat AS (SELECT stdID, Book.bookID, category FROM Book INNER JOIN Studies ON Book.bookID = Studies.bookID),
RavCat AS (SELECT ravid, category FROM Student INNER JOIN StudiesCat ON Student.stdID = StudiesCat.stdID),
RavCatCount AS
(
            SELECT ravID, category, COUNT(category) AS categoryCount FROM RavCat
            GROUP BY ravID, category
)

SELECT RavCatCount.ravID, ravName, category, maxCategory
FROM
(
       SELECT ravID, MAX(categoryCount) as maxCategory
       FROM RavCatCount
       GROUP BY ravID
) RavCatMax
INNER JOIN RavCatCount ON RavCatCount.ravID = RavCatMax.ravID AND categoryCount = maxCategory
INNER JOIN Rav ON Rav.Ravid = RavCatCount.ravID
ORDER BY ravID
