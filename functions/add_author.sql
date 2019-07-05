CREATE OR REPLACE FUNCTION add_author(
  last_name text
  , first_name text
  , middle_name text
) RETURNS integer
AS $$
DECLARE
  author_id integer;
BEGIN
  INSERT INTO bookstore.authors(last_name, first_name, middle_name)
    VALUES (last_name, first_name, middle_name)
    RETURNING authors.author_id INTO author_id;
  RETURN author_id;
END;
$$ VOLATILE LANGUAGE plpgsql;
