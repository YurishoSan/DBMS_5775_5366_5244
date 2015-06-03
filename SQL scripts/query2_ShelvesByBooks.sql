SELECT shelfNum, COUNT(shelfNum) AS books FROM Book
GROUP BY shelfNum HAVING COUNT(shelfNum) > 1
ORDER BY books DESC
