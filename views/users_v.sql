DROP VIEW IF EXISTS users_v;
CREATE OR REPLACE VIEW users_v AS
SELECT
  --- profile fields
  u.user_id,
  login,
  email,
  password_hash AS hash,
  salt,
  --- billing fields
  billing_id,
  first_name,
  last_name,
  middle_name,
  phone,
  shipping_address
FROM bookstore.users u
LEFT OUTER JOIN bookstore.billings b 
  ON u.user_id = b.user_id
ORDER BY u.login;
