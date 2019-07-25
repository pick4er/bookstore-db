CREATE OR REPLACE FUNCTION book_name(book_id integer, title text)
RETURNS text
AS $$
SELECT
  title || '. ' ||
  string_agg(
    bookstore.author_name(
      a.last_name 
      , a.first_name
      , a.middle_name),
    ', ' ORDER BY ash.seq_num)
FROM bookstore.authors a
JOIN bookstore.authorship ash ON a.author_id = ash.author_id
WHERE ash.book_id = book_name.book_id;
$$ STABLE LANGUAGE SQL;