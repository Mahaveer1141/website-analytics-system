# Users table:

- id (primary key)
- username
- email
- password
- date_created
- date_updated
- last_login
- status (active/inactive)

# Website table:

- id primary key
- website_name
- website_url
- website_created

# Sessions table:

- id (primary key)
- user_id (foreign key referencing Users table)
- website_id (foreign key referencing website table)
- start_time
- end_time
- ip_address
- browser
- os
- acquisition_source (enum: "organic", "referral", "direct", "other")
- landing_page
- exit_page

# Pageviews table:

- id (primary key)
- session_id (foreign key referencing Sessions table)
- page_url
- next_page_url
- start_time
- end_time
- scroll_depth (percentage)
- exit_intent (boolean)

# Events table:

- id (primary key)
- session_id (foreign key referencing Sessions table)
- event_name
- start_time
- end_time
- event_category
- event_label
