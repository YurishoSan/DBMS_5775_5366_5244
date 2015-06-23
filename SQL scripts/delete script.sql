DELETE FROM Studies
 WHERE (SELECT Studies.bookID
    FROM Studies
   INNER JOIN Book
      ON Book.Bookid = Studies.Bookid
   WHERE Book.pubYear < 1920
     AND Book.category != 'Torah');

DELETE FROM VolunteerGroup
 WHERE NOT EXISTS
    (SELECT * 
     FROM Student
     INNER JOIN VolunteerGroup 
     ON VolunteerGroup.vgID = Student.vgID)
