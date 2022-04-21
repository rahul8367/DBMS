/*
1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.
2. Find out the top 3 rented horror movies.
3. Find out the list of customers from India who have rented sports movies.
4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.
5. Find out the number of movies in which “SEAN WILLIAMS” acted.
*/
select * from category;
select * from film;
select * from film_category;
select film_id,title from film where rating='PG-13' and film_id in 
(select film_id from film_category where category_id in(select category_id from category where
category.name='Comedy'));
/*
Find out the top 3 rented horror movies.
*/
SELECT fl.title, COUNT(ALL fl.title) FROM
film_list fl,inventory i,rental r
WHERE fl.category = 'Horror' AND fl.FID = i.film_id AND i.inventory_id = r.inventory_id GROUP BY title
ORDER BY COUNT(ALL fl.title) DESC LIMIT 3;
/*
Find out the list of customers from India who have rented sports movies.
*/
SELECT * FROM customer_list
WHERE country = 'India' AND ID IN 
(SELECT r.customer_id FROM film_list fl,inventory i,rental r WHERE 
fl.category = 'Sports' AND fl.FID = i.film_id AND r.inventory_id = i.inventory_id GROUP BY r.customer_id);
/*
Find out the number of movies in which “SEAN WILLIAMS” acted.
*/
SELECT COUNT(DISTINCT fa.film_id) FROM actor a,film_actor fa
WHERE a.first_name = 'SEAN' AND a.last_name = 'WILLIAMS' AND fa.actor_id = a.actor_id;



