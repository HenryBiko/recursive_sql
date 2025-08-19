--select *,row_number() over(order by arrival_time) from buses;
-- select * from Passengers;
with 
recursive cap as 
(
SELECT id,bus_id,capacity,total_passengers ,least(capacity,total_passengers) as ps_board from cte
where id=1

union all

SELECT c.id,c.bus_id,c.capacity,c.total_passengers,least(c.capacity,(c.total_passengers-p.ps_board)) as ps_board
FROM cte c
join cap p on p.id+1=c.id
),

cte as (
select b.id,bus_id,b.capacity,count(1) filter(where  p.arrival_time<=b.arrival_time) total_passengers
from (select *,row_number() over(order by arrival_time) as id  from buses) b
join Passengers p on p.arrival_time<=b.arrival_time
group by 1,2,3)

SELECT bus_id,ps_board as passenger_cnt FROM cap




