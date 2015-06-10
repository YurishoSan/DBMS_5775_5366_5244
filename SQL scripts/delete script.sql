DELETE FROM Book
WHERE pubYear < 1920 AND category != 'Torah';

DELETE FROM VolunteerGroup
WHERE NOT EXISTS (SELECT * FROM Student WHERE VolunteerGroup.vgID = Student.vgID)
