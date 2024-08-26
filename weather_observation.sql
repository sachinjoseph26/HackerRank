-- A median is defined as a number separating the higher half of a data set from the lower half.
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.

with ranked as (

    select lat_n,
    row_number() over (order by lat_n) as row_a,
    row_number() over (order by lat_n desc) as row_d
    from station

)

select cast(round(lat_n,4) as decimal(10,4)) as median
from ranked
where row_a=row_d or row_a = row_d+1