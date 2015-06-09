INSERT INTO view_rav
VALUES(1111, 'R. Ezra Dasht', 1111, 'Banana Man', 'Someplace 5, Somewhere', '056-3222576', 'Dasht Hall', 'Hasdey Neomi', '0567160768', 'aluminum, molybdenum');

UPDATE view_rav
SET volGroupOrg='Paamonim'
WHERE ravName='R. Moshe Cohen';

DELETE FROM view_volgroup
WHERE vgID=83534;

UPDATE view_volgroup
SET name='BananaMan'
WHERE stdID='106588326'

