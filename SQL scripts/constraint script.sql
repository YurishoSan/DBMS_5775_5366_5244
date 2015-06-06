ALTER TABLE BeitMidrashHall
ADD CONSTRAINT chk_bmh_ws_binary CHECK (womenSection = 0 OR womenSection = 1)
