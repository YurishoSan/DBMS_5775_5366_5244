create or replace trigger RecordStudiesDelete
  before delete on Studies
  for each row
  when (old.stdID > 0)
declare
  -- local variables here
  name_student varchar2(38);
  name_book    varchar2(38);
begin
  SELECT Student.name
    INTO name_student
    FROM Student
   WHERE Student.StdID = :old.stdID;

  SELECT Book.name
    INTO name_book
    FROM Book
   WHERE Book.bookID = :old.bookID;

  dbms_output.put_line(SYSTIMESTAMP || ' - ' || USER ||
                       ' deleted record between: ' || name_student ||
                       ' and ' || name_book);
end RecordStudiesDelete;
/
