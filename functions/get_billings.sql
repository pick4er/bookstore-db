DROP FUNCTION IF EXISTS get_billings;
CREATE FUNCTION get_billings(_user_id integer) 
RETURNS TABLE(LIKE bookstore.billings)
AS $$
  SELECT * FROM bookstore.billings b WHERE b.user_id = _user_id;
$$ VOLATILE LANGUAGE SQL;
