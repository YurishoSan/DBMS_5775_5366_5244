ALTER TABLE BeitMidrashHall
ADD CONSTRAINT chk_bmh_ws_binary CHECK (womenSection = 0 OR womenSection = 1);

ALTER TABLE Rav
RENAME COLUMN ravName TO name;

ALTER TABLE BeitMidrashHall
ADD womenSectionCapacity number(38);

ALTER TABLE BeitMidrashHall 
ADD CONSTRAINT womenSectionCapacityCHK
CHECK  ((womenSection = 0 AND womenSectionCapacity = 0) OR 
        ((womenSection = 1 AND womenSectionCapacity > 0)));
