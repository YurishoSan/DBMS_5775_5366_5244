create or replace trigger RecordStudiesDelete
  before delete on Studies
  for each row
  when (old.stdID > 0)
declare
  -- local variables here
  name_student varchar2(38);
  name_book    varchar2(38);
begin
  SELECT Student.name, Book.name
    INTO name_student, name_book
    FROM Student
   INNER JOIN Studies
      ON Student.stdID = Studies.Stdid
   INNER JOIN Book
      ON Studies.bookID = Book.bookID
   WHERE Studies.stdID = :old.stdID;
  dbms_output.put_line(SYSTIMESTAMP || ' - ' || USER ||
                       ' deleted record between: ' || name_student ||
                       ' and ' || name_book);
end RecordStudiesDelete;
/
