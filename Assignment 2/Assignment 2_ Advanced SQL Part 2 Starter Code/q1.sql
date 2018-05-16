-- Put query for Q1 here

SELECT `film_id` FROM `film`
WHERE rental_duration = (SELECT MIN(rental_duration) FROM `film`)
OR length = (SELECT MAX(length) FROM `film`);
