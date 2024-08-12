SELECT CITY.NAME AS CD 
FROM CITY 
INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE -- Mengambil nilai CountryCode (tabel city) yang ada pada country (tabel country)
WHERE COUNTRY.CONTINENT = 'Africa';

