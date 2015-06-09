WITH orgCountTbl AS (SELECT ravid, organization, COUNT(organization) AS orgCount FROM Student INNER JOIN Volunteergroup ON Student.Vgid = Volunteergroup.Vgid GROUP BY ravid, organization) 
SELECT organization, Rav.ravid, Ravname, orgCount FROM Rav INNER JOIN orgCountTbl
ON Rav.ravid = orgCountTbl.ravid
WHERE organization = '&organization' AND ravName = '&ravName'
ORDER BY organization
