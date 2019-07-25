DROP FUNCTION IF EXISTS add_billing;
CREATE FUNCTION add_billing(
  user_id integer
  , first_name text
  , last_name text
  , middle_name text
  , phone text
  , shipping_address text
) RETURNS integer
AS $$
DECLARE
  billing_id integer;
BEGIN
  INSERT INTO bookstore.billings(
      user_id, first_name, last_name, 
      middle_name, phone, shipping_address
    ) 
    VALUES (
      user_id, first_name, last_name,
      middle_name, phone, shipping_address
    ) 
    RETURNING billings.billing_id INTO billing_id;
  RETURN billing_id;
END;
$$ VOLATILE LANGUAGE plpgsql;