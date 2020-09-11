# SQL Join exercise
#
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first

select * from city where Name like 'ping%' and  population order by Population limit 1 offset 1;
#
# 3: Count all cities

select count(*) from city; 
#
# 4: Get the average population of all cities

select avg(population) from city;
#
# 5: Get the biggest population found in any of the cities

select max(population) from city;
#
# 6: Get the smallest population found in any of the cities

select min(population) from city;
#
# 7: Sum the population of all cities with a population below 10000

select sum(population) from city where Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM

select count(id) as count from city where CountryCode = 'MOZ' or CountryCode = 'VNM';
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM

select count(id) as count from city where countrycode = 'MOZ' or countrycode = 'VNM';
#
# 10: Get average population of cities in MOZ and VNM

select avg(population) from city where countrycode = 'MOZ' or countrycode = 'VNM'; 

#
# 11: Get the countrycodes with more than 200 cities

select countrycode from city where CountryCode >= '200';
#
# 12: Get the countrycodes with more than 200 cities ordered by city count

select countrycode from city where countrycode >= '200' order by countrycode asc;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?

select * from city where population between 400 and 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them

select name, language  from city inner join countrylanguage 
on city.CountryCode = countrylanguage.CountryCode 
where  population between 500 and 600;

#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)

-- select * from country where code = 'DJI';
-- select * from city where CountryCode = 'DJI';

select * from city inner join country on city.name = country.name;
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)

select * from city inner join country on city.name  <> country.name;
#
# 17: What are the city names in the country where Luanda is capital?

select city.name from city inner join country on city.CountryCode = country.Code where country.Capital = (select id from city where name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren

select city.name from city inner join country on city.CountryCode = country.Code where country.Capital = (select id from city where name = 'Yaren');

#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select countrylanguage from country join city on country.Code=countrylanguage  where name ='Riga';

# 20: Get the name of the most populous city

 select max(population) from city;
#
#
