
-- ============================
-- Assignment 2 Query
-- ============================

SELECT 
    t.name AS theatre_name,
    m.title AS movie_name,
    m.language,
    s.screen_name,
    sd.show_date,
    sd.show_time,
    sd.price
FROM show_details sd
JOIN movie m ON sd.movie_id = m.movie_id
JOIN screen s ON sd.screen_id = s.screen_id
JOIN theatre t ON sd.theatre_id = t.theatre_id
WHERE t.theatre_id = 1
  AND sd.show_date = '2026-02-25'
ORDER BY sd.show_time;


SELECT 
    t.name AS theatre_name,
    m.title AS movie_name,
    m.language,
    s.screen_name,
    sd.show_date,
    sd.show_time,
    sd.price
FROM show_details sd
JOIN movie m ON sd.movie_id = m.movie_id
JOIN screen s ON sd.screen_id = s.screen_id
JOIN theatre t ON sd.theatre_id = t.theatre_id
WHERE t.theatre_id = 2
  AND sd.show_date = '2026-02-25'
ORDER BY sd.show_time;
