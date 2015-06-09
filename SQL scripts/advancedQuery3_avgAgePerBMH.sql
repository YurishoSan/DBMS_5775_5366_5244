SELECT BeitMidrashHall.bmhID, BeitMidrashHall.name, AVG(MONTHS_BETWEEN(SYSDATE, dateOfBirth) / 12) AS abvAge FROM BeitMidrashHall INNER JOIN Student
ON Student.bmhID = BeitMidrashHall.bmhID
WHERE BeitMidrashHall.bmhID = &bmhID
GROUP BY BeitMidrashHall.bmhID, BeitMidrashHall.name
