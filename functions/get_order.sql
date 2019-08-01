DROP FUNCTION IF EXISTS bookstore.get_order;
CREATE FUNCTION get_order(_order_id integer)
RETURNS TABLE(
  order_id integer
  , date_created date
  , status text
  , buyer json
  , ordered_books json[]
)
AS $$
  SELECT 
    order_id,
    date_created,
    status,
    (
      SELECT json_build_object(
        'login', u.login,
        'email', u.email,
        'shipping_address', u.shipping_address,
        'first_name', u.first_name,
        'last_name', u.last_name,
        'middle_name', u.middle_name
      ) AS buyer
      FROM bookstore.users_v u
      WHERE u.user_id = o.user_id
    ),
    (
      SELECT array_agg(
        json_build_object(
          'title', c.title,
          'onhand_qty', c.onhand_qty,
          'price', c.price,
          'authors', c.authors,
          'authors_ids', c.authors_ids,
          'display_name', c.display_name
        )
      ) AS ordered_books
      FROM bookstore.ordered_books b
      JOIN bookstore.catalog_v c ON b.book_id = c.book_id
      WHERE b.order_id = _order_id
    )
  FROM bookstore.orders o
  WHERE o.order_id = _order_id;
$$ VOLATILE LANGUAGE SQL;
