SELECT organization, LISTAGG(name || ' ' || phone,', ') WITHIN GROUP (ORDER BY name) AS studentPhone
FROM view_volgroup
GROUP BY organization 
