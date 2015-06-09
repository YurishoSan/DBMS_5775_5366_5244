SELECT ravName, LISTAGG(bmhName,', ') WITHIN GROUP (ORDER BY ravName) AS bmhTeaching
FROM view_rav
GROUP BY ravName 
