DROP PROCEDURE IF EXISTS change_billing;
CREATE PROCEDURE change_billing(
  _billing_id integer
  , _first_name text
  , _last_name text
  , _middle_name text DEFAULT NULL
  , _phone text DEFAULT NULL
  , _shipping_address text DEFAULT NULL
)
AS $$
  UPDATE bookstore.billings
  SET (first_name, last_name, middle_name, phone, shipping_address) =
    (_first_name, _last_name, _middle_name, _phone, _shipping_address)
  WHERE billing_id = _billing_id;
$$ LANGUAGE SQL;