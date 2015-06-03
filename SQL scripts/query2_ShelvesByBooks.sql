WITH BookByShelf AS (SELECT shelfNum, COUNT(shelfNum) AS books FROM Book GROUP BY shelfNum HAVING COUNT(shelfNum) > 1)
SELECT * FROM BookByShelf ORDER BY BookByShelf.books DESC
