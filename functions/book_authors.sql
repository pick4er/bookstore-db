CREATE OR REPLACE FUNCTION book_authors(book_id integer)
RETURNS text
AS $$
SELECT
  string_agg(
    bookstore.author_name(
      a.last_name 
      , a.first_name
      , a.middle_name),
    ', ' ORDER BY ash.seq_num)
FROM bookstore.authors a
JOIN bookstore.authorship ash ON a.author_id = ash.author_id
WHERE ash.book_id = book_authors.book_id;
$$ STABLE LANGUAGE sql;