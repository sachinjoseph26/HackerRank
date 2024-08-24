with project_start_date as (
    select start_date,
    Rank() over (order by start_date) as rank_start
    from projects where start_date not in (select end_date from projects)),
project_end_date as (
    select end_date,
    Rank() over (order by end_date) as rank_end
    from projects where end_date not in (select start_date from projects))

select start_date,end_date from  project_start_date,project_end_date
where rank_start=rank_end
order by datediff(day,start_date,end_date) asc, start_date asc


