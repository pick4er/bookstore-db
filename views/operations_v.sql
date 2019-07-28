DROP VIEW IF EXISTS operations_v;
CREATE VIEW operations_v AS
SELECT
  o.book_id,
  CASE  
    WHEN o.qty_change > 0 
      THEN 'Поступление'
    ELSE 'Покупка'
  END op_type,
  abs(o.qty_change) qty_change,
  to_char(o.date_created, 'DD.MM.YYYY') date_created
FROM bookstore.operations o
ORDER BY operation_id;
