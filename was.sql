CREATE TABLE users(
  id bigserial primary key not null,
  username varchar(255) not null,
  email varchar(255) unique not null,
  password varchar(255) not null,
  last_login timestamp,
  status varchar(255) check (status in ('active', 'inactive')),
  created_at timestamp not null,
  updated_at timestamp
);

CREATE TABLE websites (
  id bigserial primary key not null,
  website_name varchar(255) not null,
  website_url varchar(255) not null,
  website_created timestamp
);

CREATE TABLE sessions(
  id bigserial primary key not null,
  user_id bigint not null references users(id),
  website_id bigint not null references websites(id),
  start_time timestamp not null,
  end_time timestamp check(end_time > start_time),
  ip_address varchar(255),
  browser varchar(255) not null,
  os varchar(255) not null,
  acquisition_source varchar(255) check (status in ('organic', 'referral', 'direct', 'other')),
  landing_page varchar(255) not null,
  exit_page varchar(255) not null
);

CREATE TABLE pageviews(
  id bigserial primary key not null,
  session_id bigint not null references sessions(id),
  page_url varchar(255) not null,
  next_page_url bigint,
  start_time timestamp not null,
  end_time timestamp check(end_time > start_time),
  scroll_depth decimal,
  exit_intent boolean
);

CREATE TABLE events(
  id  bigserial primary key not null,
  session_id bigint not null references sessions(id),
  event_name varchar(255) not null,
  start_time timestamp not null,
  end_time timestamp check(end_time > start_time),
  event_category varchar(255) not null,
  event_label varchar(255)
);

create unique index user_id_unique_index on users(id);

create unique index sessions_id_unique_index on sessions(id);
create index sessions_user_id_index on sessions(user_id);
create index sessions_website_id_index on sessions(website_id);

create unique index pageviews_id_unique_index on pageviews(id);
create index pageviews_session_id_index on pageviews(session_id);

create unique index events_id_unique_index on events(id);
create index events_session_id_index on events(session_id);

-- user table
INSERT INTO users(username, email, password, last_login, status, created_at, updated_at) values (
  'arickett0', 'arickett0@163.com', 'fasfsadfsdaf', '3/4/2022', 'active', '8/1/2022', '10/2/2022'
);
INSERT INTO users(username, email, password, last_login, status, created_at, updated_at) values (
  'mregi3', 'mregi3@wufoo.com', 'fsadf3frcw', '5/5/2022', 'inactive', '8/2/2022', '10/3/2023'
);
INSERT INTO users(username, email, password, last_login, status, created_at, updated_at) values (
  'smcclurg4', 'teese7@flickr.com', '24fasfsaf', '3/5/2022', 'active', '8/2/2023', '12/3/2022'
);
INSERT INTO users(username, email, password, last_login, status, created_at, updated_at) values (
  'vsamsin6', 'vsamsin6@infoseek.co.jp', '342fdsf', '6/4/2022', 'inactive', '9/1/2022', '10/3/2022'
);
INSERT INTO users(username, email, password, last_login, status, created_at, updated_at) values (
  'lteese7', 'lteese7@flickr.com', 'fasdf24rd', '6/4/2022', 'active', '8/4/2022', '11/2/2022'
);

-- website table
INSERT INTO websites(website_name, website_url, website_created) values (
  'one', 'http://one.com', '3/4/2022'
);

INSERT INTO websites(website_name, website_url, website_created) values (
  'two', 'http://two.com', '6/4/2022'
);

-- session table
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  1, 1, TO_DATE('21/12/2022', 'DD/MM/YYYY'), TO_DATE('23/12/2022', 'DD/MM/YYYY'), '242.43.119.222', 'chrome', 'windows', 'organic', 'http://oracle.com/lacus', 'http://oaic.gov.au/erat/nulla'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  2, 2, TO_DATE('20/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY'), '154.34.26.132', 'brave', 'mac', 'referral', 'http://oracle.com/lacus', 'https://economist.com'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  2, 1, TO_DATE('29/12/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY'), '46.64.105.226', 'chrome', 'linux', 'direct', 'http://oracle.com/lacus', 'http://oracle.com'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  2, 1, TO_DATE('29/12/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY'), '46.64.105.226', 'chrome', 'linux', 'direct', 'http://oracle.com/lacus', 'http://oracle.com'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  3, 1, TO_DATE('18/07/2022', 'DD/MM/YYYY'), TO_DATE('21/11/2022', 'DD/MM/YYYY'), '1.219.200.150', 'opera', 'mac', 'organic', 'https://devhub.com/ac/neque/duis', 'https://devhub.com/ac/neque'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  3, 1, TO_DATE('18/07/2022', 'DD/MM/YYYY'), TO_DATE('21/11/2022', 'DD/MM/YYYY'), '1.219.200.150', 'opera', 'mac', 'direct', 'https://devhub.com/ac/neque/duis', 'https://devhub.com/ac/neque'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  3, 1, TO_DATE('18/07/2022', 'DD/MM/YYYY'), TO_DATE('21/11/2022', 'DD/MM/YYYY'), '1.219.200.150', 'opera', 'mac', 'referral', 'https://devhub.com/ac/neque/duis', 'https://devhub.com/ac/neque'
);
INSERT INTO sessions(user_id, website_id, start_time, end_time, ip_address, browser, os, acquisition_source, landing_page, exit_page) values (
  5, 2, TO_DATE('01/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY'), '207.188.9.23', 'firefox', 'windows', 'other', 'https://spotify.com/natoque', 'https://spotify.com/natoque/penatibus'
);

