-- Put query for Q5 here

-- Question 5
--
-- Find the film_title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
-- Order the results by film_title in descending order.
--
-- Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box to figure out how to get a table that shows pairs of actors in movies.

-- find all movies with KIRSTEN

-- find all movies with WARREN

-- inner join the two on film_id
SELECT kfilms.title as film_title
FROM (
  SELECT f.film_id as id, f.title as title
  FROM film as f
  LEFT OUTER JOIN film_actor as fa
  ON fa.film_id = f.film_id
  LEFT OUTER JOIN actor as ac
  ON ac.actor_id = fa.actor_id
  WHERE ac.first_name = 'KIRSTEN' and ac.last_name = 'PALTROW'
  GROUP BY f.film_id
) AS kfilms
INNER JOIN (
  SELECT f.film_id as id, f.title as title
  FROM film as f
  LEFT OUTER JOIN film_actor as fa
  ON fa.film_id = f.film_id
  LEFT OUTER JOIN actor as ac
  ON ac.actor_id = fa.actor_id
  WHERE ac.first_name = 'WARREN' and ac.last_name = 'NOLTE'
  GROUP BY f.film_id
) AS wfilms
ON kfilms.id = wfilms.id
ORDER BY kfilms.title DESC;
