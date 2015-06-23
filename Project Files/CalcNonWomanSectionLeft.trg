create or replace trigger CalcNonWomanSectionLeft
  after update on beitmidrashhall
  for each row
declare
  manSectionCapacity number;
begin
  if :new.womensection = 1 then
    manSectionCapacity := :new.capacity - :new.womensectioncapacity;
    dbms_output.put_line(:new.name || ' - man section capacity left: ' ||
                         manSectionCapacity);
  end if;
end CalcNonWomanSectionLeft;
/
