PL/SQL Developer Test script 3.0
18
-- Created on 10/06/2015 by YURISHO 
declare
  -- Local variables here
  percent_count number := 0;
  cursor cPublisher is
    SELECT DISTINCT publisher FROM book;
begin
  -- Test statements here

  for publisher_rec in cPublisher loop
    percent_count := percent_count + Package.BooksByPublisherStudy(publisher_rec.publisher);
    dbms_output.put_line('Persent of students who study or being taught from publisher ' ||
                         publisher_rec.publisher || ' ' ||
                         Package.BooksByPublisherStudy(publisher_rec.publisher));
  end loop;
  dbms_output.put_line('--------------------------------------------');
  dbms_output.put_line('Sum of all percentages: ' || percent_count);
end;
0
0
