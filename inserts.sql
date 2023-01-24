-- admin table
INSERT INTO admins(name, email, password) values (
  'arickett0', 'arickett0@1631.com', 'fasfsadfsdaf'
),
(
  'mregi3', 'mregi3@wufoo1.com', 'fsadf3frcw'
);

-- user table
INSERT INTO users(name, email, last_login, status) values (
  'Codi Toppas','ctoppas0@wisc.edu',	'2022-02-08 03:26:44', 'active'
),
(
  'Lamond Boise', 'lboise1@cdc.gov', '2022-11-26 16:49:58', 'inactive'
),
(
  'Sibel Danzey', 'sdanzey2@example.com', '2023-01-07 16:59:13', 'active'
),
(
  'Madeline Guillem', 'mguillem3@imgur.com', '2022-06-28 19:37:58', 'inactive'
),
(
  'Kristofor Mitchenson', 'kmitchenson4@123-reg.co.uk',	'2022-07-09 20:30:07','active'
);

-- website table
INSERT INTO websites(admin_id, name, url) values (
  1, 'one', 'http://one.com'
),
(
  2, 'two', 'http://two.com'
);

-- session table
INSERT INTO sessions(user_id, website_id, ip_address, browser, os, acquisition_source, landing_page, exit_page, end_time) values (
  1, 1, '242.43.119.222', 'chrome', 'windows', 'organic', 'http://one.com', 'http://one.com/1', '2023-01-27 17:20:39'
),
(
  2, 2, '154.34.26.132', 'brave', 'mac', 'referral', 'http://one.com/2', 'https://one.com/3', '2023-01-24 17:20:39'
),
(
  2, 1, '46.64.105.226', 'chrome', 'linux', 'direct', 'http://one.com/2', 'http://one.com/4', '2023-01-28 19:20:39'
),
(
  2, 1, '46.64.105.226', 'chrome', 'linux', 'direct', 'http://one.com/3', 'http://one.com/5', '2023-01-29 15:20:39'
),
(
  3, 1, '46.64.105.226', 'chrome', 'linux', 'referral', 'http://one.com/5', 'http://one.com/1', '2023-01-25` 15:20:39'
);

-- pageviews table
INSERT INTO pageviews(session_id, previous_page_url, page_url, next_page_url, end_time) values (
  1, 'http://one.com/3', 'http://one.com', 'http://one.com/1', '2023-01-24 17:20:39'
),
(
  1, 'http://one.com/2', 'http://one.com/1', 'http://one.com/2', '2023-01-25 19:20:39'
),
(
  1, 'http://one.com/1', 'http://one.com/2', 'http://one.com/5', '2023-01-27 19:20:39'
),
(
  1, 'http://one.com/3', 'http://one.com/2', 'http://one.com/4', '2023-01-25 18:20:39'
);

INSERT INTO pageviews(session_id, page_url, next_page_url, end_time) values (
  1, 'http://one.com/1', 'http://one.com/3', '2023-01-26 17:20:39'
),
(
  1, 'http://one.com/1', 'http://one.com/2', '2023-01-24 17:20:39'
),
(
  2, 'http://one.com/3', 'http://one.com/2', '2023-01-25 17:20:39'
),
(
  1, 'http://one.com/4', 'http://one.com/1', '2023-01-23 21:20:39'
);

INSERT INTO pageviews(session_id, previous_page_url, page_url, end_time) values (
  2, 'http://one.com/1', 'http://one.com/4', '2023-01-25 17:20:39'
),
(
  3, 'http://one.com/1', 'http://one.com/2', '2023-01-24 17:20:39'
),
(
  3, 'http://one.com/2', 'http://one.com/1', '2023-01-27 20:20:39'
),
(
  4, 'http://one.com/4', 'http://one.com/5', '2023-01-24 22:20:39'
);

INSERT INTO pageviews(session_id, page_url, end_time) values (
  5, 'http://one.com/2', '2023-01-26 21:30:39'
),
(
  2, 'http://two.com/', '2023-01-25 21:30:39'
);



-- events table
INSERT INTO events(page_id, name, category, end_time) values (
  3, 'click', 'mouse event', '2023-01-24 17:20:39'
);
