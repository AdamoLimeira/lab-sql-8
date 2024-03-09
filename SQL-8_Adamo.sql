use Sakila;

#1 
select title, length, rank() over(order by length desc) as ranking
from film
where length is not NULL and length >0;

#2
select title, length, rating, rank() over(order by length desc) as ranking
from film
where length is not NULL and length >0
order by rating;

#3
select c.name as category, count(fc.film_id) as number_of_films
from category c
join film_category fc on c.category_id = fc.category_id
group by c.category_id, c.name
order by number_of_films desc;

#4
select a.actor_id, a.first_name, a.last_name, count(fa.film_id) as num_appearances
from actor a
join film_actor fa on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name
order by num_appearances desc
limit 1;

#5
select c.customer_id, c.first_name, c.last_name, count(r.rental_id) as num_rentals
from customer c
join rental r on c.customer_id = r.customer_id
group by c.customer_id, c.first_name, c.last_name
order by num_rentals desc
limit 1;
                
#Bonus
select f.title as film_title, count(r.rental_id) as num_rentals
from film f 
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.title
order by num_rentals desc
limit 1;