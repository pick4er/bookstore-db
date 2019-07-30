DROP PROCEDURE IF EXISTS bookstore.update_author;
CREATE PROCEDURE update_author(
  _author_id integer
  , _last_name text
  , _first_name text
  , _middle_name text
)
AS $$
  UPDATE bookstore.authors a
  SET (last_name, first_name, middle_name) =
    (_last_name, _first_name, _middle_name)
  WHERE a.author_id = _author_id;
$$ LANGUAGE SQL;
