1.
WITH p AS (
  SELECT session_id,
  COUNT(*) as count
  FROM pageviews
  GROUP BY session_id
)
SELECT
  COUNT(DISTINCT s.user_id) AS total_user,
  COUNT(*) AS total_sessions,
  SUM(CASE WHEN p.count = 1 THEN 1 ELSE 0 END) / COUNT(s.id)::DECIMAL AS bounce_rate,
  AVG(AGE(s.end_time, s.start_time)) AS session_duration,
  AVG(p.count)
FROM sessions s
JOIN p
ON s.id = p.session_id
WHERE s.website_id = 1;

-- for day scoping
WITH p AS (
  SELECT session_id,
  COUNT(*) as count
  FROM pageviews
  GROUP BY session_id
)
SELECT
  COUNT(DISTINCT s.user_id) AS total_user,
  COUNT(*) AS total_sessions,
  SUM(CASE WHEN p.count = 1 THEN 1 ELSE 0 END) / COUNT(s.id)::DECIMAL AS bounce_rate,
  AVG(AGE(s.end_time, s.start_time)) AS session_duration,
  AVG(p.count)
FROM sessions s
JOIN p
ON s.id = p.session_id
WHERE s.website_id = 1 and date_trunc('day', s.start_time) = '2023-01-23';


2.
SELECT
  browser,
  os,
  COUNT(id) AS sessions_count,
  (COUNT(id) * 100.0 / (SELECT COUNT(id) FROM sessions where website_id = 1)) AS sessions_percentage
FROM sessions
WHERE website_id = 1
GROUP BY browser, os;

-- day scoping
SELECT
  browser,
  os,
  COUNT(id) AS sessions_count,
  (COUNT(id) * 100.0 / (SELECT COUNT(id) FROM sessions where website_id = 1)) AS sessions_percentage
FROM sessions
WHERE website_id = 1 and date_trunc('day', start_time) = '2023-01-23'
GROUP BY browser, os;


3.
select
  s.acquisition_source,
  count(*) as session_count,
  sum(case when (select count(*) from pageviews p where p.session_id in (
    select
      ss.id
    from sessions ss
    where ss.acquisition_source = s.acquisition_source and
    ss.website_id = 1
  )) = 1 then 1 else 0 end) / count(*)::decimal as bounce_rate,
  AVG(AGE(s.end_time, s.start_time)) AS session_duration,
  (select (p.count) from 
    (select count(*) from pageviews p where p.session_id in (
    select
      ss.id
    from sessions ss
    where ss.acquisition_source = s.acquisition_source and
    ss.website_id = 1)) as p) / count(*)::decimal as avgerage_page_view_per_session
from sessions s
where s.website_id = 1
group by s.acquisition_source;

-- day scoping
select
  s.acquisition_source,
  count(*) as session_count,
  sum(case when (select count(*) from pageviews p where p.session_id in (
    select
      ss.id
    from sessions ss
    where ss.acquisition_source = s.acquisition_source and
    ss.website_id = 1
  )) = 1 then 1 else 0 end) / count(*)::decimal as bounce_rate,
  AVG(AGE(s.end_time, s.start_time)) AS session_duration,
  (select (p.count) from 
    (select count(*) from pageviews p where p.session_id in (
    select
      ss.id
    from sessions ss
    where ss.acquisition_source = s.acquisition_source and
    ss.website_id = 1)) as p) / count(*)::decimal as avgerage_page_view_per_session
from sessions s
where s.website_id = 1 and date_trunc('day', s.start_time) = '2023-01-23'
group by s.acquisition_source;

4.
select
  p.page_url,
  count(*) as count_of_times_page_viewed,
  (select count(sc.c) * 100
  from (select 
          distinct s.id as c 
        from sessions s join pageviews pp on pp.session_id = s.id
        where pp.page_url = p.page_url) as sc) / (select count(*) from sessions where website_id = 1)::decimal as Percentage_of_session,
  avg(age(p.end_time, p.start_time)) as avgerage_time_on_page,
  (select sum(v.case) from (select case when count(pp.id) = 1 then 1 else 0 end from pageviews pp join sessions s on s.id = pp.session_id
    where s.website_id = 1 and pp.page_url = p.page_url group by s.id) as v) / (select count(*) from sessions where website_id = 1)::decimal as bounce_rate
