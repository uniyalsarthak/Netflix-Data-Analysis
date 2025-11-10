DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(6),
    type         VARCHAR(10),
    title        VARCHAR(200),
    director     VARCHAR(350),
    casts        VARCHAR(1050),
    country      VARCHAR(250),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);



select  count(*) from netflix;

-- Netflix Data Analysis using SQL
-- Solutions of 15 business problems
-- 1. Count the number of Movies vs TV Shows

select type,count(type) as total_count
from netflix 
group by type;


--select type,max(rating)
--from public.netflix
--group by type;


-- 2. Find the most common rating for movies and TV shows

WITH RatingCounts AS (
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count
    FROM netflix
    GROUP BY type, rating
),
RankedRatings AS (
    SELECT 
        type,
        rating,
        rating_count,
        RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT 
    type,
    rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;



-- 3. List all movies released in a specific year (e.g., 2020)

select title 
from netflix 
where release_year=2020 and type='Movie';


-- 4. Find the top 5 countries with the most content on Netflix

select trim(unnest(string_to_array(country,','))) as new_country,
count(*) as freq
from netflix
group by new_country
order by freq desc
limit 5;


-- 5. Identify the longest movie

select title,split_part(duration,' ',1)::int as time
from netflix
where duration is not null and type='Movie'
order by time desc
limit 1;



SHOW search_path;


-- 6. Find content added in the last 5 years

select title,type,date_added 
from netflix
where to_date(date_added,'Month DD,YYYY')>=current_date- interval '5 years'
order by 3 desc;


-- 7. Find all the movies/TV shows by director 'Ashwiny Iyer Tiwari'!

select * 
from (select * ,trim(unnest(string_to_array(director,','))) as director_name
		from netflix)
where director_name='Ashwiny Iyer Tiwari';

select *
from netflix
where director ilike '%Ashwiny Iyer Tiwari%';



-- 8. List all TV shows with more than 5 seasons

select title,split_part(duration,' ',1) as seasons
from netflix
where type='Movies' and seasons>5;

select *
from (select *,split_part(duration,' ',1)::int as seasons
		from netflix)
where type ilike 'TV Show' and seasons>5;

select *
from netflix
where type='TV Show' and split_part(duration,' ',1)::int>5;



-- 9. Count the number of content items in each genre

select trim(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS genre, count(*) as total
from netflix 
group by 1
order by total desc;



-- 10. Find the average numbers of content release by India on netflix each year and
-- return top 5 year with highest content release !

select extract(year from to_date(date_added,'Month dd,yyyy')) as year,
count(*),
round((select count(*) from netflix where country='India')::numeric/(select count(distinct extract(year from to_date(date_added,'Month dd,yyyy'))) from netflix where country='India')::numeric,2) as avg_num_of_movies
from netflix
where country='India' and date_added is not null
group by 1
order by count(*) desc
limit 5;


-- 11. List all movies that are documentaries

select * from netflix
where listed_in ilike '%Documentaries%';



-- 12. Find all content without a director

select * from netflix
where director is null;


-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

select *
from netflix
where casts ilike '%salman khan%' and release_year>extract(year from current_date)-15;



-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select trim(unnest(string_to_array(casts,','))) as actors, count(*) as movies
from netflix
where country ilike '%India%'
group by 1
order by 2 desc
limit 10;





/*
15:Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/

select 
	case
		when description ilike '%kill%' or description ilike '%violence%' then 'Bad'
		else 'good'
		end as category,
	count(*) as total
from netflix
group by category;



