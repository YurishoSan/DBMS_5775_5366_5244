CREATE OR REPLACE VIEW view_VolGroup AS
SELECT VolunteerGroup.vgID, Volunteergroup.Organization,Student.stdID, Student.name, Student.address, Student.phone, Rav.Ravname
FROM Student INNER JOIN Rav ON Student.ravID = Rav.Ravid
     INNER JOIN VolunteerGroup ON Student.vgID = VolunteerGroup.vgID
ORDER BY Volunteergroup.Organization
