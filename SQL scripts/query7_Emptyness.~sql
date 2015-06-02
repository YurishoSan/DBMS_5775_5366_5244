WITH NumOfStd AS (SELECT BMHID, COUNT(BMHID) AS students FROM Student GROUP BY BMHID ),
BMHNum AS (SELECT NumOfStd.BMHID, NumOfStd.students, BeitMidrashHall.capacity FROM NumOfStd INNER JOIN BeitMidrashHall ON NumOfStd.BMHID = BeitMidrashHall.BMHID)
SELECT BMHNum.BMHID, BMHNum.students/BMHNum.capacity FROM BMHNum ORDER BY BMHNum.students/BMHNum.capacity
