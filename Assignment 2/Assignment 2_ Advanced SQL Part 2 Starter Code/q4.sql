-- Put query for Q4 here

-- Question 4:
-- Find the first_name and last_name of all actors who have never been in
-- a Sci-Fi film.

SELECT ac.first_name, ac.last_name
FROM actor AS ac
LEFT OUTER JOIN (
  -- ids of all actors in a sci-fi movie:
  SELECT a.actor_id AS id
  FROM actor AS a
  LEFT OUTER JOIN film_actor AS fa
  ON fa.actor_id = a.actor_id
  LEFT OUTER JOIN (
    -- ids of all sci-fi movies:
    SELECT DISTINCT f.film_id AS film_id FROM film AS f
    LEFT OUTER JOIN film_category AS fc
    ON f.film_id = fc.film_id
    LEFT OUTER JOIN category AS c
    ON fc.category_id = c.category_id
    WHERE c.name = 'Sci-Fi'
  ) AS sf
  ON sf.film_id = fa.film_id
  WHERE sf.film_id IS NOT NULL
  GROUP BY a.actor_id
) AS sfa
ON sfa.id = ac.actor_id
WHERE sfa.id IS NULL;
