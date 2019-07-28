CREATE OR REPLACE FUNCTION author_name(
  last_name text
  , first_name text
  , middle_name text) 
RETURNS text
AS $$
  SELECT 
    last_name || ' ' ||
    left(first_name, 1) || '.' ||
    CASE WHEN middle_name != ''
      THEN ' ' || left(middle_name, 1) || '.'
      ELSE ''
    END;
$$ IMMUTABLE LANGUAGE SQL;