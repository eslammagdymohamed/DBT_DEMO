{%macro get_season(x)%}
    case
   when MONTH(to_timestamp({{x}})) in (12,1,2) then 'winter'
   when MONTH(to_timestamp({{x}})) in (3,4,5) then 'spring'
   when MONTH(to_timestamp({{x}})) in (6,7,8) then 'summer'
   else 'autumn'
   end 
{%endmacro%}
{%macro day_type(x)%}
   case
   when dayname( to_timestamp({{x}})) in ('Sat','Sun') then 'weekend'
   else 'busineesday'
   end
   {%endmacro%}
