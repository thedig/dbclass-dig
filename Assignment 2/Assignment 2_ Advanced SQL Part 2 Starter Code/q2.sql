-- Put query for Q2 here

-- Question 2:
--
-- We want to find out how many of each category of film ED CHASE has starred in.
-- So return a table with category_name and the count of the number_of_films that ED was in that category.
--
-- Your query should return every category even if ED has been in no films in that category
--
-- Order by the category name in ascending order.

SELECT c.name AS category_name, COUNT(a.actor_id) AS number_of_films FROM category AS c
LEFT OUTER JOIN film_category AS fc
ON fc.category_id = c.category_id
LEFT OUTER JOIN film AS f
ON f.film_id = fc.film_id
LEFT OUTER JOIN film_actor AS fa
ON f.film_id = fa.film_id
LEFT OUTER JOIN actor AS a
ON fa.actor_id = a.actor_id AND a.first_name = 'ED' AND a.last_name = 'CHASE'
GROUP BY c.name;
