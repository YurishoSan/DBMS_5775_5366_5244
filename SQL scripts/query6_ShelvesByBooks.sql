WITH BookByShelf AS (SELECT shelfNum, COUNT(shelfNum) AS books FROM Book GROUP BY shelfNum)
SELECT * FROM BookByShelf ORDER BY BookByShelf.books DESC