from pageviews p
join sessions s
on s.id = p.session_id
where s.website_id = 1
group by p.page_url
order by count_of_times_page_viewed desc;

-- day scoping
select
  p.page_url,
  count(*) as count_of_times_page_viewed,
  (select count(sc.c) * 100
  from (select 
          distinct s.id as c 
        from sessions s join pageviews pp on pp.session_id = s.id
        where pp.page_url = p.page_url) as sc) / (select count(*) from sessions where website_id = 1)::decimal as Percentage_of_session,
  avg(age(p.end_time, p.start_time)) as avgerage_time_on_page,
  (select sum(v.case) from (select case when count(pp.id) = 1 then 1 else 0 end from pageviews pp join sessions s on s.id = pp.session_id
    where s.website_id = 1 and pp.page_url = p.page_url group by s.id) as v) / (select count(*) from sessions where website_id = 1)::decimal as bounce_rate
from pageviews p
join sessions s
on s.id = p.session_id
where s.website_id = 1 and date_trunc('day', s.start_time) = '2023-01-23'
group by p.page_url
order by count_of_times_page_viewed desc;


5.
select 
  landing_page,
  count(landing_page) as landing_page_count,
  count(landing_page)*100 / (select count(*) from sessions where website_id = 1)::decimal as Percentage
from sessions
where website_id = 1
group by landing_page;

-- day scoping
select 
  landing_page,
  count(landing_page) as landing_page_count,
  count(landing_page)*100 / (select count(*) from sessions where website_id = 1)::decimal as Percentage
from sessions
where website_id = 1 and date_trunc('day', start_time) = '2023-01-23'
group by landing_page;


6.
select 
  exit_page,
  count(exit_page) as exit_page_count,
  count(exit_page)*100 / (select count(*) from sessions where website_id = 1)::decimal as Percentage
from sessions
where website_id = 1
group by exit_page;

-- day scoping
select 
  exit_page,
  count(exit_page) as exit_page_count,
  count(exit_page)*100 / (select count(*) from sessions where website_id = 1)::decimal as Percentage
from sessions
where website_id = 1 and date_trunc('day', start_time) = '2023-01-23'
group by exit_page;

7.
a.
select
  p.page_url,
  (select count(DISTINCT s.user_id) from sessions s where s.landing_page = page_url) as user_landing_count
from pageviews p
join sessions s
on p.session_id = s.id
where s.website_id = 1
group by page_url;

b.
select
  distinct p.next_page_url as first_interaction
from pageviews p
join sessions s
on p.session_id = s.id
where s.website_id = 1 and page_url = 'http://one.com/1' and next_page_url is not null;

select
  p.next_page_url as second_interaction
from pageviews p
join sessions s
on p.session_id = s.id
where s.website_id = 1 and p.previous_page_url = 'http://one.com/1' and page_url in (
  select
    next_page_url
  from pageviews
  where page_url = 'http://one.com/1' and next_page_url is not null
) and next_page_url is not null;

-- day scoping
a.
select
  p.page_url,
  (select count(DISTINCT s.user_id) from sessions s where s.landing_page = page_url) as user_landing_count
from pageviews p
join sessions s
on p.session_id = s.id
where s.website_id = 1 and date_trunc('day', s.start_time) = '2023-01-23'
group by page_url;

b.
select
  distinct p.next_page_url as first_interaction
from pageviews p
join sessions s
on p.session_id = s.id
where s.website_id = 1 and page_url = 'http://one.com/1' and next_page_url is not null and date_trunc('day', s.start_time) = '2023-01-23';

select
  p.next_page_url as second_interaction
from pageviews p
join sessions s
on p.session_id = s.id
where s.website_id = 1 and p.previous_page_url = 'http://one.com/1' and date_trunc('day', s.start_time) = '2023-01-23' and page_url in (
  select
    next_page_url
  from pageviews
  where page_url = 'http://one.com/1' and next_page_url is not null
) and next_page_url is not null;

