-- admin table
INSERT INTO admins(name, email, password) values (
  'arickett0', 'arickett0@163.com', 'fasfsadfsdaf'
);

INSERT INTO admins(name, email, password) values (
  'mregi3', 'mregi3@wufoo.com', 'fsadf3frcw'
);

-- user table
INSERT INTO users(name, email, last_login, status) values (
  'Codi Toppas','ctoppas0@wisc.edu',	'2022-02-08 03:26:44', 'active'
);
INSERT INTO users(name, email, last_login, status) values (
  'Lamond Boise', 'lboise1@cdc.gov', '2022-11-26 16:49:58', 'inactive'
);
INSERT INTO users(name, email, last_login, status) values (
  'Sibel Danzey', 'sdanzey2@example.com', '2023-01-07 16:59:13', 'active'
);
INSERT INTO users(name, email, last_login, status) values (
  'Madeline Guillem', 'mguillem3@imgur.com', '2022-06-28 19:37:58', 'inactive'
);
INSERT INTO users(name, email, last_login, status) values (
  'Kristofor Mitchenson', 'kmitchenson4@123-reg.co.uk',	'2022-07-09 20:30:07','active'
);

-- website table
INSERT INTO websites(admin_id, name, url) values (
  1, 'one', 'http://one.com'
);

INSERT INTO websites(admin_id, name, url) values (
  2, 'two', 'http://two.com'
);

-- session table
INSERT INTO sessions(user_id, website_id, ip_address, browser, os, acquisition_source, landing_page, exit_page, end_time) values (
  1, 1, '242.43.119.222', 'chrome', 'windows', 'organic', 'http://one.com', 'http://one.com/1', '2023-01-22 17:20:39'
);
INSERT INTO sessions(user_id, website_id, ip_address, browser, os, acquisition_source, landing_page, exit_page, end_time) values (
  2, 2, '154.34.26.132', 'brave', 'mac', 'referral', 'http://one.com/2', 'https://one.com/3', '2023-01-23 17:20:39'
);
INSERT INTO sessions(user_id, website_id, ip_address, browser, os, acquisition_source, landing_page, exit_page, end_time) values (
  2, 1, '46.64.105.226', 'chrome', 'linux', 'direct', 'http://one.com/2', 'http://one.com/4', '2023-01-22 19:20:39'
);
INSERT INTO sessions(user_id, website_id, ip_address, browser, os, acquisition_source, landing_page, exit_page, end_time) values (
  2, 1, '46.64.105.226', 'chrome', 'linux', 'direct', 'http://one.com/3', 'http://one.com/5', '2023-01-23 15:20:39'
);
INSERT INTO sessions(user_id, website_id, ip_address, browser, os, acquisition_source, landing_page, exit_page, end_time) values (
  3, 1, '46.64.105.226', 'chrome', 'linux', 'referral', 'http://one.com/5', 'http://one.com/1', '2023-01-24 15:20:39'
);

-- pageviews table
INSERT INTO pageviews(session_id, previous_page_url, page_url, next_page_url, end_time) values (
  1, 'http://one.com/3', 'http://one.com', 'http://one.com/1', '2023-01-22 17:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, next_page_url, end_time) values (
  1, 'http://one.com/2', 'http://one.com/1', 'http://one.com/2', '2023-01-23 19:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, next_page_url, end_time) values (
  1, 'http://one.com/1', 'http://one.com/2', 'http://one.com/5', '2023-01-26 19:20:39'
);
INSERT INTO pageviews(session_id, page_url, next_page_url, end_time) values (
  1, 'http://one.com/1', 'http://one.com/3', '2023-01-23 17:20:39'
);
INSERT INTO pageviews(session_id, page_url, next_page_url, end_time) values (
  1, 'http://one.com/1', 'http://one.com/2', '2023-01-23 17:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, next_page_url, end_time) values (
  1, 'http://one.com/3', 'http://one.com/2', 'http://one.com/4', '2023-01-22 18:20:39'
);
INSERT INTO pageviews(session_id, page_url, next_page_url, end_time) values (
  2, 'http://one.com/3', 'http://one.com/2', '2023-01-23 17:20:39'
);
INSERT INTO pageviews(session_id, page_url, next_page_url, end_time) values (
  1, 'http://one.com/4', 'http://one.com/1', '2023-01-22 21:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, end_time) values (
  2, 'http://one.com/1', 'http://one.com/4', '2023-01-25 17:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, end_time) values (
  3, 'http://one.com/1', 'http://one.com/2', '2023-01-24 17:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, end_time) values (
  3, 'http://one.com/2', 'http://one.com/1', '2023-01-22 20:20:39'
);
INSERT INTO pageviews(session_id, previous_page_url, page_url, end_time) values (
  4, 'http://one.com/4', 'http://one.com/5', '2023-01-22 22:20:39'
);
INSERT INTO pageviews(session_id, page_url, end_time) values (
  5, 'http://one.com/2', '2023-01-22 21:30:39'
);
INSERT INTO pageviews(session_id, page_url, end_time) values (
  2, 'http://two.com/', '2023-01-22 21:30:39'
);



-- events table
INSERT INTO events(page_id, name, category, end_time) values (
  3, 'click', 'mouse event', '2023-01-22 17:20:39'
);
