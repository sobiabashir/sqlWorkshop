# SQL select query exercise

# World database layout:
# To use this database from a default MySQL install, type: use world;
use world;
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage

# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;

# 2: Get everything from the city table
SELECT * FROM City;
#
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
SELECT * FROM city WHERE district = 'aceh';
#
# 4: Get only the name of the cities where the countrycode is "bfa"
select Name FROM city WHERE CountryCode='bfa';

# 5: Get both the name and district of the cities where the countrycode is "tto"
select Name , District  FROM city WHERE CountryCode='tto';

# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
select Name as nm , District as dist  FROM city WHERE CountryCode='arm';

# 7: Get the cities with a name that starts with "bor"
select Name as CityName from city where Name LIKE 'bor%';

# 8: Get the cities with a name that contains the string "orto"
Select * from city where Name like '%orto%';

# 9: Get the cities that has a population below 1000
SELECT * from city where population<1000;

# 10: Get the unique countrycodes from the cities that has a population below 1000
select distinct CountryCode from city where population <1000; 

# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
 select * from city where population > 1000000 and CountryCode like 'UKR';

# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
Select * from city where population < 200 or population > 9500000;
 
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
Select * from city where CountryCode IN ( 'TJK', 'MRT','AND','PNG','SJM'); 

# 14: Get the cities with a population between 200 and 700 inclusive
Select * from city where population <= 700 and population >=200;
Select * from city where population between 200 and 700;

# 15: Get the countries with a population between 8000 and 20000 inclusive
select * from country where Population between 8000 and 20000;

# 16: Get the name of the countries with a independence year (indepyear) before year 0
select * from country where IndepYear < 0;

# 17: Get the countries that has no recorded independence year and a population above 1000000
select * from country where IndepYear is Null and Population > 1000000;

# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
select * from country where SurfaceArea < 10 and LifeExpectancy is Not Null;

# SQL Join exercise
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select * from city where Name LIKE 'ping%' order by population asc;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select * from city where Name like 'ran%' order by population desc;

# 3: Count all cities
select count(*) as Total_City  from city; 

# 4: Get the average population of all cities
Select avg(Population) as AveragePopulation from city;

# 5: Get the biggest population found in any of the cities
Select * from city order by Population desc limit 1;

# 6: Get the smallest population found in any of the cities
Select * from city order by Population asc limit 1;

# 7: Sum the population of all cities with a population below 10000
select sum(Population) as population from city where population <10000;

# 8: Count the cities with the countrycodes MOZ and VNM
select count(*) from city where CountryCode in ('MOZ','VNM');

# 9: Get individual count of cities for the countrycodes MOZ and VNM
select count(*), countrycode from city where CountryCode in ('MOZ','VNM')group by CountryCode;


# 10: Get average population of cities in MOZ and VNM
select Name , avg(population) from city where CountryCode in ('MOZ','VNM') group by Name;

# 11: Get the countrycodes with more than 200 cities
select countrycode, count(*) as city_count from city group by countrycode having city_count >200;

# 12: Get the countrycodes with more than 200 cities ordered by city count
select countrycode ,count(*) as city_count from city group by countrycode having city_count >200 order by city_countcountrylanguage asc;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select language from countrylanguage cl join city ct on cl.CountryCode = ct.CountryCode where ct.population between 400 and 500;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select name ,language from city ct join countrylanguage cl on ct.CountryCode=cl.CountryCode where ct.population between 500 and 600; 

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT name FROM city ct join countrylanguage cl  on cl.CountryCode = ct.countrycode WHERE population = 122199;

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT name FROM city ct join countrylanguage cl  on cl.CountryCode = ct.countrycode WHERE population != 122199;


# 17: What are the city names in the country where Luanda is capital?
SELECT city.name 
FROM city 
JOIN country ON city.countrycode = country.code 
WHERE country.capital = (SELECT id FROM city WHERE name = 'Luanda');

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT city.name 
FROM city 
JOIN country ON city.countrycode = country.code 
WHERE country.region = (SELECT region FROM country WHERE code = (SELECT countrycode FROM city WHERE name = 'Yaren'));


# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT countrylanguage.language 
FROM countrylanguage 
JOIN country ON countrylanguage.countrycode = country.code 
WHERE country.region = (SELECT region FROM country WHERE code = (SELECT countrycode FROM city WHERE name = 'Riga'));


# 20: Get the name of the most populous city
SELECT name 
FROM city 
ORDER BY population DESC 
LIMIT 1;


