CREATE OR REPLACE VIEW view_VolGroup21979 AS
SELECT Student.stdID, Student.name, Student.address, Student.phone, Rav.Ravname
FROM Student INNER JOIN Rav ON Student.ravID = Rav.Ravid
WHERE vgID=21979
