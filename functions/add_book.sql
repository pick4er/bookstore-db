CREATE OR REPLACE FUNCTION add_book(title text, authors integer[])
RETURNS integer
AS $$
DECLARE
  book_id integer;
  id integer;
  seq_num integer;
BEGIN
  INSERT INTO bookstore.books(title)
    VALUES (title)
    RETURNING books.book_id INTO book_id;
  FOREACH id IN ARRAY authors LOOP
    INSERT INTO bookstore.authorship(book_id, author_id, seq_num)
      VALUES (book_id, id, seq_num);
    seq_num := seq_num + 1;
  END LOOP;
  RETURN book_id;
END;
$$ VOLATILE LANGUAGE plpgsql;
