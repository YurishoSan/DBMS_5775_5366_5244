WITH StudiesCat AS (SELECT stdID, Book.bookID, category FROM Book INNER JOIN Studies ON Book.bookID = Studies.bookID),
RavCat AS (SELECT ravid, category FROM Student INNER JOIN StudiesCat ON Student.stdID = StudiesCat.stdID),
RavCatCount AS
(
            SELECT ravID, category, COUNT(category) AS categoryCount FROM RavCat
            GROUP BY ravID, category
),
RavCatMax As
(
          SELECT ravID, category AS popularCategory FROM RavCatCount
          WHERE categoryCount = (SELECT MAX(categoryCount) FROM RavCatCount RCC WHERE RavCatCount.category = RCC.category)
)

SELECT Rav.ravID, ravName, popularCategory
FROM RavCatMax INNER JOIN Rav ON Rav.ravID = RavCatMax.RavID
