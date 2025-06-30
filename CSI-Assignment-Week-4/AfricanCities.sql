SELECT CITY.NAME AS NAME

FROM CITY 

JOIN COUNTRY ON CITY.CountryCode = Country.Code

WHERE Country.Continent = 'Africa';