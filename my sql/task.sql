CREATE database corona;

-- Import Table mytable

select * From mytable;


ALTER TABLE mytable
MODIFY COLUMN Date DATE;


-- Q1.Write a code to check NULL values

SELECT 
    *
FROM
    mytable
WHERE
        Province IS NULL 
		OR `Country/Region` IS NULL
        OR Latitude IS NULL
        OR Longitude IS NULL
        OR Date IS NULL
        OR Confirmed IS NULL
        OR Deaths IS NULL
        OR Recovered IS NULL;
        
-- ANS. There is no NULL value.


--  Q2. If NULL values are present, update them with zeros for all columns. 
-- ANS. There is no NULL value.


-- Q3. check total number of rows

 
 SELECT 
    COUNT(*)
FROM
    mytable;

-- ANS. 78386 rows in the corona_virus_dataset1 Table



-- Q4. Check what is start_date and end_date

SELECT 
    MIN(Date) as start_date, MAX(Date) as end_date
FROM
    mytable;
    
-- ANS start_date =2020-01-22 & end_ date = 2021-06-13
    
    
    
-- Q5. Number of month present in dataset


SELECT MONTH(Date) AS Months
FROM mytable
GROUP By Months;


-- ANS 1-12 months



-- Q6. Find monthly average for confirmed, deaths, recovered
 

SELECT MONTH(Date) as Month_wise,AVG(Recovered) AS Monthly_avg_recovered,
AVG(Confirmed) AS Monthly_avg_confirmed,
AVG(Deaths) AS Monthly_avg_deaths
FROM mytable
GROUP BY month_wise;
	
-- ANS (RUN QUERY)


-- Q7. Find most frequent value for confirmed, deaths, recovered each month 

 
SELECT MONTH(Date) as Month_wise,MAX(Recovered) AS Monthly_max_recovered,
MAX(Confirmed) AS Monthly_max_confirmed,
MAX(Deaths) AS Monthly_max_deaths
FROM mytable
GROUP BY month_wise;
	
-- ANS (RUN QUERY)

-- Q8. Find minimum values for confirmed, deaths, recovered per year


SELECT YEAR(Date) as year_wise,Min(Recovered) AS yearly_min_recovered,
Min(Confirmed) AS yearly_min_confirmed,
Min(Deaths) AS yearly_min_deaths
FROM mytable
GROUP BY year_wise;

-- ANS (RUN QUERY) 


-- Q9. Find maximum values of confirmed, deaths, recovered per year


SELECT YEAR(Date) as year_wise,MAX(Recovered) AS yearly_max_recovered,
MAX(Confirmed) AS yearly_max_confirmed,
MAX(Deaths) AS yearly_max_deaths
FROM mytable
GROUP BY year_wise;


-- ANS (RUN QUERY)


-- Q10. The total number of case of confirmed, deaths, recovered each month


SELECT MONTH(Date) as Month_wise,SUM(Recovered) AS Monthly_total_recovered,
SUM(Confirmed) AS Monthly_total_confirmed,
SUM(Deaths) AS Monthly_total_deaths
FROM mytable
GROUP BY month_wise;

-- ANS (RUN QUERY)


-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )

SELECT SUM(Confirmed) AS total_cases,
AVG(Confirmed) AS avg_cases ,
VARIANCE(Confirmed) AS varience_of_cases,
STDDEV(Confirmed) AS STDEV_of_cases 
FROM mytable;

-- ANS (RUN QUERY)


-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total Deaths cases, their average, variance & STDEV )


SELECT MONTH(Date) AS Month_wise,SUM(Deaths) AS total_deaths,
AVG(Deaths) AS avg_deaths ,
VARIANCE(Deaths) AS varience_of_deaths,
STDDEV(Deaths) AS STDEV_of_deaths 
FROM mytable
group by Month_wise;


-- ANS (RUN QUERY)

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total recovered cases, their average, variance & STDEV )


SELECT SUM(Recovered) AS total_Recovered,
AVG(Recovered) AS avg_Recovered ,
VARIANCE(Recovered) AS varience_of_Recovered,
STDDEV(Recovered) AS STDEV_of_Recovered 
FROM mytable;


-- Q14. Find Country having highest number of the Confirmed case

SELECT max(Confirmed) AS highest_cases,`Country/Region`
FROM mytable
GROUP BY `Country/Region`
ORDER BY highest_cases DESC LIMIT 1;


-- ANS Turkey with 823225 Confirmed cases

-- Q15. Find Country having lowest number of the death case


SELECT max(Deaths) AS lowest_deaths_case,`Country/Region`
FROM mytable
GROUP BY `Country/Region`
ORDER BY lowest_deaths_case limit 4;

-- ANS 
-- region/countr          	lowest_deaths_cases
-- Kiribati                            0
-- Dominica                            0
-- Marshall Islands                    0                 
-- Samoa                               0

-- Q16. Find top 5 countries having highest recovered case

SELECT max(Confirmed) AS highest_cases,`Country/Region`
FROM mytable
GROUP BY `Country/Region`
ORDER BY highest_cases DESC LIMIT 5;

-- ANS - 
-- 823225	Turkey
-- 414188	India
-- 300462	US
-- 117900	France
-- 100158	Brazil