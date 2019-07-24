DROP FUNCTION IF EXISTS add_user;
CREATE OR REPLACE FUNCTION add_user(
  email text 
  , password_hash text
  , salt text
  , login text DEFAULT NULL
) RETURNS integer
AS $$
DECLARE
  user_id integer;
BEGIN
  INSERT INTO bookstore.users(login, email, password_hash, salt)
    VALUES (login, email, password_hash, salt)
    RETURNING users.user_id INTO user_id;
  RETURN user_id;
END;
$$ VOLATILE LANGUAGE plpgsql;
