DROP VIEW IF EXISTS authors_v;
CREATE OR REPLACE VIEW authors_v AS
SELECT 
  a.author_id,
  author_name(
    a.last_name
    , a.first_name
    , a.middle_name) AS display_name,
  a.last_name,
  a.first_name,
  a.middle_name
FROM bookstore.authors a
ORDER BY display_name;