DROP FUNCTION IF EXISTS get_user_by;
CREATE OR REPLACE FUNCTION get_user_by(field text, value anyelement)
RETURNS TABLE(LIKE bookstore.users_v)
AS $$
BEGIN
  CASE field
  WHEN 'login' THEN
    RETURN QUERY SELECT * FROM bookstore.users_v u 
      WHERE u.login = value;
  WHEN 'email' THEN
    RETURN QUERY SELECT * FROM bookstore.users_v u 
      WHERE u.email = value;
  WHEN 'user_id' THEN
    RETURN QUERY SELECT * FROM bookstore.users_v u 
      WHERE u.user_id = value;
  END CASE;
END;
$$ VOLATILE LANGUAGE plpgsql;
