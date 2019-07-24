DROP VIEW IF EXISTS users_v;
CREATE OR REPLACE VIEW users_v AS
SELECT
  u.login,
  u.email,
  u.password_hash AS hash,
  u.salt
FROM bookstore.users u
ORDER BY u.login;
