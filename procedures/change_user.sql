DROP PROCEDURE IF EXISTS change_user;
CREATE PROCEDURE change_user(
  --- profile fields
  _user_id integer
  , _email text
  , _password_hash text
  , _salt text
  , _login text
  --- billing fields
  , _billing_id integer
  , _first_name text
  , _last_name text
  , _middle_name text
  , _phone text
  , _shipping_address text
)
AS $$
BEGIN
  UPDATE bookstore.users
  SET (login, email, password_hash, salt) = 
    (_login, _email, _password_hash, _salt)
  WHERE user_id = _user_id;

  IF _billing_id IS NULL THEN
    PERFORM * FROM bookstore.add_billing(
      _user_id, _first_name, _last_name,
      _middle_name, _phone, _shipping_address
    );
  ELSE
    CALL bookstore.change_billing(
      _billing_id, _first_name, _last_name,
      _middle_name, _phone, _shipping_address
    );
  END IF;
END;
$$ LANGUAGE plpgsql;