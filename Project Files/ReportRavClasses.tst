PL/SQL Developer Test script 3.0
12
-- Created on 10/06/2015 by YURISHO 
declare
  -- Local variables here
  cursor cRav is
    SELECT ravID FROM Rav;
begin
  -- Test statements here
  for rav_id in cRav loop
    Package.ReportRavClasses(rav_id.ravID);
    dbms_output.put_line('++++++++++++++++++');
  end loop;
end;
0
0
