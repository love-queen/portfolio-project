Select * FROM [world_wide].[dbo].[covid_worldwide];

-- Calculate the average total deaths and total recovered
SELECT AVG(Total_Deaths) AS AvgDeaths, AVG(Total_Recovered) AS AvgRecovered
FROM [world_wide].[dbo].[covid_worldwide];

-- Calculate the case fatality rate (CFR) for each countryCalculate the case fatality rate (CFR) for each country
SELECT Country, Total_Deaths / CAST(Total_Cases AS FLOAT) * 100 AS CaseFatalityRate
FROM [world_wide].[dbo].[covid_worldwide];

-- Retrieve the top 5 countries with the highest total cases
SELECT TOP 5 Country, Total_Cases
FROM [world_wide].[dbo].[covid_worldwide]
ORDER BY Total_Cases DESC;

-- Find the country with the highest number of active cases
SELECT TOP 1 Country, Active_Cases, Total_Deaths
FROM [world_wide].[dbo].[covid_worldwide]
ORDER BY Active_Cases DESC;

-- Calculate the average total cases, total deaths, and total recovered per 1 million population
SELECT Country,
       CASE WHEN Population <> 0 THEN Total_Cases / (Population / 1000000.0) ELSE NULL END AS AvgCasesPerMillion,
       CASE WHEN Population <> 0 THEN Total_Deaths / (Population / 1000000.0) ELSE NULL END AS AvgDeathsPerMillion,
       CASE WHEN Population <> 0 THEN Total_Recovered / (Population / 1000000.0) ELSE NULL END AS AvgRecoveredPerMillion
FROM [world_wide].[dbo].[covid_worldwide];

-- Identify the countries with the highest and lowest case fatality rates (CFR)
SELECT TOP 1 Country, Total_Cases, Total_Deaths, Total_Recovered,
       (Total_Deaths / CAST(Total_Cases AS FLOAT)) * 100 AS CaseFatalityRate
FROM [world_wide].[dbo].[covid_worldwide]
ORDER BY CaseFatalityRate DESC;

SELECT TOP 1 Country, Total_Cases, Total_Deaths, Total_Recovered,
       (Total_Deaths / CAST(Total_Cases AS FLOAT)) * 100 AS CaseFatalityRate
FROM [world_wide].[dbo].[covid_worldwide]
WHERE Total_Cases > 1000
ORDER BY CaseFatalityRate ASC;

-- Calculate the percentage of the population that has been tested for COVID-19
SELECT Country,
       CASE WHEN Population <> 0 THEN (Total_Test / CAST(Population AS FLOAT)) * 100 ELSE NULL END AS TestingPercentage
FROM [world_wide].[dbo].[covid_worldwide]
ORDER BY TestingPercentage DESC;

--Calculate the percentage of active cases relative to total cases
SELECT Country, (Active_Cases / CAST(Total_Cases AS FLOAT)) * 100 AS ActiveCasesPercentage
FROM [world_wide].[dbo].[covid_worldwide]
ORDER BY ActiveCasesPercentage DESC;

--Find the top 5 countries with the highest total tests conducted
SELECT Top 5 Country, Total_Test
FROM [world_wide].[dbo].[covid_worldwide]
ORDER BY Total_Test DESC;

--Calculate the average number of cases per day by dividing total cases by the number of days since the first case was reported
SELECT Country,
       Total_Cases / DATEDIFF(day, '2023-08-01', GETDATE()) AS AvgCasesPerDay
FROM [world_wide].[dbo].[covid_worldwide];