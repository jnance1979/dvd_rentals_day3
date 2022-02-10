
-- ####  #1  ####

select address.address_id, district, first_name, last_name
from address
join customer on address.address_id = customer.address_id
where district = 'Texas'
group by district, address.address_id, first_name, last_name

-- ####  #2  ####

select payment.customer_id, first_name, last_name, amount
from payment
join customer on payment.customer_id = customer.customer_id 
where amount > 6.99
group by payment.customer_id, first_name, last_name, amount

-- ####  #3  ####

select customer_id, first_name, last_name, sub.totes from
(select payment.customer_id, first_name, last_name, sum(amount) as totes
from payment
join customer on payment.customer_id = customer.customer_id
group by payment.customer_id, first_name,last_name) sub
where totes > 175
group by customer_id, sub.totes, first_name, last_name

-- ####  #4  ####

 select address.address_id, first_name, last_name, address.city_id, country_id
from address
inner join customer on address.address_id = customer.address_id
inner join city on address.city_id = city.city_id
where country_id = 66
group by address.address_id, first_name, last_name, address.city_id, country_id

-- ####  #5  ####

select first_name, last_name, staff.staff_id, count(staff.staff_id) 
from payment
join staff on payment.staff_id = staff.staff_id
group by staff.staff_id
order by count desc
limit 1;

-- ####  #6  ####

select rating, count(film_id)
from film
group by rating
ORDER BY count DESC 

-- ####  #7  ####

select distinct customer_id, first_name, last_name 
from
(select payment.customer_id, first_name, last_name, amount
from payment
join customer on payment.customer_id = customer.customer_id
where amount > 6.99) sub
group by customer_id, first_name, last_name 
having count(*) = 1

-- ####  #8  ####

select count(*)
from payment
where amount = 0






