create or replace package Package is

  -- Author  : YURISHO
  -- Created : 09/06/2015 23:26:18
  -- Purpose : 

  -- Public type declarations
  --type <TypeName> is <Datatype>;

  -- Public constant declarations
  --<ConstantName> constant <Datatype> := <Value>;

  -- Public variable declarations
  --<VariableName> <Datatype>;

  -- Public function and procedure declarations
  function BooksByPublisherStudy(publisher_in in varchar2) return number;
  function SetWomanSectionCapacity(id in number) return number;

  procedure ReportRavClasses(id in number);
  procedure ReportWhenVolForRav(id in number);

end Package;
/
create or replace package body Package is

  --Input: publisher name
  --Output: What percentage of books being studied are this publisher's books?
  function BooksByPublisherStudy(publisher_in in varchar2) return number is
    cursor cBook is --books by publisher
      SELECT bookID AS ID FROM book WHERE publisher = publisher_in;
    total_percentage number := 0;
    total_students   integer;
    rec_percentage   number;
  begin
    SELECT COUNT(*) INTO total_students FROM Student;
  
    for book_rec in cBook loop
      WITH StudiesTeaches AS
       (SELECT DISTINCT Studies.bookID AS bookID
          FROM Teaches
         INNER JOIN Studies
            ON Teaches.bookID = Studies.Bookid)
      SELECT SUM(CASE
                   WHEN bookID = book_rec.ID THEN
                    1
                   ELSE
                    0
                 END) / COUNT(*) * 100 --get percentage studying each book by the publisher
        INTO rec_percentage
        FROM StudiesTeaches;
    
      total_percentage := total_percentage + rec_percentage; --and total the precentage 
    end loop;
  
    return total_percentage;
  end;

  --Input: beit midrash id
  --Output: calculates what woman section capacity should be, updates the value, and returns it.
  -- if womenSection is 0 (false) then returns -1.
  function SetWomanSectionCapacity(id in number) return number is
  
    WOMAN_SECTION_PERCENT CONSTANT number := 0.2;
    capacity      number;
    womenSection  char(1);
    womenCapacity number;
  
  begin
  
    SELECT capacity, womenSection
      INTO capacity, womenSection
      FROM BeitMidrashHall
     Where bmhID = id;
  
    if womenSection = 1 then
      womenCapacity := capacity * WOMAN_SECTION_PERCENT;
      UPDATE BeitMidrashHall
         SET Womensectioncapacity = womenCapacity
       WHERE bmhID = id;
      return womenCapacity;
    else
      return - 1;
    end if;
  end;

  --Input: ravID
  --Prints: * list of beit midrash halls rav teaches in.
  --        * list of classrooms rav teaches in.
  --        * Calculates salary on a per student basis.
  procedure ReportRavClasses(id in number) is
  
    SALARY_BMH_COEFICIANT   CONSTANT number := 140.6; --salary per beit midrash
    SALARY_CLASS_COEFICIANT CONSTANT number := 20.7; --salary per classroom
    SALARY_BASE             CONSTANT number := 400; --base sallary
  
    cursor cbmhName is
      SELECT DISTINCT BeitMidrashHall.name AS bmhName
        FROM Student
       INNER JOIN BeitMidrashHall
          ON Student.bmhID = BeitMidrashHall.bmhID
       WHERE Student.ravID = id --where rav's students study
      UNION
      SELECT BeitMidrashHall.name AS bmhName
        FROM BeitMidrashHall
       WHERE ravID = id; -- where rav is head of beit midrash
  
    cursor cstudentClass is
      SELECT DISTINCT class FROM Student WHERE ravID = id;
  
    total_salary number;
  
    o_number number; --temp for outputing numbers
    o_string varchar2(38); --temp for outputing strings
  
  begin
    total_salary := SALARY_BASE;
  
    SELECT ravName INTO o_string FROM Rav WHERE Rav.ravID = id;
    dbms_output.put_line('Rav ID: ' || id || ' Rav Name: ' || o_string);
    dbms_output.put_line('-----');
  
    dbms_output.put_line('List of beit midrash halls rav teaches in:');
  
    for rec in cbmhName loop
      dbms_output.put_line(rec.bmhName);
      total_salary := total_salary + SALARY_BMH_COEFICIANT;
    end loop;
    dbms_output.put_line('-----');
  
    dbms_output.put_line('list of classrooms rav teaches in:');
    for rec in cstudentClass loop
      dbms_output.put_line(rec.class);
      total_salary := total_salary + SALARY_CLASS_COEFICIANT;
    end loop;
    dbms_output.put_line('-----');
  
    SELECT bankAccountNum INTO o_number FROM Rav WHERE Rav.ravID = id;
    dbms_output.put_line('Salary: ' || total_salary ||
                         ' Bank Account Number: ' || o_number);
  end;

  --Input: ravID
  --Prints: * times his students are in volenteer, at what orgenization and address, with details
  procedure ReportWhenVolForRav(id in number) is
  
    cursor cstudentVolTime is
      SELECT Name,
             organization,
             dayOfWeek,
             TimeOfDay,
             VolunteerGroup.address,
             details
        FROM VolunteerGroup
       INNER JOIN Student
          ON Student.vgID = VolunteerGroup.vgID
       WHERE ravID = id;
  
  begin
    for rec in cstudentVolTime loop
      dbms_output.put_line('Student: ' || rec.name || ' Volunteer in: ' ||
                           rec.organization || ' in day: ' ||
                           rec.dayOfWeek || ' at time: ' || rec.timeOfDay ||
                           ' at address: ' || rec.address);
      dbms_output.put_line('details: ' || rec.details);
      dbms_output.put_line('-----');
    end loop;
  end;

begin
  null;
end Package;
/
