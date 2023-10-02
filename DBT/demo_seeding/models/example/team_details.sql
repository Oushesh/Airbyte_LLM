with teams as (
    select * from {{ref('teams')}}
),

team_locations as (
    select * from {{ref('team_locations')}}
),

final as (
    SELECT
        teams.team,
        team_locations.city,
        team_locations.state

    from teams

    left join team_locations
    on team_locations.name = teams.team
)

select * from final