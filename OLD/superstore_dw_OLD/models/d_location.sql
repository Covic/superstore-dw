select
    c.city_id,
    c.city as city_name,
    r.region as region_name,
    s.state as state_name,
    co.country as country_name
from {{ source("norm", "t_city") }} c
    join {{ source("norm", "t_region") }} r on c.region_id = r.region_id
    join {{ source("norm", "t_state") }} s on c.state_id = s.state_id
    join {{ source("norm", "t_country") }} co on c.country_id = co.country_id