-- pageviews table
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  1, 'http://oaic.gov.au/erat/nulla/tempus', TO_DATE('21/12/2022', 'DD/MM/YYYY'), TO_DATE('23/12/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  1, 'https://devhub.com/ac/neque/duis', TO_DATE('20/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  1, 'http://oracle.com/lacus', TO_DATE('29/12/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  1, 'http://oracle.com/lacus', TO_DATE('18/07/2022', 'DD/MM/YYYY'), TO_DATE('21/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  1, 'http://oracle.com/lacus', TO_DATE('26/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  2, 'http://oracle.com/lacus', TO_DATE('26/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  3, 'http://oracle.com/lacus', TO_DATE('26/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, start_time, end_time) values (
  4, 'http://oracle.com/lacus', TO_DATE('26/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);
INSERT INTO pageviews(session_id, page_url, next_page_url, start_time, end_time) values (
  4, 'http://oracle.com/lacus', 2, TO_DATE('26/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY')
);

-- events table
INSERT INTO events(session_id, event_name, start_time, end_time, event_category) values (
  3, 'click', TO_DATE('26/11/2022', 'DD/MM/YYYY'), TO_DATE('22/11/2022', 'DD/MM/YYYY'), 'mouse event'
);

1.
SELECT
  COUNT(DISTINCT s.user_id) AS total_user,
  COUNT(*) AS total_sessions,
  SUM(CASE WHEN p.count = 1 THEN 1 ELSE 0 END) / COUNT(s.id)::DECIMAL AS bounce_rate,
  AVG(AGE(s.end_time, s.start_time)) AS session_duration,
  AVG(p.count)
FROM sessions s
JOIN (SELECT session_id, COUNT(DISTINCT page_url) as count FROM pageviews GROUP BY session_id) p ON s.id = p.session_id
WHERE s.website_id = 1;

2.
SELECT
  browser,
  os,
  COUNT(id) AS sessions_count,
  (COUNT(id) * 100.0 / (SELECT COUNT(id) FROM sessions)) AS sessions_percentage
FROM sessions
WHERE website_id = 1
GROUP BY browser, os;

3.
select
  acquisition_source,
  count(*) * 100 / (select count(*) from sessions where website_id = 1)::decimal as sessions_percentage,
  SUM(CASE WHEN (SELECT COUNT(DISTINCT page_url)  FROM pageviews p where p.session_id = s.id) = 1 THEN 1 ELSE 0 END) / COUNT(s.id)::DECIMAL AS bounce_rate,
  AVG(AGE(s.end_time, s.start_time)) AS session_duration,
  (select avg(count) from 
    (SELECT  COUNT(DISTINCT page_url) as count FROM pageviews p 
    JOIN sessions s ON s.id = p.session_id 
    where s.website_id = 1 
    group by s.id) as p)
FROM sessions s
where s.website_id = 1
group by acquisition_source;

--! not working
4.
select
  p.page_url,
  avg(age(p.end_time, p.start_time)) as average_page_time,
  count(p.page_url) * 100 / (select count(*) from sessions)::decimal as Percentage,
  (select )
from sessions s
join pageviews p
on p.session_id = s.id
where website_id = 1
group by p.page_url;

select p.page_url

5.
select 
  landing_page,
  count(landing_page) as landing_page_count,
  count(landing_page)*100 / (select count(*) from sessions)::decimal as Percentage
from sessions
where website_id = 1
group by landing_page;

6.
select 
  exit_page,
  count(exit_page) as exit_page_count,
  count(exit_page)*100 / (select count(*) from sessions)::decimal as Percentage
from sessions
where website_id = 1
group by exit_page;

-- TODO: fix this
7.
select
  page_url,
  (select count(DISTINCT s.user_id) from sessions s where s.landing_page = page_url) as user_landing_count,
  (select page_url from pageviews where id = next_page_url) as First_Interaction
from pageviews
group by page_url;

