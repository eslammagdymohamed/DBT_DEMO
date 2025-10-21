with cte as (
   select   
   to_timestamp(started_at) as started_at,
   date( to_timestamp(started_at)) as date_started_at,
   hour( to_timestamp(started_at)) as hours__started_at,dayname( to_timestamp(started_at)),
   case
   when dayname( to_timestamp(started_at)) in ('Sat','Sun') then 'weekend'
   else 'busineesday'
   end as daytype ,
     case
   when MONTH(to_timestamp(started_at)) in (12,1,2) then 'winter'
   when MONTH(to_timestamp(started_at)) in (3,4,5) then 'spring'
   when MONTH(to_timestamp(started_at)) in (6,7,8) then 'summer'
   else 'autumn'
   end as station_of_year

       from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select * from cte