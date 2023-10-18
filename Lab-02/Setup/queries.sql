--1. How many animals of each type have outcomes?
--     I.e. how many cats, dogs, birds etc. Note that this question is asking about number of animals, not number of outcomes, so animals with multiple outcomes should be counted only once.
    
SELECT animal_type, COUNT(*)
FROM outcomes
GROUP BY animal_type ;


--2. How many animals are there with more than 1 outcome?
    
SELECT COUNT(*) FROM (
    SELECT animal_id, COUNT(DISTINCT "outcome_type") as outcome_count
    FROM outcomes
    GROUP BY animal_id
    HAVING COUNT(DISTINCT "outcome_type") > 1
);


--3. What are the top 5 months for outcomes? 
--     Calendar months in general, not months of a particular year. This means answer will be like April, October, etc rather than April 2013, October 2018, 
    
SELECT
    TO_CHAR("date_id"::date, 'MonthYear') as months_of_year,
    COUNT(*) as outcome_count
FROM outcomes
GROUP BY months_of_year
ORDER BY outcome_count DESC
LIMIT 5;


--4. A "Kitten" is a "Cat" who is less than 1 year old. A "Senior cat" is a "Cat" who is over 10 years old. An "Adult" is a cat who is between 1 and 10 years old.
--     What is the total number of kittens, adults, and seniors, whose outcome is "Adopted"?
--     Conversely, among all the cats who were "Adopted", what is the total number of kittens, adults, and seniors?


SELECT
    CASE
       WHEN "age_id" LIKE 'Under 1%' THEN 'Kitten'
       WHEN "age_id" LIKE '1%' THEN 'Senior Cat'
       ELSE 'Adult'

    END AS AgeCategory,
    COUNT(*) AS CatCount
FROM outcomes
WHERE "animal_type" = 'Cat' AND "outcome_type" = 'Adoption'
GROUP BY AgeCategory;


--5. For each date, what is the cumulative total of outcomes up to and including this date?


SELECT
    DISTINCT date_id,
    COUNT(*) OVER (ORDER BY date_id ASC)
FROM outcomes;