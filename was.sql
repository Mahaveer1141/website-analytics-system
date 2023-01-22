CREATE TABLE admins(
  id bigserial primary key not null,
  name varchar(255) not null,
  email varchar(255) unique check (email = lower(email)) not null,
  password varchar(255) not null,
  created_at timestamp DEFAULT (NOW() at time zone 'utc'),
  updated_at timestamp DEFAULT (NOW() at time zone 'utc') 
);

CREATE TABLE users(
  id bigserial primary key not null,
  name varchar(255),
  email varchar(255) unique,
  last_login timestamp,
  status varchar(255) check (status in ('active', 'inactive')),
  created_at timestamp DEFAULT (NOW() at time zone 'utc'),
  updated_at timestamp DEFAULT (NOW() at time zone 'utc')
);

CREATE TABLE websites (
  id bigserial primary key not null,
  admin_id bigint not null references admins(id),
  name varchar(255) not null,
  url varchar(255) not null,
  created_at timestamp default (now() at time zone 'utc'),
  updated_at timestamp default (now() at time zone 'utc')
);

CREATE TABLE sessions(
  id bigserial primary key not null,
  user_id bigint not null references users(id),
  website_id bigint not null references websites(id),
  ip_address varchar(255),
  browser varchar(255) not null,
  os varchar(255) not null,
  acquisition_source varchar(255) check (acquisition_source in ('organic', 'referral', 'direct', 'other')),
  landing_page varchar(255) not null,
  exit_page varchar(255) not null,
  start_time timestamp default (now() at time zone 'utc'),
  end_time timestamp check(end_time > start_time)
);

CREATE TABLE pageviews(
  id bigserial primary key not null,
  session_id bigint not null references sessions(id),
  page_url varchar(255) not null,
  previous_page_url varchar(255),
  next_page_url varchar(255),
  scroll_depth decimal,
  start_time timestamp default (now() at time zone 'utc'),
  end_time timestamp check(end_time > start_time)
);

CREATE TABLE events(
  id bigserial primary key not null,
  page_id bigint not null references pageviews(id),
  name varchar(255) not null,
  category varchar(255) not null,
  start_time timestamp default (now() at time zone 'utc') not null,
  end_time timestamp check(end_time > start_time)
);

create unique index admins_id_unique_index on admins(id);

create unique index users_id_unique_index on users(id);

create unique index websites_id_unique_index on websites(id);
create index websites_admin_id_index on websites(admin_id);

create unique index sessions_id_unique_index on sessions(id);
create index sessions_user_id_index on sessions(user_id);
create index sessions_website_id_index on sessions(website_id);

create unique index pageviews_id_unique_index on pageviews(id);
create index pageviews_session_id_index on pageviews(session_id);
create index pageviews_page_url_index on pageviews(page_url);

create unique index events_id_unique_index on events(id);
create index events_page_id_index on events(page_id);
