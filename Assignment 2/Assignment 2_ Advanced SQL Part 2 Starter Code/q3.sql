-- Put query for Q3 here

-- Question 3:
--
-- Find the first_name, last_name and total_combined_film_length of Sci-Fi films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Sci-Fi films) and the total length of Sci-Fi films they have been in.
-- Look at the category table to figure out how to filter data for Sci-Fi films.

SELECT a.first_name AS first_name, a.last_name AS last_name, IFNULL(SUM(sf.length), 0) AS total_combined_film_length
FROM actor AS a
LEFT OUTER JOIN film_actor AS fa
ON fa.actor_id = a.actor_id
LEFT OUTER JOIN (
  SELECT f.film_id AS film_id, f.length AS length FROM film AS f
  LEFT OUTER JOIN film_category AS fc
  ON f.film_id = fc.film_id
  LEFT OUTER JOIN category AS c
  ON fc.category_id = c.category_id
  WHERE c.name = 'Sci-Fi'
) as sf
ON sf.film_id = fa.film_id
GROUP BY a.actor_id
ORDER BY a.actor_id;
