SELECT shelfNum, COUNT(shelfNum) AS books FROM Book
GROUP BY shelfNum HAVING COUNT(shelfNum) > &LowerValue
ORDER BY books DESC
