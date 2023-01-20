4.
WITH page_stats AS (
    SELECT 
        page_url,
        COUNT(*) as 'Pageviews',
        SUM(TIMESTAMPDIFF(SECOND, start_time, end_time)) as 'Total Time on Page'
    FROM pageviews 
    JOIN sessions ON sessions.session_id = pageviews.session_id
    GROUP BY page_url
),
SELECT 
    page_stats.page_url AS 'Page URL',
    page_stats.`Pageviews`,
    (page_stats.`Pageviews`* 100.0 / (SELECT SUM(pageviews) FROM page_stats)) AS 'Percentage of Sessions',
    page_stats.`Total Time on Page`/ page_stats.`Pageviews` AS 'Average Time on Page',
    SUM(CASE WHEN pageviews = 1 THEN 1 ELSE 0 END)/COUNT(DISTINCT sessions.session_id) AS 'Bounce Rate'
FROM pageviews
JOIN page_stats ON pageviews.page_url = page_stats.page_url
JOIN sessions ON sessions.session_id = pageviews.session_id
GROUP BY pageviews.page_url
ORDER BY page_stats.`Pageviews` DESC

5.
WITH landing_page_stats AS (
    SELECT 
        landing_page,
        COUNT(DISTINCT session_id) as 'Sessions'
    FROM sessions 
    GROUP BY landing_page
)
SELECT 
    landing_page_stats.landing_page AS 'Landing Page',
    landing_page_stats.`Sessions`,
    (landing_page_stats.`Sessions`* 100.0 / (SELECT COUNT(DISTINCT session_id) FROM sessions)) AS 'Percentage of Sessions'
FROM sessions
JOIN landing_page_stats ON sessions.landing_page = landing_page_stats.landing_page
GROUP BY sessions.landing_page
ORDER BY landing_page_stats.`Sessions` DESC


6.
WITH exit_page_stats AS (
    SELECT 
        exit_page,
        COUNT(DISTINCT session_id) as 'Sessions'
    FROM sessions 
    GROUP BY exit_page
)
SELECT 
    exit_page_stats.exit_page AS 'Exit Page',
    exit_page_stats.`Sessions`,
    (exit_page_stats.`Sessions`* 100.0 / (SELECT COUNT(DISTINCT session_id) FROM sessions)) AS 'Percentage of Sessions'
FROM sessions
JOIN exit_page_stats ON sessions.exit_page = exit_page_stats.exit_page
GROUP BY sessions.exit_page
ORDER BY exit_page_stats.`Sessions`


7.
WITH page_flow AS (
    SELECT 
        user_id,
        landing_page,
        MIN(CASE WHEN landing_page = 'your_page_url' THEN page_url END) AS 'First Interaction',
        MIN(CASE WHEN landing_page = 'your_page_url' THEN 
            (SELECT MIN(page_url) FROM sessions WHERE user_id = page_flow.user_id AND page_url != 'your_page_url')
        END) AS 'Second Interaction'
    FROM sessions
    WHERE landing_page = 'your_page_url' OR page_url = 'your_page_url'
    GROUP BY user_id
)

SELECT
    COUNT(DISTINCT user_id) AS 'Users Landed on Page',
    COUNT(DISTINCT First_Interaction) AS 'First Interaction Count',
    First_Interaction AS 'First Interaction',
    COUNT(DISTINCT Second_Interaction) AS 'Second Interaction Count',
    Second_Interaction AS 'Second Interaction'
FROM page_flow
GROUP BY First_Interaction, Second_Interaction
ORDER BY Users_Landed_on_Page DESC

