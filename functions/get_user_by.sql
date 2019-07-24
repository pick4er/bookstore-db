DROP FUNCTION IF EXISTS get_user_by;
CREATE OR REPLACE FUNCTION get_user_by(field text, value text)
RETURNS TABLE(LIKE bookstore.users)
AS $$
BEGIN
  CASE field
  WHEN 'login' THEN
    RETURN QUERY SELECT * FROM bookstore.users u WHERE u.login = value;
  WHEN 'email' THEN
    RETURN QUERY SELECT * FROM bookstore.users u WHERE u.email = value;
  END CASE;
END;
$$ VOLATILE LANGUAGE plpgsql;
